#!/bin/bash

set -e -u -o pipefail

STime=$(date +%s)

SOUR_DIR=$1
# WORK_DIR="$SOUR_DIR"/buff
# WORK_DIR="$SOUR_DIR"/buff
WORK_DIR="$SOUR_DIR"/compile
PRO_NAME="${SOUR_DIR##*/}"

printf "\t\t$SOUR_DIR\n"
printf "\t\t$WORK_DIR\n"
printf "\t\t$PRO_NAME\n"

# * 编译输出可执行文件；
pushd "$WORK_DIR" > /dev/null
    # S5. 编译检测；
    # llvm-as optimized.ll -o /dev/null

    # (1) .ll转成 .bc
    llvm-as optimized.ll -o optimized.bc

    # (2) .bc 编译成 .o
    # llc optimized.bc -filetype=obj -o optimized.o     # 指定 ARM 架构
    # llc -march=arm -mattr=-neon,+vfp2 -float-abi=hard optimized.bc -filetype=obj -o optimized.o
    # llc -march=arm -mattr=+v4t,+vfp2 -float-abi=hard optimized.bc -filetype=obj -o optimized.o
    # -mattr=+v4t,+vfp2
    # llc -march=arm                   -float-abi=hard optimized.bc -filetype=obj -o optimized.o

    # (3) 链接.o → .elf.o 生成可执行文件
    # ld optimized.o -o optimized.elf   # 用交叉gcc，不用ld）
    # aarch64-linux-gnu-gcc opt64.o -o main_arm64
    # arm-linux-gnueabihf-gcc optimized.o -static -o optimized
    # arm-linux-gnueabihf-gcc optimized.o -static -o /workspaces/llvmta/testcases/workspace/ret/$PRO_NAME
    # aarch64-linux-gnu-gcc optimized.o -o /workspaces/llvmta/testcases/workspace/ret/$PRO_NAME
    arm-linux-gnueabihf-gcc optimized.o -o /workspaces/llvmta/testcases/workspace/ret/$PRO_NAME
    # aarch64-linux-gnu-gcc optimized.o -o /workspaces/llvmta/testcases/workspace/ret/$PRO_NAME
    # aarch64-linux-gnu-gcc -O0 -fno-builtin "$SOUR_DIR"/*.c  -o /workspaces/llvmta/testcases/workspace/ret/$PRO_NAME
    # clang --target=aarch64-linux-gnu -fuse-ld=lld optimized.o -o /workspaces/llvmta/testcases/workspace/ret/$PRO_NAME

    # dot -Tpng ."$entrypoint".dot -o "$entrypoint".png
popd > /dev/null
ETime=$(date +%s)

# %0 = call i32 asm sideeffect "mov $0, sp\0A", "=r"() #4, !dbg !32, !srcloc !33
# S5. 如果指定 --llvmta-build-mif：
#     - 编译成 .s → .o
#     - 链接生成 binary
# Convert the compiled binary to a FPGA compatible .mif file
# if [[ "$build_mif" = true ]]; then
# 	# First ensure that all the required compiled files exist
# 	ensure_mif_prereqs
# 	cp "$MIF_UTILS/init.o" "$MIF_UTILS/hex_to_mif/hex2mif" "$MIF_UTILS/minimal.ld" .
# 	arm-none-eabi-as "${llvmta_entry[0]}/optimized.s" -o optimized.o
# 	arm-none-eabi-ld -Tminimal.ld  init.o optimized.o -o final_binary -static -L/usr/lib/gcc/arm-none-eabi/7.2.0 -lgcc
# 	arm-none-eabi-objcopy -O ihex --reverse-bytes=4 final_binary final_binary.hex
# 	"$MIF_UTILS"/hex_to_mif/hex2mif final_binary
# fi

# S6. 执行结束后cleanup把WORKDIR移动为TESTCASE_DIR/build