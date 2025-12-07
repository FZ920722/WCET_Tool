#!/usr/bin/env python3

import re
import os
import json
import shutil

from multiprocessing import Pool
from argparse import ArgumentParser

# file_size = os.path.getsize(file_path)
# os.listdir(os.path.join(ROOT_PATH, "_IRFile"))

global COMPILER_MAP, ROOT_PATH, IRFILE_PATH, ORFILE_PATH, ARFILE_PATH

ROOT_PATH = os.path.dirname(os.path.abspath(__file__))
IRFILE_PATH = os.path.join(ROOT_PATH, "_IRFile")
ORFILE_PATH = os.path.join(ROOT_PATH, "_ORFile")
ARFILE_PATH = os.path.join(ROOT_PATH, "_ARFile")

COMPILER_MAP = {
        # 'cc':,
        # 'arm-none-eabi-gcc':, 
        # 'arm-none-eabi-g++':, 

        # 'cc': 'cc', 
        # 'arm-none-eabi-gcc': '/home/fyj/DiskD/openvela/prebuilts/gcc/linux-x86_64/arm-none-eabi/bin/arm-none-eabi-gcc', 
        # 'arm-none-eabi-g++': '/home/fyj/DiskD/openvela/prebuilts/gcc/linux-x86_64/arm-none-eabi/bin/arm-none-eabi-g++', 
        # '/home/fyj/DiskD/openvela/prebuilts/gcc/linux-x86_64/arm-none-eabi/bin/arm-none-eabi-gcc': '/home/fyj/DiskD/openvela/prebuilts/gcc/linux-x86_64/arm-none-eabi/bin/arm-none-eabi-gcc', 
        # '/home/fyj/DiskD/openvela/prebuilts/gcc/linux-x86_64/arm-none-eabi/bin/arm-none-eabi-g++': '/home/fyj/DiskD/openvela/prebuilts/gcc/linux-x86_64/arm-none-eabi/bin/arm-none-eabi-g++', 

        # 'cc': 'clang -target=arm', 
        # 'arm-none-eabi-gcc': 'clang -target=arm',
        # 'arm-none-eabi-g++': 'clang++ -target=arm',
        # '/home/fyj/DiskD/openvela/prebuilts/gcc/linux-x86_64/arm-none-eabi/bin/arm-none-eabi-gcc': 'clang -target=arm', 
        # '/home/fyj/DiskD/openvela/prebuilts/gcc/linux-x86_64/arm-none-eabi/bin/arm-none-eabi-g++': 'clang++ -target=arm',
}

def WCETAnalysis(_source, _commands):
    global COMPILER_MAP, ROOT_PATH, IRFILE_PATH, ORFILE_PATH, ARFILE_PATH
    _sfname, _ssuffix = os.path.splitext(os.path.basename(_commands['arguments'][-1]))
    if _source in _commands['directory'] and _ssuffix in ['.c']:
        _tdata = []
        _tdata = _commands['arguments'].copy()
        _tdata[0] = _tdata[0].split('/')[-1]
        # _tdata[0] = COMPILER_MAP[_tdata[0]]
        _tdata += [ '-Wno-int-conversion', '-Wno-implicit-function-declaration' ] 
        os.chdir(_commands['directory'])
        _retx = ' '.join(_tdata)
        if os.system(_retx ) != 0:
            print( _retx + '\n')
            fail_num += 1
            exit(1)

        _ir_file_path = print(os.path.join(IRFILE_PATH, _sfname))
        if os.path.exists(_ir_file_path):
            shutil.rmtree(_ir_file_path)
        os.makedirs(_ir_file_path)
        print(123)
        
        # _tdata[-2] = os.path.join(IRFILE_PATH, f"{_sfile_name}.ll")
        # _tdata[-1] = os.path.join(data['directory'], data['file']) 
        # (1) opt
        # if os.system(f"opt {os.path.join(IRFILE_PATH, _sfname)}.ll -S -mem2reg -indvars -loop-simplify -instcombine -globaldce -dce -o {os.path.join(ORFILE_PATH, _sfname)}_opt.ll") != 0:            
        #     exit(1)
        # (2) analysis
        # os.chdir(os.path.join(ROOT_PATH, "ORFile"))


if __name__ == "__main__":
    if os.path.exists(IRFILE_PATH):
        shutil.rmtree(IRFILE_PATH)
    os.makedirs(IRFILE_PATH)

    if os.path.exists(ORFILE_PATH):
        shutil.rmtree(ORFILE_PATH)
    os.makedirs(ORFILE_PATH)

    if os.path.exists(ARFILE_PATH):
        shutil.rmtree(ARFILE_PATH)
    os.makedirs(ARFILE_PATH)

    parser = ArgumentParser(description='xx')
    parser.add_argument('-s', '--source',   type=str,   help='The source address. such as nuttx project')
    parser.add_argument('-c', '--compile',  type=str,   help='The compile commands file. such as compile_commands.json')
    args = parser.parse_args()
    # print(args.source)
    # print(args.compile)

    with open(os.path.abspath(args.compile), "r", encoding="utf-8") as f:
        loaded_data = json.load(f)
    print(len(loaded_data))

    fail_num = 0
    for ii, datax in enumerate(loaded_data):
        # _sfname, _ssuffix = os.path.splitext(os.path.basename(datax['arguments'][-1]))
        os.chdir(datax['directory'])
        # [ '-Wno-int-conversion', '-Wno-implicit-function-declaration' ] 
        _retx = ''
        # for _dx in datax['arguments'] + ["-Wno-cpp", "-Wno-deprecated-declarations"]:
        for _dx in datax['arguments'] + ['-Wno-int-conversion','-Wno-implicit-function-declaration']:
            _retx += f' "{_dx}"'
        # _retx += ' "-Wno-cpp" "-Wno-deprecated-declarations"'
        # _retx = ' '.join(datax['arguments'])
        # print(_retx)
        # print()
        if os.system(_retx ) != 0:
            print(ii)
            print( _retx + '\n')
            fail_num += 1
            # exit(1)

        # _ir_file_path = print(os.path.join(IRFILE_PATH, _sfname))
        # if os.path.exists(_ir_file_path):
        #     shutil.rmtree(_ir_file_path)
        # os.makedirs(_ir_file_path)

        
    # with Pool(processes=12) as pool:
    #     sync_results = pool.starmap(WCETAnalysis, zip( [args.source, ] * len(loaded_data), loaded_data))
        # sync_results = pool.map(WCETAnalysis, loaded_data)

    # print(f"Total compile commands: {len(loaded_data)}")
    print(f"Total failed commands: {fail_num}")
    """
    with open(os.path.join(SOUR_HOME, '_TOSData.json'), 'r') as _f:
        for _i, _d in json.load(_f).items():
            print(f"{_i}")
            for _func, _caddr, _cfile in _d:
                # 1. entry point
                _entry_list.append(_func)
                # 2. code addr
                _code_file = os.path.join(NUTTX_HOME, _caddr, _cfile)
                _code_list.append(_code_file)
                # 3. head addr
                _head_dirs = [
                    os.path.join(NUTTX_HOME, "fs"),
                    os.path.join(NUTTX_HOME, "sched"), 
                    os.path.join(NUTTX_HOME, "include"),
                ]
                _head_list.append(_head_dirs)
                # WCETAnalysis(_func, _code_file, _head_dirs)
    """


    "arm-none-eabi-g++" "-c" "-Wno-attributes" "-Wno-unknown-pragmas" "-nostdinc++" "-Wno-psabi" "-std=gnu++20" "-fno-exceptions" "-fcheck-new" "-fno-rtti" "-O3" "-fno-strict-aliasing" "-fno-omit-frame-pointer" "-fno-optimize-sibling-calls" "-fstack-protector-all" "-funwind-tables" "-fasynchronous-unwind-tables" "--param=min-pagesize=0" "-Wno-alloc-size-larger-than" "-fno-common" "-Wall" "-Wshadow" "-Wundef" "-ffunction-sections" "-fdata-sections" "-g3" "-mcpu=cortex-a7" "-mfloat-abi=hard" "-mfpu=neon-vfpv4" "-mlittle-endian" "-mthumb" "-Wa,-mthumb" "-Wa,-mimplicit-it=always" "-isystem" "/home/fyj/DiskN/openvela/nuttx/include/libcxx" "-isystem" "/home/fyj/DiskN/openvela/nuttx/include/libcxxabi" "-isystem" "/home/fyj/DiskN/openvela/nuttx/include" "-D__NuttX__" "-Wno-cpp" "-Wno-deprecated-declarations" "-pipe" "-I" "/home/fyj/DiskN/openvela/apps/crypto/mbedtls/include" "-I" "/home/fyj/DiskN/openvela/apps/crypto/mbedtls/mbedtls/include" "-I" "/home/fyj/DiskN/openvela/apps/crypto/openssl_mbedtls_wrapper/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/frameworks/native/libs/binder/aidl" "-I" "/home/fyj/DiskN/openvela/apps/external/android/frameworks/native/libs/binder/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/frameworks/native/libs/binder/include_activitymanager" "-I" "/home/fyj/DiskN/openvela/apps/external/android/frameworks/native/libs/binder/include_batterystats" "-I" "/home/fyj/DiskN/openvela/apps/external/android/frameworks/native/libs/binder/include_processinfo" "-I" "/home/fyj/DiskN/openvela/apps/external/android/frameworks/native/libs/binder/include_rpc_unstable" "-I" "/home/fyj/DiskN/openvela/apps/external/android/frameworks/native/libs/binder/ndk/include_cpp" "-I" "/home/fyj/DiskN/openvela/apps/external/android/frameworks/native/libs/binder/ndk/include_ndk" "-I" "/home/fyj/DiskN/openvela/apps/external/android/frameworks/native/libs/binder/ndk/include_platform" "-I" "/home/fyj/DiskN/openvela/apps/external/android/frameworks/native/libs/binderdebug/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/hardware/interfaces/keymaster/4.1/support/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/hardware/interfaces/keymaster/4.0/support/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/hardware/interfaces" "-I" "/home/fyj/DiskN/openvela/apps/external/android/hardware/libhardware/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/system/core/libcutils/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/system/core/libutils/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/system/keymaster/include" "-I" "/home/fyj/DiskN/openvela/apps/external/fmtlib/fmtlib/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/system/libbase/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/system/libcppbor/include/cppbor" "-I" "/home/fyj/DiskN/openvela/apps/external/android/system/libfmq/base" "-I" "/home/fyj/DiskN/openvela/apps/external/android/system/libhidl/base/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/system/libhwbinder/include" "-I" "/home/fyj/DiskN/openvela/apps/external/android/system/security/keystore/binder" "-I" "/home/fyj/DiskN/openvela/apps/external/android/system/security/keystore/include" "-I" "/home/fyj/DiskN/openvela/apps/external/googletest/googletest/googletest/include" "-I" "/home/fyj/DiskN/openvela/apps/external/googletest/googletest/googlemock/include" "-I" "/home/fyj/DiskN/openvela/apps/external/optee/optee_client/optee_client/public" "-I" "/home/fyj/DiskN/openvela/apps/frameworks/runtimes/services/xmsdemo" "-I" "/home/fyj/DiskN/openvela/apps/frameworks/security/include" "-I" "/home/fyj/DiskN/openvela/apps/frameworks/system/binder/libs/binder/include" "-I" "/home/fyj/DiskN/openvela/apps/frameworks/system/utils/include" "-I" "/home/fyj/DiskN/openvela/apps/graphics/lvgl" "-I" "/home/fyj/DiskN/openvela/apps/graphics/lvgl/lvgl" "-I" "/home/fyj/DiskN/openvela/apps/interpreters/wamr/wamr/core/iwasm/include" "-I" "/home/fyj/DiskN/openvela/apps/system/argtable3/argtable3/src" "-I" "/home/fyj/DiskN/openvela/apps/include" "-Wno-maybe-uninitialized" "-o" "canned_fs_config.cpp.home.fyj.DiskN.openvela.external.android.system.core.libcutils.o" "canned_fs_config.cpp"