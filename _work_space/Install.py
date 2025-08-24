#!/usr/bin/env python3

import os
import shutil
import subprocess

from pathlib import Path
from argparse import ArgumentParser


if __name__ == "__main__":


    # 1. 依赖库安装
    # > /dev/null 2>&1
    if os.system("sudo apt-get update --fix-missing") != 0:
        exit(1)

    PAGES=[
        "build-essential",
        "ccache",
        "clangd",
        "clang-tidy",
        "cmake",
        "fakeroot",
        "fish",
        "gcc",
        "gcc-multilib",
        "gdb",
        "git",
        "htop",
        "icecc",
        "icecream-sundae",
        "libboost-all-dev",
        "libcolamd2",
        "liblpsolve55-dev",
        "libncurses5",
        "libtinfo5",
        "lld",
        "lldb",
        "lp-solve",
        "make",
        "ninja-build",
        "parallel",
        "python3-pip",
        "time",
        "wget",
        "zsh"
    ]

    if os.system("sudo apt-get -y install --no-install-recommends --fix-missing " + " ".join(PAGES)) != 0:
        exit(1)
        
    if os.system("pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple numpy") != 0:
        exit(1)

    print("# # # # # # # # # #")
    # 2. 下载source文件
    # (1) Set environment variables
    WORK_DIR="/home/fyj/data"
    USER_LIB="/usr/lib"

    # DEBIAN_FRONTEND=noninteractive
    os.chdir("/opt")

    # (2) lp_solve install 
    LS_SDIR=os.path.join(f"{USER_LIB}", f"lp_solve/liblpsolve55.so")
    LS_TDIR=os.path.join(f"{USER_LIB}", f"liblpsolve55.so")

    print(LS_TDIR)
    if not Path(LS_TDIR).exists():
        if os.system(f"sudo ln -s {LS_SDIR} {LS_TDIR}") != 0:
            exit(1)

    # (3) gurobi install
    GUROBI_VERS=['12', '0', '3']
    GUROBI_FILE=f"gurobi{''.join(GUROBI_VERS)}"
    GUROBI_PACK=f"gurobi{'.'.join(GUROBI_VERS)}_linux64.tar.gz"
    GUROBI_BASE=os.path.join(os.getcwd(), GUROBI_FILE)
    GUROBI_HOME=os.path.join(GUROBI_BASE, f"linux64")
    LD_LIBRARY_PATH=os.path.join(GUROBI_HOME, f"lib")    
    CPLUS_INCLUDE_PATH=os.path.join(GUROBI_HOME, f"include")

    if not Path(GUROBI_FILE).exists():
        if os.system(f"sudo wget https://packages.gurobi.com/{GUROBI_VERS[0]}.{GUROBI_VERS[1]}/{GUROBI_PACK}; \
                    sudo tar xfz {GUROBI_PACK}; \
                    sudo rm {GUROBI_PACK}") != 0:
            exit(1)
        
    GB_TDIR=os.path.join(f"{USER_LIB}", f"libgurobi.so")
    GB_SDIR=os.path.join(f"{LD_LIBRARY_PATH}", f"libgurobi{''.join(GUROBI_VERS)}.so")

    print(GB_TDIR)
    if os.path.exists(GB_TDIR):
    # if not Path(GB_TDIR).exists():
        if os.system(f"sudo ln -s {GB_SDIR} {GB_TDIR}") != 0:
            exit(1)

    # PATH="${PATH}:f{GUROBI_HOME}/bin"
    # LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
    # CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:${GUROBI_HOME}/include"
    # GRB_LICENSE_FILE=/workspaces/llvmta/dependencies/gurobi.lic

    # source ~/.bashrc  # 立即生效

    # # 1. arm
    # wget https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi.tar.xz
    # sudo tar -xJf arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi.tar.xz -C /opt
    # echo 'export PATH="/opt/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi/bin:$PATH"' >> ~/.bashrc

    # # 2. aarch64
    # wget https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-elf.tar.xz
    # sudo tar -xJf arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-elf.tar.xz -C /opt
    # echo 'export PATH="/opt/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-elf/bin:$PATH"' >> ~/.bashrc

    # # 3. riscv
    # wget https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz
    # sudo tar -xzf riscv64-unknown-elf-toolchain-*.tar.gz -C /opt
    # echo 'export PATH="/opt/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin:$PATH"' >> ~/.bashrc

    os.chdir(f"{WORK_DIR}")

    # (3) LLVM
    # LLVM_VERS=["14", "0", "6"]
    # # LLVM_HOME=os.path.join(f"{WORK_DIR}", f"llvm-project")

    # LLVM_DIR=os.path.join(WORK_DIR, "LLVM")
    # if Path(LLVM_DIR).exists():
    #     if os.system(f"sudo rm {LLVM_DIR}") != 0:
    #         exit(1)
    # os.mkdir(LLVM_DIR)
    # if os.system(f"git clone https://github.com/llvm/llvm-project.git -b llvmorg-{'.'.join(LLVM_VERS)} LLVM") != 0:
    #     exit(1)

    # PATH=${PATH}:/workspaces/llvm/build/bin
    # PATH="${PATH}:${LLVM_HOME}/build/bin"

    # (3.1) llvm安装
    # LLVM_VER="llvm-14.0.6"
    # if os.system(f"wget https://github.com/llvm/llvm-project/releases/download/llvmorg-{LLVM_VERSION}/llvm-{LLVM_VER}.src.tar.xz") != 0:
    #     exit(1)
    # tar -xf $LLVM_VER.src.tar.xz
    # rm $LLVM_VER.src.tar.xz
    
    # (3.2) clang安装
    # CLANG_VER="clang-14.0.6"
    # wget https://github.com/llvm/llvm-project/releases/download/llvmorg-$LLVM_VERSION/$CLANG_VER.src.tar.xz
    # tar -xf $CLANG_VER.src.tar.xz 
    # rm $CLANG_VER.src.tar.xz 

    # pushd $LLVM_VER.src || exit
    #     patch -p1 < ../../dependencies/patches/$LLVM_VER.llvmta.diff 
    # popd

    # (2) TAM安装
    # TAM_HOME=f"{WORK_DIR}/llvm-project"
    # PATH=$PATH:/workspaces/llvmta/build/bin    
    # mkdir TAM
    # git clone https://github.com/RTS-SYSU/Timing-Analysis-Multicores.git TAM

    # (3) LLVMTA安装
    # mkdir LLVMTA
    # git clone https://gitlab.cs.uni-saarland.de/reineke/llvmta.git LLVMTA

    # # # # # # # # 
    # RUN echo "set completion-ignore-case on" >> /etc/inputrc
    # # # # # # # # 


"""
# (1) Docker安装
# docker build -t llvmtadocker:latest - < .devcontainer/Dockerfile

# (2) 运行
# a. linux 环境
docker run -i -d -v {$TPATH}:/workspaces/llvmta:rw -v {$TPATH}:/workspaces/llvmta/build:rw \
	--name XXX llvmtadocker:latest

# b. windows 环境
docker run -i -d -v %cd%:/workspaces/llvmta:rw -v %cd%/build:/workspaces/llvmta/build:rw \
	--name XXX llvmtadocker:latest


####################################
cmake 
# ## 1. 编译器工具链选择 
# (1) 指定使用gcc作为C语言的编译器，用于编译LLVM中的C语言组件（如运行时库、底层工具）。 
-DCMAKE_C_COMPILER=gcc

# (2) 指定使用g++作为C++语言的编译器，用于编译LLVM的核心C++组件（如LLVM IR库、前端接口、优化 passes）。 
-DCMAKE_CXX_COMPILER=g++

# ## 2. 构建配置类型 
# 设置构建类型为Debug（调试模式）。此模式下： 
#   1）编译器会保留完整的调试符号（便于使用GDB等工具定位崩溃位置） 
#   2）禁用大部分优化（避免优化导致的代码逻辑变化，便于调试） 
-DCMAKE_BUILD_TYPE=Debug #Release

# ## 3. 编译信息导出 # 生成compile_commands.json文件（存放在构建目录中）
# 该文件记录了每个源文件的完整编译命令（包括编译器标志、包含路径、宏定义）
# 是Clangd（LLVM的C++语言服务器）等工具实现精准代码分析、自动补全的必要输入
-DCMAKE_EXPORT_COMPILE_COMMANDS=1

# ## 4. 警告抑制
# （1）禁用CMake的“开发者专用警告”（如未使用的CMake变量、过时的CMake脚本语法）。减少构建日志中的无关噪音，聚焦于关键错误。 
-Wno-dev

# （2）禁用“建议使用override关键字”的警告（C++11特性，用于显式标记重写基类虚函数）。适用于维护旧代码（未全面使用override）的场景，避免过多警告干扰。
-Wno-suggest-override
 
# ## 5. LLVM核心功能配置
# (1) 配置LLVM使用LLD（LLVM链接器）作为默认链接器（替代系统默认的ld.bfd或gold）。LLD是LLVM项目的一部分，针对LLVM IR优化，链接速度更快，尤其适合大型项目（如LLVM自身构建）。
-DLLVM_USE_LINKER=lld

# (2) 开启运行时类型信息（RTTI）支持。允许LLVM组件在运行时通过dynamic_cast获取对象的实际类型（例如，前端处理多态AST节点时），是部分LLVM passes（如代码生成）的必要功能。
-DLLVM_ENABLE_RTTI=ON

# (3) 开启异常处理（EH）支持。使LLVM生成的代码支持C++异常（如try-catch块），适用于需要异常处理的前端语言（如C++、Swift）。
-DLLVM_ENABLE_EH=ON

# (4) 开启断言检查（仅在Debug模式下有效）。在LLVM内部代码中插入assert语句，用于检测非法状态（如空指针解引用、数组越界），帮助开发者快速定位代码bug。 
-DLLVM_ENABLE_ASSERTIONS=ON

# (5) 排除LLVM基准测试套件的构建。基准测试用于评估LLVM各组件的性能（如IR优化、代码生成速度），对普通用户无用，关闭后可减少构建时间和磁盘占用。
-DLLVM_INCLUDE_BENCHMARKS=OFF
 
# (6) 指定LLVM支持的目标架构为ARM、RISC-V和X86。LLVM会根据此配置生成对应架构的代码生成器（Code Generator），仅编译需要的目标，缩短构建时间（例如，若无需支持PowerPC，可省略该架构）。
-DLLVM_TARGETS_TO_BUILD="ARM;RISCV;X86"

# ## 6. 外部依赖配置
# (1) 指向外部Clang（LLVM的C/C++前端）源码目录（版本由环境变量$CLANG_VER指定）。
# LLVM会使用该目录下的Clang源码，而非从源码构建Clang，确保使用特定版本的Clang（避免版本冲突）。
-DLLVM_EXTERNAL_CLANG_SOURCE_DIR=../dependencies/$CLANG_VER.src 


# (2) 指定外部LLVMTA（LLVM TableGen辅助项目）的源码目录（位于当前构建目录的父目录）
# LLVMTA用于生成LLVM TableGen文件（描述目标架构的指令集、寄存器等），集成自定义TableGen定义到LLVM构建中 
-DLLVM_EXTERNAL_LLVMTA_SOURCE_DIR=/home/fyj/Desktop/Timing-Analysis-Multicores\ 
# -DLLVM_EXTERNAL_LLVMTA_SOURCE_DIR=..
# -DLLVM_EXTERNAL_LLVMTA_SOURCE_DIR=$TAM_HOME

# (3) 声明llvmta为外部项目。
# 告知CMake将该项目的源码纳入构建流程（编译其源码、链接其生成的库），确保LLVM能使用LLVMTA提供的功能。
-DLLVM_EXTERNAL_PROJECTS="llvmta"

-DLLVM_ENABLE_PROJECTS=clang;clang-tools-extra

# ## 7. 动态库构建
# (1) 开启LLVM动态库（.so/.dll）的构建。
# 将LLVM的核心组件(如IR库、优化 passes)编译为动态库，而非静态库。
-DLLVM_BUILD_LLVM_DYLIB=ON 

# ## 8. 构建系统选择 # 生成Ninja构建文件（而非传统的Makefile）。 
# Ninja是专注于速度的构建系统，擅长处理大型项目的增量构建（仅编译修改过的文件），显著缩短LLVM的构建时间（尤其是后续的ninja命令执行阶段）。 
-GNinja
-G "Unix Makefile"
-G "Unix Makefiles" 

# ## 9. 源码目录与日志输出
# 指定LLVM源码的根目录。该目录应包含LLVM的CMakeLists.txt文件（构建入口）。 
../llvm
$LLVM_HOME/llvm

# ../dependencies/$LLVM_VER.src
# ../dependencies/$CLANG_EXTRA_VER.src
 
echo $INSTRUCTION
cmake $INSTRUCTION

# mv compile_commands.json ../compile_commands.json
# popd
# | tee -a $log_file：将CMake的输出同时显示在终端（实时查看配置进度）和追加到$log_file文件中（保存配置日志）。

"""