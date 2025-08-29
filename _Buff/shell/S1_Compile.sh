# !/bin/bash 
set -e -u -o pipefail

export COMP_DIR=$1     # 1 —— 编译工作区；
export SOUR_DIR=$2     # 2 —— 源代码地址
export HEAD_DIR=$3     # 3 —— 头文件地址

pushd "$COMP_DIR" > /dev/null
    printf "\t#$COMP_DIR\n"

    # S1. clang compile *.c -> *.ll
    # (1) basic
    CLANG_INSTRUCT=""
    CLANG_INSTRUCT+="-w "                          # 禁止所有警告信息。
    CLANG_INSTRUCT+="-S "                          # clang生成汇编代码（.s 文件而不是可执行文件），结合-emit-llvm选项会生成LLVM IR文件（.ll 文件）。
    CLANG_INSTRUCT+="-O0 "                         # 禁用优化（生成未优化的代码，便于调试）。
    CLANG_INSTRUCT+="-gline-tables-only "          # 生成最小的调试信息：生成仅包含行号信息的调试信息（最小的调试信息），仅包含源代码行号映射，而不包含完整的调试信息。
    CLANG_INSTRUCT+="-Xclang -disable-O0-optnone " # 用于在-O0级，也禁用所有优化（clang前端的选项）。
    CLANG_INSTRUCT+="-fno-builtin "                # 禁用内置函数优化。编译器不使用内置函数（如__builtin_memcpy等）优化，仅使用标准库函数。
    #-target=riscv64 
    CLANG_INSTRUCT+="-target arm "                 # 指定目标架构(arm / aarch64-linux-gnu)，告诉编译器生成针对ARM架构的代码。
    #-march=armv8
    #-march=rv64gc
    #-march=armv7-a
    CLANG_INSTRUCT+="-march=armv4t "               # 指定目标架构版本为(armv4t)。这会影响生成的代码的指令集和特性。
    CLANG_INSTRUCT+="-mfloat-abi=hard "            # 使用硬(软)浮点ABI，浮点运算将直接使用硬(软)件浮点指令，而不是软件浮点。
    CLANG_INSTRUCT+="-emit-llvm "                  # 生成LLVM中间表示（IR）文件。生成LLVM中间表示（IR）文件。这个选项告诉clang生成.ll 文件，而不是汇编/可执行文件。
    CLANG_INSTRUCT+="-fno-discard-value-names "
    # -mcpu=cortex-a7
    # -mcpu=arm7tdmi

    # (2) head addr
    CLANG_INSTRUCT+="${HEAD_DIR}" | tr ',' '\n' | sed 's/^/-I /'
    # CLANG_INSTRUCT+="-I ${HEAD_DIR} "
    # CLANG_INSTRUCT+="-I /home/fyj/Desktop/vela-opensource/nuttx/include "

    # (3) code addr
    CLANG_INSTRUCT+="${SOUR_DIR}" | tr ',' '\n' | sed 's/$/\/.c/'
    # CLANG_INSTRUCT+="${SOUR_DIR}/*.c "             # 编译源代码目录（${SOUR_DIR}/*.c）下的所有.c文件。指定输入文件。
    # CLANG_INSTRUCT+="${HEAD_DIR}/*.c "

    # printf "##${HEAD_DIR}\n"
    # printf "##${SOUR_DIR}\n"
    printf "${HEAD_DIR}" | tr ',' ' ' | sed 's/^/-I /'
    printf "\n"
    printf "1 clang\n${CLANG_INSTRUCT}\n"
    # clang $CLANG_INSTRUCT # > /dev/null 2>&1
    
    # clang ${SOUR_DIR}/*.c -I ${HEAD_DIR} -target arm 

    # S2. link 链接: llvm-link 把多个 .ll 合并 [llvm-link *.ll s → *unoptimized.ll]
    # llvm-link *.ll -o unoptimized.ll
    # llvm-link $(ls ./*.ll) -o unoptimized.ll

    # S3. Opt 优化 → optimized.ll
    # opt是LLVM的优化工具，用于对LLVM中间表示（IR）文件进行各种优化。它可以加载和运行LLVM Passes（优化模块）。
    OPT_INSTRUCT=""
    # (1) 输入项
    OPT_INSTRUCT+="unoptimized.ll "  # 输入一个未优化的LLVM模块文件。unoptimized.ll为一个未优化的LLVM模块文件；

    # (2) 优化选项
    # 设置opt输出优化的结果为.ll 文件，而非默认的二进制.bc文件。
    OPT_INSTRUCT+="-S "              # opt输出优化后的结果为LLVM IR文件（.ll 文件），而不是默认的二进制.bc文件。
    OPT_INSTRUCT+="-lowerswitch "
    # 将内存访问转换为寄存器访问；这个Pass会将alloca指令（堆栈分配）转换为寄存器，从而提高代码的性能。
    OPT_INSTRUCT+="-mem2reg "        # 将内存访问转换为寄存器访问     这个Pass会将alloca指令（堆栈分配）转换为寄存器，从而提高代码的性能。
    # 简化循环结构(LoopSimplify Pass)：这个Pass会将复杂的循环结构转换为更简单的形式，便于后续优化。其插入Preheader、单一Backedge、唯一Exit Block，消除异常控制流，使循环结构标准化，便于Loop Pass应用。分离循环头（Header）和入口块（Preheader），消除复杂的控制流分支，提升LLVMTA的可分析性。
    OPT_INSTRUCT+="-loop-simplify "  # 简化循环结构                  这个Pass会将复杂的循环结构转换为更简单的形式，便于后续优化。
    # 优化循环中的归纳变量；这个Pass会简化循环中的变量计算，减少冗余操作。
    OPT_INSTRUCT+="-indvars "        # 优化循环中的归纳变量           这个Pass会简化循环中的变量计算，减少冗余操作。
    # 合并冗余指令；这个Pass会查找并合并重复或冗余的指令，减少指令数量。
    OPT_INSTRUCT+="-instcombine "    # 合并冗余指令                  这个Pass会查找并合并重复或冗余的指令，减少指令数量。
    # 死代码消除；这个Pass会移除未使用的指令。
    OPT_INSTRUCT+="-dce "            # 死代码消除                    这个Pass会移除未使用的指令。
    # 全局死代码消除；这个Pass会移除未使用的全局变量和函数。
    OPT_INSTRUCT+="-globaldce "      # 全局死代码消除                这个Pass会移除未使用的全局变量和函数。
    # 生成控制流图（CFG）的.dot 文件。每个函数的控制流图将保存为一个 .dot 文件，例如 .main.dot。和LLVMTA分析功能无关。去掉它不会影响分析结果。
    OPT_INSTRUCT+="-dot-cfg "        # 生成控制流图（CFG）的 .dot 文件。每个函数的控制流图将保存为一个 .dot 文件，例如 .main.dot。
    # (3) 输出项
    OPT_INSTRUCT+="-o optimized.ll"  # 指定输出文件的名称为 optimized.ll。

    # OPT_INSTRUCT="-licm "
    # OPT_INSTRUCT="-loop-rotate "
    # OPT_INSTRUCT="-loop-unroll "
    # OPT_INSTRUCT="-unroll-loops "   # 启用循环展开（Loop Unrolling）优化，默认依据上面-unroll-count值控制展开。 
    # OPT_INSTRUCT="-unroll-count=2 " # 设置循环展开的次数（手动指定为 2 次），即循环体被复制两遍。
    # -verify

    # printf "3 opt\n${OPT_INSTRUCT}\n"
    # opt $OPT_INSTRUCT > /dev/null 2>&1

    # S4. 处理并输出到ll文件
    # while read line; do
    #     if [[ $line =~ ^[[:space:]]*%0 ]]; then
    #         echo "\t$line"
    #         IFS=', '
    #         read -ra parts <<< "$line"
    #         unset IFS
    #         for item in "${parts[@]}"; do
    #             echo "$item"
    #             if [[ $item =~ ^!([0-9]+) ]]; then
    #                 # echo "数字是："${BASH_REMATCH[1]}
    #                 sed -i '/^'$item'/d' optimized.ll
    #             fi
    #         done
    #     fi
    # done < optimized.ll
    # sed -i '/^[[:space:]]*%0/d' optimized.ll

    # S*. 输出CFG图
    # dot -Tpng ."$entrypoint".dot -o "$entrypoint".png

popd > /dev/null    # 2>&1
