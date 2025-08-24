#!/usr/bin/env python3

import os
import shutil
import subprocess

from pathlib import Path
from argparse import ArgumentParser


if __name__ == "__main__":
    global CODE_DIRS, HEAD_DIRS, WORK_DIR, COMP_DIR, ANAL_DIR, ENTRYPOINT

    # ENTRYPOINT="main"
    ENTRYPOINT="nx_pthread_create"

    parser = ArgumentParser('Run llvmta')

    parser.add_argument('-C',   '--code',   type=str,   required=True,  help='sss')
    parser.add_argument('-H',   '--head',   type=str,   required=False, help='hhh')
    parser.add_argument('-W',   '--work',   type=str,   required=True,  help='www')

    args = parser.parse_args()

    # (1) code addr
    CODE_DIRS=args.code.split(",")
    for _sd in CODE_DIRS:
        if not Path(_sd).exists():
           # or not Path(_sd).is_dir():
           exit(1)
    # \ ${SOUR_DIR}/*.c # ${SOUR_DIR}/*.c 编译源代目录下的所有.c文件。
    # _code_list = [ f"{_cd}/*.c" for _cd in CODE_DIRS ]
    _code_list = CODE_DIRS

    # (2) head addr
    HEAD_DIRS=args.head.split(",")
    for _hd in HEAD_DIRS:
        if not Path(_hd).exists():
            # or not Path(_hd).is_dir():
           exit(1)
    _head_list = [ f"-I {_hd}" for _hd in HEAD_DIRS ]
    # _head_list = HEAD_DIRS

    # (3) work path:(comp, anal)
    WORK_DIR=args.work
    if Path(WORK_DIR).exists():
        shutil.rmtree(WORK_DIR)
    os.mkdir(WORK_DIR)

    COMP_DIR=Path(os.path.join(WORK_DIR, "Compile"))
    if COMP_DIR.exists():
        shutil.rmtree(COMP_DIR)
    os.mkdir(COMP_DIR)

    ANAL_DIR=Path(os.path.join(WORK_DIR, "Analysis"))
    if ANAL_DIR.exists():
        shutil.rmtree(ANAL_DIR)
    os.mkdir(ANAL_DIR)

    # print(f"\t{CODE_DIRS}\t{HEAD_DIRS}\n\t{WORK_DIR}\t{COMP_DIR}\t{ANAL_DIR}")

    # S1. Compile(生成IR)
    _pwd = os.getcwd()
    os.chdir(COMP_DIR)
    # (a) clang compile *.c -> *.ll
    _base_list=[
        "clang",
        "-w"                          # 禁止所有警告信息。
        "-S"                          # clang生成汇编代码（.s 文件而不是可执行文件），结合-emit-llvm选项会生成LLVM IR文件（.ll 文件）。
        "-O0"                         # 禁用优化（生成未优化的代码，便于调试）。
        "-Xclang -disable-O0-optnone" # 用于在-O0级禁用所有优化（clang前端的选项）。
        "-fno-builtin"                # 禁用内置函数优化。编译器不使用内置函数（如__builtin_memcpy等）优化，仅使用标准库函数。
        "-target arm"                 # 指定目标架构(arm / aarch64-linux-gnu / -target=riscv64 )，告诉编译器生成针对ARM架构的代码。
        "-march=armv4t"               # 指定目标架构版本为(-march=armv8/armv4t/rv64gc/armv7-a)。这会影响生成的代码的指令集和特性。
        "-mfloat-abi=hard"            # 使用硬(软)浮点ABI，浮点运算将直接使用硬(软)件浮点指令，而不是软件浮点。
        # -mcpu=cortex-a7 / arm7tdmi
        # "-D__AVR__ -D__AVR_ATmega128__"
        "-emit-llvm"                  # 生成LLVM中间表示(IR)文件。生成LLVM中间表示（IR）文件。这个选项告诉clang生成.ll 文件，而不是汇编/可执行文件。
        "-fno-discard-value-names"
    ]

    _clang_comm = ' '.join(_base_list + _head_list + _code_list)
    if os.system(_clang_comm) != 0:
        exit(1)

    # (b) link 链接: llvm-link 把多个 .ll 合并 [llvm-link *.ll s → *unoptimized.ll]    # $(ls ./*.ll)
    if os.system("llvm-link *.ll -o unoptimized.ll") != 0:
        exit(1)

    # (c) Opt 优化 → optimized.ll
    _opt_comm = [
        "opt",              # opt是LLVM的优化工具，用于对LLVM中间表示（IR）文件进行各种优化。它可以加载和运行LLVM Passes（优化模块）。
        # (i) 输入项
        "unoptimized.ll",   # 输入一个未优化的LLVM模块文件。unoptimized.ll为一个未优化的LLVM模块文件；
        # (ii) 优化选项
        "-S",               # opt输出优化后的结果为LLVM IR文件（.ll 文件），而不是默认的二进制.bc文件。
        "-lowerswitch",
        "-mem2reg",         # 将内存访问转换为寄存器访问          这个Pass会将alloca指令（堆栈分配）转换为寄存器，从而提高代码的性能。
        "-indvars",         # 优化循环中的归纳变量               这个Pass会简化循环中的变量计算，减少冗余操作。
        "-loop-simplify",   # 简化循环结构(LoopSimplify Pass)： 这个Pass会将复杂的循环结构转换为更简单的形式，便于后续优化。# 其插入Preheader、单一Backedge、唯一Exit Block，消除异常控制流，使循环结构标准化，便于Loop Pass应用。分离循环头（Header）和入口块（Preheader），消除复杂的控制流分支，提升LLVMTA的可分析性。
        "-instcombine",     # 合并冗余指令                      这个Pass会查找并合并重复或冗余的指令，减少指令数量。
        "-dce",             # 死代码消除                       这个Pass会移除未使用的指令。
        "-globaldce",       # 全局死代码消除                    这个Pass会移除未使用的全局变量和函数。
        "-dot-cfg",         # 生成控制流图（CFG）的 .dot 文件。每个函数的控制流图将保存为一个 .dot 文件，例如 .main.dot。和LLVMTA分析功能无关。去掉它不会影响分析结果。
        # "-licm "
        # "-loop-rotate "
        # "-loop-unroll "
        # "-unroll-loops "   # 启用循环展开（Loop Unrolling）优化，默认依据上面-unroll-count值控制展开。 
        # "-unroll-count=2 " # 设置循环展开的次数（手动指定为 2 次），即循环体被复制两遍。
        # "-verify"
        # (iii) 输出项
        "-o optimized.ll",  # 指定输出文件的名称为 optimized.ll。
    ]

    if os.system(' '.join(_opt_comm) + ' > /dev/null 2>&1') != 0:
        exit(1)

    # (d) 输出CFG图
    # dot -Tpng ."$entrypoint".dot -o "$entrypoint".pn
    if os.system(f"dot -Tpng .{ENTRYPOINT}.dot -o {ENTRYPOINT}.png") != 0:
        exit(1)

    # (e) Vertify
    # llc optimized.ll -filetype=obj -o optimized.o
    os.chdir(_pwd)

    shutil.copy(os.path.join(COMP_DIR, "optimized.ll"), 
                os.path.join(ANAL_DIR, "optimized.ll"))

    # S2. Analysis(分析)
    _pwd = os.getcwd()
    os.chdir(ANAL_DIR)

    # (a) parampter config
    MEM_Latency=100

    L1I_Assoc=8
    L1I_Nsets=128       # 64
    L1I_Linesize=64

    L1D_Assoc=8
    L1D_Nsets=128       # 64
    L1D_Linesize=64

    L2C_Assoc=8
    L2C_Nsets=1024      # 64
    L2C_Linesize=64

    # --mem_latency 150

    # (b) instruct config
    _llvm_comm = [
        "llvmta",
        "-O0",
        "-float-abi=hard", 
        "-mattr=-neon,+vfp2", 
        "-disable-tail-calls", 
        # "-O0-disable-O0-optnone",
        # "-mcpu=arm7tdmi "

        # 一、 LLVMTA General Options:
        "--ta-ana-type=timing "                    # 1.***()
        #"--ta-anainfo-policy=precompall "         # 2.
        f"--ta-analysis-entry-point={ENTRYPOINT}", # 3.  Run WCET Analysis itself 针对每个入口函数:
        #"--ta-comp-type= "                        # 4.  会报错放弃  #  icache,dcache,dramrefresh,sharedbusblocking
        #"--ta-compana-joint-ilp=true "            # 5.
        #"--ta-compana-joint-ilp "
        #"--ta-enable-fixpoint-checks=true " # 6.
        #"--ta-enable-muarchjoin=true "      # 7.
        #"--ta-follow-localwc=<value> "      # 8.  选择要专门跟踪的本地最坏情况
        #"--ta-metric-wcep=<value> "         # 9.  在最坏情况时间路径上需要最大化的指标
        #"--ta-metric-max=<value> "          # 10. 除时间外需要最大化的指标
        #"--ta-pathana-type=<value> "        # 11. 选择路径分析类型，默认为'simpleilp'（简单ILP解决方案）
        "--ta-pathana-type=graphilp",
        "--ta-quiet "                        # 12. 静默模式(不报告进度，不转储详细分析信息) 
        #"--ta-restart-after-external"       # 13. 外部函数调用后重置微架构状态(默认false)
        #"--ta-start-address-code=<uint>"    # 14. 二进制文件中代码段的起始地址
        "--ta-strict=false",                 # 15. 启用严格模式(遇到未知情况时断言，默认true， true可能报错)；
        #"--ta-ucb-clever=true"              # 16. 启用更精确处理空间局部性的 UCB 模式 (默认false)；
        # 1. 求解器相关；
        "--ta-lpsolver=gurobi",              # 1.1 路径分析中的LP求解器选择
        "--ta-lpsolver-effort=maximal",      # 1.2 LP求解器求解精度
        # 2. 输出文件：
        # --ta-dumpb-vcg-graph                    # 2.1 以VCG格式转储状态图(默认为.dot格式)
        # --ta-output-unknown-extfuncs            # 2.2 输出外部函数注解模板文件(默认false)
        # --ta-output-unknown-loops               # 2.3 输出循环注解文件(默认false)
        # 3. 输入文件：
        # --ta-loop-bounds-file=<string>          # 3.1.包含循环界限的文件路径
        # --ta-loop-lowerbounds-file=<string>     # 3.2.包含循环下界的文件路径
        # --ta-extfunc-annotation-file=<string>   # 3.3.外部函数注解文件路径
        # 4. Cache的持久性配置: elementwise; conditionalmust;
        "--ta-icache-persistence=conditionalmust",
        "--ta-dcache-persistence=conditionalmust",
        "--ta-l2cache-persistence=conditionalmust",
        # --ta-l2cache-persistence=elementwise,
        # 5. 抢占：
        # --ta-preemption-dcache-budget=<uint>              # 5.1 抢占可能导致的数据缓存未命中额外数量(默认0)
        # --ta-preemption-icache-budget=<uint>              # 5.2 抢占可能导致的指令缓存未命中额外数量(默认0)
        # --ta-preemptive                                   # 5.3 被分析程序是否可被抢占(默认false)
        # --ta-calculate-slope-interference-curve=<value>   # 5.4. 计算干扰响应曲线的线性近似斜率
        # --ta-compositional-base-bound=<value>             # 5.5.启用组合基础界限计算
        # --ta-dump-interference-response-curve=<value>     # 5.6.转储干扰响应曲线
        # 6. 寄存器地址：
        # --ta-initial-link-register=<uint>                 # 6.1 初始链接寄存器值(默认0x00000000)
        # --ta-initial-stack-pointer=<uint>                 # 6.2 初始栈指针(默认0x08000000)

        # 二、 Context Sensitivity Options:
        # --ta-loop-peel=<uint>                             # 1. 指定在跟踪分区期间要区分的初始循环迭代次数
        # --ta-num-callee-tokens=<int>                      # 2. 调用时区分上下文的被调用方令牌最大数量
        "--ta-num-callsite-tokens=2",                       # 3. 调用时区分上下文的调用点令牌最大数量   # 指定调用点令牌的数量。 这影响分析工具如何处理函数调用。
        # --ta-num-loop-tokens=<int>                        # 4. 循环相关令牌的最大数量

        # 三、 Hardware Platform Configuration Options:
        # 1. L2缓存延迟(默认4，传输单个字需要5周期)
        f"--ta-mem-latency={MEM_Latency}",
        # --ta-L2-latency=<uint>
        # --ta-bgmem-type=<value>         # “sram，simpledram”
        # --ta-dram-refresh-latency=<uint>
        # --ta-mem-per-word-latency=<uint>
        # 2. 指定内存类型为分离缓存（separate caches）。 这影响分析工具如何模拟内存访问。
        "--ta-memory-type=separatecaches",    # none，single，separatecaches，priv-instr-spm-data-shared
        # 3. 指定微架构类型为顺序执行（inorder/outoforder）。 这影响分析工具如何模拟指令的执行顺序。 
        "--ta-muarch-type=outoforder",        # fixedlatency，pret，inorder，strictlyinorder，outoforder(inorder/outoforder)
        # --ta-num-concurrent-cores=<uint>                      # none，roundRobin
        # --ta-stall-on=<value>                                 # dramrefresh，busblocking
        # 4. 指定调用点令牌的数量。 这影响分析工具如何处理函数调用。
        "--ta-unblock-stores=true",

        # 四、 Cache Configuration:
        "--ta-dcache-write-back=true", 
        "--ta-dcache-write-allocate=true", 
        # --ta-dcache-replpol=<value>     # lru，fifo，alwayshit，alwaysmiss
        f"--ta-dcache-assoc={L1D_Assoc}",
        f"--ta-dcache-nsets={L1D_Nsets}",
        f"--ta-dcache-linesize={L1D_Linesize}",
        # f"--ta-Dcache-latency={args.l1_latency}",

 
        # --ta-icache-replpol=<value>     # lru，fifo，alwayshit，alwaysmiss
        f"--ta-icache-assoc={L1I_Assoc}",
        f"--ta-icache-nsets={L1I_Nsets}",
        f"--ta-icache-linesize={L1I_Linesize}",
        # f"--ta-Icache-latency={args.l1_latency}",


        # --ta-l2cache-replpol=<value>    # lru，fifo，alwayshit，alwaysmiss
        f"--ta-l2cache-assoc={L2C_Assoc}",
        f"--ta-l2cache-nsets={L2C_Nsets}",
        f"--ta-l2cache-linesize={L2C_Linesize}",
        # f"--ta-L2-latency={args.l2_latency}",

        # 五、Writeback Analysis:
        # --ta-assume-clean-cache 
        # --ta-dfs-persistence
        # --ta-dirtiness-analysis
        # --ta-statically-refute-writebacks
        # --ta-wb-bound=<value>             # none，store，dfs

        # 六、Array-aware Cache Analysis:
        "--ta-array-analysis=True",
        # --ta-array-must=<value>           # none,conflict-set-intersect,conflict-set-union,conflict-powerset 
        # --ta-array-persis=<value>         # none,setwise

        # 七、Multi-Core Corunner-sensitive Analysis:
        # --ta-access-cycles-joinable-partition-size=<uint>                     - Size of the partitions that are used to decide if two upper bounds on the number of access cycles should be joined. Only has an effect for the arrival curve calculation. By default, all bounds are joined. A value of 1 means only join identical bounds. A value of X means only join bounds that result in the same number if they are both integer divided by X.
        # --ta-arrival-curve-calculation-method=<value>                         - Method used for the calculation of the arrival curve values used in co-runner-sensitive analysis. (default 'ilpbased')
        #   =programGranularity                                                 -   Based on a minimum period and an upper bound on the number of accesses per program run. (potentially less precise)
        #   =ilpbased                                                           -   Based on an ILP implicit path enumeration.
        # --ta-arrival-curve-call-site-get-inner-edges-method=<value>           - Which method to use to detect the inner edges of call sites in the calculation of values on an arrival curve. (default 'insideProgramRuns')
        #   =all                                                                -   all
        #   =insideProgramRuns                                                  -   insideProgramRuns
        #   =betweenInOutReachableSimple                                        -   betweenInOutReachableSimple
        #   =betweenInOutReachableSimplePlus                                    -   betweenInOutReachableSimplePlus
        #   =betweenInOutReachableDetailed                                      -   betweenInOutReachableDetailed
        # --ta-arrival-curve-ilp-objective=<value>                              - Use one of two orthogonal objectives. Or use a combined version that is at least as precise as each variant, but potentially more precise than each one. (default 'variant1')
        #   =variant1                                                           -   Sum up upper bound on event occurrences for each edge.
        #   =variant2                                                           -   Sum up upper bound on event occurrences for each edge that is not first or the last of the path. For every remaining clock cycle of the time window, assume an event.
        #   =combined                                                           -   For each ILP valuation, use the minimum of above two variants as objective.
        # --ta-arrival-curve-ilp-time-limit=<number>                            - The time limit in seconds for one arrival curve value calculation via ILP. 0.0 is the default value. 0.0 means there is no time limit. Note that we strongly recommend using a time limit for the calculation of arrival curve values as it is significantly more complex than the calculation of per-execution-run event bounds.
        # --ta-arrival-curve-loop-get-inner-edges-method=<value>                - Which method to use to detect the inner edges of loops in the calculation of values on an arrival curve. (default 'insideProgramRuns')
        #   =all                                                                -   all
        #   =insideProgramRuns                                                  -   insideProgramRuns
        #   =betweenInOutReachableSimple                                        -   betweenInOutReachableSimple
        #   =betweenInOutReachableSimplePlus                                    -   betweenInOutReachableSimplePlus
        #   =betweenInOutReachableDetailed                                      -   betweenInOutReachableDetailed
        # --ta-blocking-joinable-partition-size=<uint>                          - Size of the partitions that are used to decide if two lower blocking bounds should be joined. Only has an effect in combination with -ta-shared-memory-blocking-type=roundrobin+UBconcurrentaccesscycles. By default, all lower blocking bounds are joined. A value of 1 means only join identical bounds. A value of X means only join bounds that result in the same number if they are both integer divided by X.
        # --ta-co-runner-sensitive                                              - Enables the co-runner-sensitive analysis. By default, is is disabled (false).
        # --ta-co-runner-sensitive-analysis-fixed-point-type=<value>            - Determines which type of fixed point the iterative co-runner-sensitive analysis pursues (default 'greatest')
        #   =least                                                              -   Obtain least fixed point.
        #   =greatest                                                           -   Obtain greatest fixed point.
        # --ta-co-runner-sensitive-dumped-blocked-cycles-scaled-to-accesses     - Dump the impact of the number of concurrently interfering accesses on the WCET bound instead of the concurrently interfering access cycles (default false).
        # --ta-co-runner-sensitive-no-arrival-curve-values                      - Do not perform an arrival curve value calculation in co-runner-sensitive analysis. (default false)
        # --ta-co-runner-sensitive-no-wcet-bound                                - Do not perform a WCET bound calculation in co-runner-sensitive analysis. A value true is not allowed if a relative period is specified. (default false)
        # --ta-conc-acc-cyc-bounds=<string>                                     - Expects a list of natural numbers with semicolon as delimeter. The number of elements in the list must be a multiple of -ta-num-concurrent-cores and must not be 0.
        # --ta-program-period=<uint>                                            - How many cycles at least have to pass between two starts of the program under a periodic scheduling. The default value 0 means that no periodic scheduling is assumed to lower bound the time between two program starts.
        # --ta-program-period-rel=<number>                                      - value >= 1 means period is value * wcetAssumingMaxInterference. value < 1 means period is wcetAssumingNoInterference + value * (wcetAssumingMaxInterference - wcetAssumingNoInterference). Negative factor values are OK. If the resulting absolute period would be negative, it is assumed as 0. If the relative period is specified, it overwrites a possible absolute period.
        # --ta-program-period-rel-eval-wrt-wcet-ignoring-interference           - If this is true, the relative period is multiplied with a wcet bound ignoring the interference to obtain the absolute period.
        # --ta-program-period-subpath-method                                    - Use the subpath method for more precision when taking into account the program period.
        # --ta-until-iteration-measurement=<int>                                - Perform dedicated measurements from the start until the end of the iteration for as many iterations as this parameter states. Note that there is also an iteration 0. A negative value disables this dedicated measurements. This parameter is ignored in co-runner-insensitive analysis.

        # 八、 TODo:
        # --Timing anomaly analysis, state splitting                            - (default 'T')
        # --core=<uint>                                                         - The core for the analysis (default '0')
        # --parallel-programs                                                   - Parallel Program Analysis
        # --ta-multicore-type=<value> # :多核分析;：liangy、none
        #"--ta-multicore-type=none "

        f"--core-info=/workspaces/llvmta/workspace/CoreInfo.json",
        f"--core-numbers=1",
        "--shared-cache-persistence-analysis=false",

        # (*)
        "-debug-only=", 
        # -debug-only=all 
        # --debug-entry-values
    ]

    # (b) 使用llvmta分析外部函数信息。输出外部函数注解模板文件(默认false)
    if os.system(' '.join(_llvm_comm + ["--ta-output-unknown-extfuncs=true", "optimized.ll"]) + \
                     " > /dev/null 2>&1") != 0:
        exit(1)

    # (c) 使用 llvmta 分析循环信息。输出循环注解文件(默认false)
    if os.system(' '.join(_llvm_comm + ["--ta-output-unknown-loops=true", "optimized.ll"]) + \
                     " > /dev/null 2>&1") != 0:
        exit(1)

    # (d) vcg
    # if os.system(' '.join(_llvm_comm + ["--ta-dumpb-vcg-graph", "optimized.ll"]) +
    #              " > /dev/null 2>&1") != 0:
    #     exit(1)

    # (e) Loop Bound Update;
    shutil.copy(os.path.join(ANAL_DIR, "LoopAnnotations.csv"), 
                # os.path.join(CODE_DIRS[0], "LoopAnnotations.csv"))
                os.path.join( os.path.dirname(CODE_DIRS[0]), "LoopAnnotations.csv"))
   
    os.chdir( os.path.dirname(CODE_DIRS[0]) )

    shutil.copy("LoopAnnotations.csv", "LLoopAnnotations.csv")

    subprocess.run(["python3", "/workspaces/llvmta/testcases/quickGetBound.py", f"-s./" ])
    shutil.move("LoopAnnotations.csv", os.path.join(ANAL_DIR, "LoopAnnotations.csv"))
    shutil.move("LLoopAnnotations.csv", os.path.join(ANAL_DIR, "LLoopAnnotations.csv"))

    os.chdir(ANAL_DIR)

    # (f) WCET Analysis
    # bound=$(\
    # 2>&1 | grep "Calculated Timing Bound" | awk '{print $NF}')
    # echo "Bound:$bound"
    if os.system(' '.join(_llvm_comm + ["--ta-loop-bounds-file=LoopAnnotations.csv",
                                        "--ta-loop-lowerbounds-file=LLoopAnnotations.csv",
                                        "--ta-restart-after-external",
                                        "--ta-extfunc-annotation-file=ExtFuncAnnotations.csv",
                                        "-debug-only=", "optimized.ll"])
                                        ) != 0:
        exit(1)

    # (g) 输出AEG图
    # sed 's/|->/maps to/g' StateGraph_Time.dot > AEG.dot
    # dot -Tpng AEG.dot -o output.png
    # ***_BUFFX

    # Sx.* 输出AEG图;
    # dot -Tpng StateGraph_Time.dot -o output.png    # S2B 输出AEG图

    os.chdir(_pwd)

    # S3. 总编译
    # ./run.sh \
    #   /workspaces/llvmta/workspace/test \
    #   /workspaces/llvmta/workspace/test/code \
    #   /workspaces/llvmta/workspace/test/head

# if not cf.exists():
#     exit(1)
# out_dir = Path(os.path.abspath(args.out))
# if not out_dir.exists():
#     out_dir.mkdir(parents=True)
# if not out_dir.is_dir():
#     exit(1)
# stat = os.system(f'./runBeforeGDB {str(src_dir)}')
# if stat != 0:
#     exit(1)
# pwd = os.getcwd()
# os.chdir(args.tmp)
# stat = os.system(' '.join(command))
# if stat != 0:
#     exit(1)
# else:
#     # shutil.copy('WCET.json', out_dir)
# os.chdir(pwd)

# (3)
# shutil.copy('LoopAnnotations.csv', out_dir / 'LoopAnnotations.csv')
# shutil.copy('LoopAnnotations.csv', 'LLoopAnnotations.csv')
# with open('LoopAnnotations.csv', 'r') as f:
# data = f.readlines()
# output_data = list()
# for i in range(len(data)):
# if i != 0 and data[i].startswith('#'):
    # continue
# output_data.append(data[i])            
# with open('LoopAnnotations.csv', 'w') as f:
# f.writelines(output_data)            
# with open('LLoopAnnotations.csv', 'r') as f:
# data = f.readlines()

# output_data = list()
# for i in range(len(data)):
#     if i != 0 and data[i].startswith('#'):
#         continue
#     output_data.append(data[i])        
# with open('LLoopAnnotations.csv', 'w') as f:
#     f.writelines(output_data)
# shutil.copy('LoopAnnotations.csv', src_dir / 'LoopAnnotations.csv')
# shutil.copy('LoopAnnotations.csv', src_dir / 'LLoopAnnotations.csv')
# shutil.copy('LoopAnnotations.csv', out_dir / 'LoopAnnotations.csv')
# shutil.copy('LoopAnnotations.csv', out_dir / 'LLoopAnnotations.csv')


# p = subprocess.Popen(
#     [
#         'python3', 
#         'quickGetBound.py',
#         '-s',
#         f'{str(src_dir)}',
#     ], 
#     env = os.environ.copy(), 
#     cwd = pwd,
#     stdout = subprocess.PIPE,
#     stderr = subprocess.PIPE
# )
# p.wait()

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





## 1.3 编译与执行可执行文件
# - 编译可执行文件
# 3. 链接.o → .elf.o 生成可执行文件
# arm-linux-gnueabihf-gcc optimized.o -static -o $last_part
# arm-linux-gnueabihf-gcc optimized.o -static -o /workspaces/llvmta/testcases/workspace/ret/$last_part
# arm-linux-gnueabihf-gcc optimized.o -static -o /workspaces/llvmta/testcases/workspace/ret/optimized


# S5. 如果指定 --llvmta-build-mif：
#     - 编译成 .s → .o
#     - 链接生成 binary
# Convert the compiled binary to a FPGA compatible .mif file
# if [[ "$build_mif" = true ]]; then
#   First ensure that all the required compiled files exist
# 	ensure_mif_prereqs
# 	cp "$MIF_UTILS/init.o" "$MIF_UTILS/hex_to_mif/hex2mif" "$MIF_UTILS/minimal.ld" .
# 	arm-none-eabi-as "${llvmta_entry[0]}/optimized.s" -o optimized.o
# 	arm-none-eabi-ld -Tminimal.ld  init.o optimized.o -o final_binary -static -L/usr/lib/gcc/arm-none-eabi/7.2.0 -lgcc
# 	arm-none-eabi-objcopy -O ihex --reverse-bytes=4 final_binary final_binary.hex
# 	"$MIF_UTILS"/hex_to_mif/hex2mif final_binary
# fi


# 测试可执行文件(Excution test)
# S6. 执行结束后cleanup把WORKDIR移动为TESTCASE_DIR/build
# if [ -f a.out ]; then
#     $EXEC ./a.out &>/dev/null
#     RETURNVALUE=$(echo $?)
#     if [ $RETURNVALUE -eq 0 ]; then
#         printf "passed. \n"
#         ((PASS++))
#     else
#         printf "failed (wrong return value $RETURNVALUE). \n"
#         ((FAIL_EXEC++))
#     fi
# else
#     printf "failed (compiled with errors/warnings). \n"
#     ((FAIL_COMP++))
# fi
