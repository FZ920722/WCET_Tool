#!/usr/bin/env python3

import os
import shutil
import subprocess

# from pathlib import Path
# from argparse import ArgumentParser

if __name__ == "__main__":
    ABS_PATH = os.path.dirname(os.path.abspath(__file__) )
    # print(ABS_PATH)
    ROOT_DIR="/workspaces/llvmta/testcases/singletest"
    for _f in os.listdir(ROOT_DIR):
        _t = os.path.join(ROOT_DIR, _f)
        # print(_t)
        if os.path.exists(os.path.join(_t, 'ChangeLog.txt')):
            print(_t)
            subprocess.run(["python3",
                            os.path.join(ABS_PATH, "run.py"), 
                            f"-C{_t}",
                            f"-H{_t}",
                            f"-W{os.path.join(_t, 'work')}",
                            ])
            # result = subprocess.run(["python", "script.py"], capture_output=True, text=True)
