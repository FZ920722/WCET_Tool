#!/usr/bin/env python3

import os
import json
import shutil
import subprocess
import pandas as pd 

from multiprocessing import Semaphore, Pool


global GSEMA
global SOUR_HEMO, WORK_HOME, NUTTX_HOME
global CLANG_SOURCE, OPT_SOURCE, LLVMTA_SOURCE

GSEMA = Semaphore(1)

SOUR_HOME="/home/fyj/Desktop/data/WCET_Tool"

WORK_HOME=os.path.join(SOUR_HOME, "WorkSpace")

NUTTX_HOME="/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx"

CLANG_SOURCE=[
    "clang", 
    "-w", 
    "-S", 
    "-gline-tables-only", 
    "-O0", 
    "-Xclang -disable-O0-optnone", 
    "-fno-builtin", 
    "-target arm", 
    "-march=armv7a", 
    "-mfloat-abi=hard", 
    "-emit-llvm"
]

OPT_SOURCE=[
    "opt", 
    # (1) 输入项;
    "unoptimized.ll", 
    # (2) 优化选项
    "-S", 
    "-mem2reg", 
    "-indvars", 
    "-loop-simplify", 
    "-instcombine", 
    "-globaldce", 
    "-dce", 
    # (3) 输出项
    "-o optimized.ll"
]

MEM_Latency=100     # 150
L1I_Assoc=8
L1I_Nsets=128       # 64
L1I_Linesize=64
L1D_Assoc=8
L1D_Nsets=128       # 64
L1D_Linesize=64
L2C_Assoc=8
L2C_Nsets=1024      # 64
L2C_Linesize=64

LLVMTA_SOURCE = [
    "llvmta",
    "-disable-tail-calls", 
    "-float-abi=hard", 
    # "-march=armv8-a",
    "-mattr=-neon,+vfp2", 
    "-O0",
    # "-O0-disable-O0-optnone",
    # "-mcpu=arm7tdmi"
    "--ta-strict=false",
    "--ta-lpsolver-effort=maximal",
    "--ta-icache-persistence=conditionalmust",
    "--ta-dcache-persistence=conditionalmust",
    "--ta-l2cache-persistence=conditionalmust",
    "--ta-num-callsite-tokens=3",
    f"--ta-mem-latency={MEM_Latency}",
    "--ta-memory-type=separatecaches",
    "--ta-muarch-type=outoforder", 
    "--ta-unblock-stores=true",
    "--ta-dcache-write-back=true", 
    "--ta-dcache-write-allocate=true",
    f"--ta-dcache-assoc={L1D_Assoc}",
    f"--ta-dcache-nsets={L1D_Nsets}",
    f"--ta-dcache-linesize={L1D_Linesize}",
    f"--ta-icache-assoc={L1I_Assoc}",
    f"--ta-icache-nsets={L1I_Nsets}",
    f"--ta-icache-linesize={L1I_Linesize}",
    f"--ta-l2cache-assoc={L2C_Assoc}",
    f"--ta-l2cache-nsets={L2C_Nsets}",
    f"--ta-l2cache-linesize={L2C_Linesize}",
    "--ta-array-analysis=True",
    f"--core-numbers=1",
    "--shared-cache-persistence-analysis=false",
    "-debug-only=", 
    "optimized.ll"
]

def WCETAnalysis(_entry_point, _code_file, _head_dirs):
    global WORK_HOME, GSEMA
    # 1. work path
    _work_dir=os.path.join(WORK_HOME, _entry_point)
    if os.path.exists(_work_dir):
        shutil.rmtree(_work_dir)
    os.mkdir(_work_dir)
    # 2. comp path
    _comp_dir = os.path.join(_work_dir, "Compile")
    if os.path.exists(_comp_dir):
        shutil.rmtree(_comp_dir)
    os.mkdir(_comp_dir)
    # 3. anal path
    _anal_dir=os.path.join(_work_dir, "Analysis")
    if os.path.exists(_anal_dir):
        shutil.rmtree(_anal_dir)
    os.mkdir(_anal_dir)
    # 4. Core data
    _core_info=os.path.join(_work_dir, "CoreInfo.json")
    with open(_core_info, 'w') as _f:
        json.dump([{"core": 0, "tasks": [{"function": _entry_point}]}], _f, indent=4)
    # 5 log txt
    _log_txt = os.path.join(_work_dir, "log.txt")
    with open(_log_txt, "a") as _f:    # w modle will cover old file
        pass
    # S1. Compile
    os.chdir(_comp_dir)
    # (1) clang
    with open(_log_txt, "a") as _f: 
        _f.write("\n# # # # S1_1_clang\n")
    if os.system(' '.join(CLANG_SOURCE + [
                        ' '.join(f"-I{_hd}" for _hd in _head_dirs),
                        _code_file, 
                        f"2>&1 | tee -a {_log_txt}",
                        # "> /dev/null 2>&1"
                    ])) != 0:
        return

    # (2) link
    with open(_log_txt, "a") as _f: 
        _f.write("\n# # # # S1_2_link\n")
    if os.system(' '.join([
                            "llvm-link *.ll",
                            "-o unoptimized.ll", 
                            f"2>&1 | tee -a {_log_txt}",
                            # "> /dev/null 2>&1"
                        ])) != 0:
        return

    # (3) opt
    with open(_log_txt, "a") as _f: 
        _f.write("\n# # # # S1_3_opt\n")
    if os.system(' '.join(OPT_SOURCE + [
                            f"2>&1 | tee -a {_log_txt}",
                            # " > /dev/null 2>&1"
                        ])) != 0:
        return
    
    shutil.copy(os.path.join(_comp_dir, "optimized.ll"), 
                os.path.join(_anal_dir, "optimized.ll"))

    os.chdir(_anal_dir)
    # (4) --ta-output-unknown-extfuncs
    with open(_log_txt, "a") as _f: 
        _f.write("\n# # # # S2_1_Ext\n")
    if os.system(' '.join(LLVMTA_SOURCE + [
                            f"--core-info={_core_info}",
                            f"--ta-analysis-entry-point={_entry_point}", 
                            "--ta-output-unknown-extfuncs=true", 
                            f"2>&1 | tee -a {_log_txt}"
                            # " > /dev/null 2>&1"
                        ])) != 0:
        exit(1)
    if os.path.getsize('ExtFuncAnnotations.csv') > 0:
        df = pd.read_csv('ExtFuncAnnotations.csv', header=None)
        for index, row in df.iterrows():
            row[0] = row[0].replace("<start address>", "1")
            row[0] = row[0].replace("<max cycles/accesses/hits/misses>", "1/1/1/1")
        df.to_csv('ExtFuncAnnotations.csv', index=False, header=0)

    # (5) --ta-output-unknown-loops
    with open(_log_txt, "a") as _f: 
        _f.write("\n# # # # S2_2_Loop\n")
    if os.system(' '.join(LLVMTA_SOURCE + [
                            f"--core-info={_core_info}",
                            f"--ta-analysis-entry-point={_entry_point}", 
                            "--ta-output-unknown-loops",
                            f"2>&1 | tee -a {_log_txt}",
                            # " > /dev/null 2>&1"
                        ])) != 0:
        exit(1)
    if os.path.getsize('LoopAnnotations.csv') > 0:
        df = pd.read_csv('LoopAnnotations.csv', header=None)
        for index, row in df.iterrows():
            row[0] = row[0].replace("|-1", "|1")
        df.to_csv('LoopAnnotations.csv', index=False, header=0)
    shutil.copy("LoopAnnotations.csv", "LLoopAnnotations.csv")

    # (6) bound
    with open(_log_txt, "a") as _f: 
        _f.write("\n# # # # S2_3_Bound\n")
    if os.system(' '.join(LLVMTA_SOURCE + [
                            f"--core-info={_core_info}",
                            f"--ta-analysis-entry-point={_entry_point}", 
                            "--ta-loop-bounds-file=LoopAnnotations.csv",
                            "--ta-loop-lowerbounds-file=LLoopAnnotations.csv",
                            "--ta-restart-after-external",
                            "--ta-extfunc-annotation-file=ExtFuncAnnotations.csv",
                            f"2>&1 | tee -a {_log_txt}",
                            # " > /dev/null 2>&1"
                            # "2>&1 | grep 'Calculated Timing Bound' | awk '{print $NF}'"
                            ])) != 0:
        exit(1)


    # *. Core data
    with GSEMA:
        print(f"\tEntry_Point:\t{_entry_point}")
        print(f"\t\tWork_DIR:\t{_work_dir}")
        print(f"\t\tComp_DIR:\t{_comp_dir}")
        print(f"\t\tAnal_DIR:\t{_anal_dir}")
        print(f"\t\tCore_Info:\t{_core_info}")
        print(f"\t\tCode_FILE:\t{_code_file}")
        print(f"\t\tHead_DIRS:\t{' '.join(_head_dirs)}")


if __name__ == "__main__":
    # update work space
    if os.path.exists(WORK_HOME):
        shutil.rmtree(WORK_HOME)
    os.mkdir(WORK_HOME)

    _code_list = []
    _head_list = []
    _entry_list = []

    # WCETAnalysis("aio_cancel",  
    #              os.path.join(NUTTX_HOME, "fs/aio", "aio_cancel.c"),  
    #             [os.path.join(NUTTX_HOME, "fs"),
    #              os.path.join(NUTTX_HOME, "sched"), 
    #              os.path.join(NUTTX_HOME, "include")])
    # """
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

    with Pool(processes=6) as pool:
        pool.starmap(WCETAnalysis, zip(_entry_list, _code_list, _head_list))
    # """