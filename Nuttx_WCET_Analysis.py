#!/usr/bin/env python3

import re
import os
import copy
import json
import shlex
import shutil

from multiprocessing import Pool
from argparse import ArgumentParser


def IRCompile(_param):
    global IRFILE_PATH
    _dn, _dd = _param
    print(_dn)
    _sfname, _ssuffix = os.path.splitext(os.path.basename(_dd['file']))
    _source_compiler = os.path.basename(_dd['arguments'][0])
    if _source_compiler != "cc" and _ssuffix not in [".s", ".S"]:
        # (1) 指令分析 
        _temp_target, _, _, _temp_compiler = _source_compiler.split('-')
        # -marm -march=armv4t -mfloat-abi=hard
        _temp_sl = [f"--target={_temp_target}", "-w", "-S", "-emit-llvm", "-gline-tables-only", "-O0", "-Xclang", \
                    "-disable-O0-optnone", "-fno-builtin", "-fno-jump-tables", "-fno-optimize-sibling-calls"] + \
                [_ditem for _ditem in _dd['arguments'][1:] if not _ditem.startswith(('-g', '-O'))]
        _temp_sl[-2] = os.path.join(IRFILE_PATH, f"{_sfname}.ll")
        if _temp_compiler == 'gcc':
            _temp_sl = ['clang'] + _temp_sl
        elif _temp_compiler == 'g++':
            _temp_sl = ['clang++'] + _temp_sl
        else:
            exit(1)

        # (2) 指令执行
        os.chdir(_dd['directory'])
        _temp_ss = shlex.join(_temp_sl)
        if os.system(_temp_ss ) != 0:   # " >/dev/null | tee -a {_log_txt}",
            print( _temp_ss + '\n')
            exit(1)

if __name__ == "__main__":
    global CPU_COUNT, SPACE_PATH, NUTTX_PATH, IRFILE_PATH, OPFILE_PATH
    CPU_COUNT =  os.cpu_count()

    parser = ArgumentParser(description='llvm-ta to nuttx')
    parser.add_argument('-s', '--space',   type=str,   help='The address of work space')
    parser.add_argument('-n', '--nuttx',   type=str,   help='The address of nuttx project')
    parser.add_argument('-p', '--platform',   type=str,   help='The compile target of platform')
    # commands file. such as compile_commands.json
    # The source address. such as nuttx project
    # qemu-armv7a:nsh
    # qemu-armv8a:nsh
    # qemu-armv7r:nsh
    # fvp-armv8r:nsh

    # 1_Command_Compile
    args = parser.parse_args()
    SPACE_PATH = args.space
    NUTTX_PATH = args.nuttx

    IRFILE_PATH= os.path.join(SPACE_PATH, "_IRFile")
    if os.path.exists(IRFILE_PATH):
        shutil.rmtree(IRFILE_PATH)
    os.makedirs(IRFILE_PATH)
    
    os.chdir(NUTTX_PATH)
    if os.system(f"make distclean") != 0:
        exit(1)

    if os.system(f"./tools/configure.sh -l {args.platform}") != 0:
        exit(1)

    if os.system(f"bear -- make -j{CPU_COUNT}") != 0:
        exit(1)

    # 2_Preprorcess
    with open(os.path.abspath(os.path.join(NUTTX_PATH, 'compile_commands.json')), "r", encoding="utf-8") as f:
        loaded_data = json.load(f)
    print(len(loaded_data))
    
    with Pool(processes=CPU_COUNT) as pool:
        pool.map(IRCompile, zip(range(len(loaded_data)), loaded_data))

    os.chdir(IRFILE_PATH)
    # (1) llvm-link
    if os.system(f"llvm-link *.ll -o unoptimized.ll") != 0:
        exit(1)

    # (2) opt
    if os.system(f"opt -S unoptimized.ll -mem2reg -indvars -loop-simplify -inline -instcombine -globaldce -dce  -lowerswitch -o optimized.ll") != 0:
        exit(1)

    # (3) 注释内链汇编

    # (4) 注释调试信息

    # 3_Analysis

