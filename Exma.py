#!/usr/bin/env python3

import os
import json
import shutil
import subprocess

import pandas as pd 

if __name__ == "__main__":
    NUTTX_HOME="/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx"
    SOURCE_WORK_DIR="/home/fyj/Desktop/data/WCET_Tool/WorkSpace"
    if os.path.exists(SOURCE_WORK_DIR):
        shutil.rmtree(SOURCE_WORK_DIR)
    os.mkdir(SOURCE_WORK_DIR)

    with open('/home/fyj/Desktop/data/WCET_Tool/_TOSData.json', 'r') as _f:
        for _i, _d in json.load(_f).items():
            print(f"{_i}")
            for _func, _caddr, _cfile in _d:
                # 1. code addr
                # CODE_FILE=f"{NUTTX_HOME}/{_file}"
                CODE_FILE = os.path.join(NUTTX_HOME, _caddr, _cfile)
                # 2. head addr
                HEAD_DIRS=[
                    os.path.join(NUTTX_HOME, "fs"),
                    os.path.join(NUTTX_HOME, "sched"), 
                    os.path.join(NUTTX_HOME, "include"),
                    os.path.join(NUTTX_HOME, "include/nuttx")
                ]
                # /home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/include/nuttx/mqueue.h
                # 3. work path
                WORK_DIR = os.path.join(SOURCE_WORK_DIR, _func)
                if os.path.exists(WORK_DIR):
                    shutil.rmtree(WORK_DIR)
                os.mkdir(WORK_DIR)
                # 4. comp path
                COMP_DIR=os.path.join(WORK_DIR, "Compile")
                if os.path.exists(COMP_DIR):
                    shutil.rmtree(COMP_DIR)
                os.mkdir(COMP_DIR)
                # 5. anal path
                ANAL_DIR=os.path.join(WORK_DIR, "Analysis")
                if os.path.exists(ANAL_DIR):
                    shutil.rmtree(ANAL_DIR)
                os.mkdir(ANAL_DIR)
                # 6. entry point
                ENTRYPOINT=_func
                # 7. Core data
                COREINFO=os.path.join(WORK_DIR, "CoreInfo.json")

                # print(f"COREINFO:\t{COREINFO}")
                print(f"\tWORK_DIR:\t{WORK_DIR}")
                print(f"\tCOMP_DIR:\t{COMP_DIR}")
                print(f"\tANAL_DIR:\t{ANAL_DIR}")

                # print(f"NUTTX_HOME:\t{NUTTX_HOME}")
                print(f"\tCODE_FILE:\t{CODE_FILE}")
                print(f"\tHEAD_DIRS:\t{HEAD_DIRS}")
                print(f"\tENTRYPOINT:\t{ENTRYPOINT}")

                # print()
                with open(COREINFO, 'w') as _f:
                    json.dump([{"core": 0, "tasks": [{"function": ENTRYPOINT}]}], _f, indent=4)

                CLANG_INSTRUCT=[
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
                    "-emit-llvm", 
                    CODE_FILE,
                    ' '.join(f"-I {_hd}" for _hd in HEAD_DIRS),
                    # "> /dev/null 2>&1"
                ]

                print('\n\t '.join(CLANG_INSTRUCT))
                os.chdir(COMP_DIR)
                if os.system(' '.join(CLANG_INSTRUCT)) != 0:
                    exit(1)
    
