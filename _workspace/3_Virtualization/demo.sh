# !/bin/bash

# set -e -u -o pipefalil

# # # # # # # # # # # #
# S1. Initial
# # # # # # # # # # # #

# make	                  4.2.1
# dtc	                     1.5.0
# gcc	                     9.3.0
# mkimage	                20.10
# cmake	                  3.20.0
# ninja	                  1.10.1

# sudo apt update
# sudo apt upgrade
# sudo apt install build-essential bison flex git libssl-dev ninja-build \
#         u-boot-tools pandoc libslirp-dev pkg-config libglib2.0-dev \
#         libpixman-1-dev gettext-base curl xterm cmake python3-pip xilinx-bootgen > /dev/null

# python3相关依赖
# pip3 install pykwalify packaging pyelftools

# git clone https://github.com/bao-project/bao-helloworld.git
# pushd "/home/fyj/Desktop/bao-helloworld" > /dev/null

# git clone https://github.com/bao-project/bao-demos
pushd "/home/fyj/Desktop/bao-demos" > /dev/null
    # # 1 arm-none-eabi-gcc 11.3.1
    # export CROSS_COMPILE=arm-none-eabi-gcc
    # # 2 aarch64-none-elf-gcc 11.2.1
    export CROSS_COMPILE=aarch64-none-elf-
    # # 3 riscv64-unknown-elf-gcc 10.2.0
    # sudo apt purge gcc-riscv64-unknown-elf
    # export CROSS_COMPILE=riscv64-unknown-elf-

    # # # # # # # # # # # #
    # S2. env
    # # # # # # # # # # # #
    # 	                    PLATFORM	        ARCH
    # Xilinx ZCU102	        zcu102	            aarch64
    # Xilinx ZCU104	        zcu104	            aarch64
    # NXP i.MX8QM	        imx8qm	            aarch64
    # Nvidia TX2	        tx2	                aarch64
    # Raspberry 4 Model B	rpi4	            aarch64
    # QEMU Aarch64 virt	    qemu-aarch64-virt	aarch64
    # FVP-A AArch64	        fvp-a	            aarch64
    # FVP-R AArch64	        fvp-r	            aarch64
    # FVP-A AArch32	        fvp-a-aarch32	    aarch32
    # FVP-R AArch32	        fvp-r-aarch32	    aarch32
    # QEMU RV64 virt	    qemu-riscv64-virt	riscv64

    export PLATFORM=qemu-aarch64-virt
    # export PLATFORM=qemu-riscv64-virt

    export ARCH=aarch64
    # export ARCH=aarch32

    # Baremetal guest	    baremetal
    # Linux+FreeRTOS	    linux+freertos
    # Linux+Zephyr	        linux+zephyr
    # Zephyr+Baremetal	    zephyr+baremetal
    export DEMO=linux+freertos

		make -j$(nproc)
    make -j4    # fyj quickly
   
    export BAO_DEMOS=$(realpath .)

    # export SETUP_BUILD=$ROOT_DIR/build
    # export BUILD_GUESTS_DIR=$SETUP_BUILD/guests
    # if [ -d $BUILD_GUESTS_DIR ]; then
    #     rm -rf $BUILD_GUESTS_DIR
    # fi
    # mkdir -p $BUILD_GUESTS_DIR
    # export PATCHES_DIR=$ROOT_DIR/patches
    # export TOOLS_DIR=$ROOT_DIR/tools
    # printf "TOOLS_DIR:\n\t$TOOLS_DIR\n"
    # if [ -d $TOOLS_DIR ]; then
    #     rm -rf $TOOLS_DIR
    # fi
    # mkdir -p $TOOLS_DIR
    # if [ -d $TOOLS_DIR/bin ]; then
    #     rm -rf $TOOLS_DIR/bin
    # fi
    # mkdir -p $TOOLS_DIR/bin
    # export BUILD_BAO_DIR=$SETUP_BUILD/bao
    # if [ -d $BUILD_BAO_DIR ]; then
    #     rm -rf $BUILD_BAO_DIR
    # fi
    # mkdir -p $BUILD_BAO_DIR

    # export BUILD_FIRMWARE_DIR=$SETUP_BUILD/firmware
    # if [ -d $BUILD_FIRMWARE_DIR ]; then
    #     rm -rf $BUILD_FIRMWARE_DIR
    # fi
    # mkdir -p $BUILD_FIRMWARE_DIR
    # export BAREMETAL_SRCS=$ROOT_DIR/baremetal
    # if [ -d $BAREMETAL_SRCS ]; then
    #     rm -rf $BAREMETAL_SRCS
    # fi
    # mkdir -p $BAREMETAL_SRCS
    # git clone https://github.com/bao-project/bao-baremetal-guest.git --branch demo $BAREMETAL_SRCS
    # git -C $BAREMETAL_SRCS apply $PATCHES_DIR/baremetal.patch
    # make -C $BAREMETAL_SRCS PLATFORM=qemu-riscv64-virt
    # mkdir -p $BUILD_GUESTS_DIR/baremetal-setup
    # cp $BAREMETAL_SRCS/build/qemu-riscv64-virt/baremetal.bin $BUILD_GUESTS_DIR/baremetal-setup/baremetal.bin
    # export BAO_SRCS=$ROOT_DIR/bao
    # git clone https://github.com/bao-project/bao-hypervisor $BAO_SRCS --branch demo
    # make -C $BAO_SRCS PLATFORM=qemu-riscv64-virt CONFIG_REPO=$ROOT_DIR/configs CONFIG=baremetal CPPFLAGS=-DBAO_WRKDIR_IMGS=$BUILD_GUESTS_DIR
    # cp $BAO_SRCS/bin/qemu-riscv64-virt/baremetal/bao.bin $BUILD_BAO_DIR/bao.bin

    export BAO_DEMOS_WRKDIR=$BAO_DEMOS/wrkdir
    if [ -d $BAO_DEMOS_WRKDIR ]; then
       rm -rf $BAO_DEMOS_WRKDIR
    fi
    mkdir -p $BAO_DEMOS_WRKDIR

    export BAO_DEMOS_WRKDIR_SRC=$BAO_DEMOS_WRKDIR/srcs
    if [ -d $BAO_DEMOS_WRKDIR_SRC ]; then
       rm -rf $BAO_DEMOS_WRKDIR_SRC
    fi
    mkdir -p $BAO_DEMOS_WRKDIR_SRC

    export BAO_DEMOS_WRKDIR_BIN=$BAO_DEMOS_WRKDIR/bin
    # printf "PRE_BUILT_IMGS:\n\t$PRE_BUILT_IMGS\n"
    if [ -d $BAO_DEMOS_WRKDIR_BIN ]; then
       rm -rf $BAO_DEMOS_WRKDIR_BIN
    fi
    mkdir -p $BAO_DEMOS_WRKDIR_BIN

    export BAO_DEMOS_WRKDIR_PLAT=$BAO_DEMOS_WRKDIR/imgs/$PLATFORM
    export BAO_DEMOS_WRKDIR_IMGS=$BAO_DEMOS_WRKDIR_PLAT/$DEMO
    if [ -d $BAO_DEMOS_WRKDIR_IMGS ]; then
       rm -rf $BAO_DEMOS_WRKDIR_IMGS
    fi
    mkdir -p $BAO_DEMOS_WRKDIR_IMGS
    
    # # 1) Download build and install Aarch64 qemu
    # export BAO_DEMOS_QEMU=$BAO_DEMOS_WRKDIR_SRC/qemu-$ARCH
    # export BAO_DEMOS_QEMU=$ROOT_DIR/tools/qemu-riscv64

    # git clone https://github.com/qemu/qemu.git $BAO_DEMOS_QEMU --depth 1 --branch v7.2.0
    # pushd $BAO_DEMOS_QEMU > /dev/null
        # ./configure --target-list=aarch64-softmmu --enable-slirp
        # make -j$(nproc)
        # make install
        # sudo ./configure --target-list=riscv64-softmmu --enable-slirp
        # sodo make -j$(nproc)
        # sudo make install
    # popd > /dev/null

    # # 2) Build OPENSBI_DIR
    # export OPENSBI_DIR=$ROOT_DIR/tools/OpenSBI
    # git clone https://github.com/bao-project/opensbi.git $OPENSBI_DIR --depth 1 --branch bao/demo
    # make -C $TOOLS_DIR/OpenSBI PLATFORM=generic FW_PAYLOAD=y FW_PAYLOAD_FDT_ADDR=0x80100000 FW_PAYLOAD_PATH=$BUILD_BAO_DIR/bao.bin
    # cp $TOOLS_DIR/OpenSBI/build/platform/generic/firmware/fw_payload.elf $TOOLS_DIR/bin/opensbi.elf


    # # 2) Build U-boot
    # export BAO_DEMOS_UBOOT=$BAO_DEMOS_WRKDIR_SRC/u-boot
    # git clone https://github.com/u-boot/u-boot.git $BAO_DEMOS_UBOOT --depth 1 --branch v2022.10
    # pushd $BAO_DEMOS_UBOOT > /dev/null
    #     make qemu_arm64_defconfig
    #     # Now you need to set the Kconfig options: 
    #     # CONFIG_TFABOOT=y
    #     # CONFIG_SYS_TEXT_BASE=0x60000000
    #     # You can do it via using an interface such as menuconfig or just write them directly to the config file:
    #     echo "CONFIG_TFABOOT=y" >> .config
    #     echo "CONFIG_SYS_TEXT_BASE=0x60000000" >> .config
    #     # Then build it:
    #     make -j$(nproc)
    #     # And copy the image to the platform's working directory:
    #     cp $BAO_DEMOS_UBOOT/u-boot.bin $BAO_DEMOS_WRKDIR/imgs/$PLATFORM

    # popd > /dev/null


    # # 3) Build TF-A
    # export BAO_DEMOS_ATF=$BAO_DEMOS_WRKDIR_SRC/arm-trusted-firmware
    # git clone https://github.com/bao-project/arm-trusted-firmware.git $BAO_DEMOS_ATF --branch bao/demo --depth 1
    # cd $BAO_DEMOS_ATF
    # make PLAT=qemu bl1 fip BL33=$BAO_DEMOS_WRKDIR/imgs/$PLATFORM/u-boot.bin QEMU_USE_GIC_DRIVER=QEMU_GICV3
    # dd if=$BAO_DEMOS_ATF/build/qemu/release/bl1.bin of=$BAO_DEMOS_WRKDIR/imgs/$PLATFORM/flash.bin
    # dd if=$BAO_DEMOS_ATF/build/qemu/release/fip.bin of=$BAO_DEMOS_WRKDIR/imgs/$PLATFORM/flash.bin seek=64 bs=4096 conv=notrunc


    # # 4) Run QEMU
    # qemu-system-aarch64 -nographic -M virt,secure=on,virtualization=on,gic-version=3 \
    #     -cpu cortex-a53 -smp 4 -m 4G -bios $BAO_DEMOS_WRKDIR/imgs/$PLATFORM/flash.bin \
    #     -device loader,file="$BAO_DEMOS_WRKDIR_IMGS/bao.bin",addr=0x50000000,force-raw=on \
    #     -device virtio-net-device,netdev=net0 \
    #     -netdev user,id=net0,net=192.168.42.0/24,hostfwd=tcp:127.0.0.1:5555-:22 \
    #     -device virtio-serial-device -chardev pty,id=serial3 -device virtconsole,chardev=serial3
		# 等价 make PLATFORM=qemu-aarch64-virt DEMO=linux+zephyr run
    
    # qemu-system-riscv64 -nographic -M virt -cpu rv64 -m 4G -smp 4 -bios $TOOLS_DIR/bin/opensbi.elf \
    #     -device virtio-net-device,netdev=net0 \
    #     -netdev user,id=net0,net=192.168.42.0/24,hostfwd=tcp:127.0.0.1:5555-:22 \
    #     -device virtio-serial-device -chardev pty,id=serial3 -device virtconsole,chardev=serial3


popd > /dev/null
