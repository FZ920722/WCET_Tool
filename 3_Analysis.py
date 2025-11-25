#!/usr/bin/env python3

import re
import os
import json

# -fuse-ld=lld
# --target=arm-none-eabi
def inst_tran(_pinst):
    _t1_inst = _pinst[0].split('-')
    _new_inst = " -w -S -emit-llvm -Xclang -disable-O0-optnone -gline-tables-only "
    
    # --sysroot=/opt/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi/arm-none-eabi 
    # -I /opt/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi/arm-none-eabi/include 
    if _pinst[0] == 'cc':
        return 'clang' + _new_inst + " ".join(_pinst[1:])
    else:
        return f'clang' \
                + _new_inst \
                + f'--target={"-".join(_t1_inst[:-1])} ' + " ".join(_pinst[1:])


if __name__ == "__main__":
    os.makedirs("/home/fyj/WCET_Tool/IRFile", exist_ok=False)
    with open("/home/fyj/WCET_Tool/compile_commands.json", "r", encoding="utf-8") as f:
        loaded_data = json.load(f)
    print(len(loaded_data))

    _buff = set()
    failnum = 0
    succnum = 0
    for data in loaded_data:
        _sfile_name, _ssuffix = os.path.splitext(os.path.basename(data['arguments'][-1]))
        if "/home/fyj/Desktop/data/vela-opensource/nuttx" in data['directory'] and _ssuffix != ".cpp":
 
            _tdata = data['arguments'].copy()

            # (1) 
            _tdata[0] = _tdata[0].split('/')[-1]
            _buff.add(_tdata[0])

            # (2) -o path
            if not _tdata[-3] == "-o":
                assert False

            _outpid = f"/home/fyj/WCET_Tool/IRFile/{_sfile_name}.ll"
            _tdata[-2] = _outpid
            # print(_sourid)
            # print(_outpid)

            # (3) inst
            # print(data['file'])
            # print(data['directory'])
            # print(os.path.join(data['directory'], data['file']) )
            _tdata[-1] = os.path.join(data['directory'], data['file']) 
            # if not os.path.exists( os.path.join(data['directory'], data['file']) ):
            #     assert False

            # (4)
            try:
                _temp_index = _tdata.index("-DLV_ASSERT_HANDLER=ASSERT(0);")
                _tdata[_temp_index] = "-DLV_ASSERT_HANDLER='ASSERT(0);'"
            except ValueError:
                pass

            # (4) final;
            _retx = inst_tran(_tdata)

            # (5) 
            os.chdir(data['directory'])
            if os.system(_retx) != 0:
            # if os.system(_retx + " >/dev/null 2>&1") != 0:
                print(_retx + '\n')
                # exit(1)
                print("fail!!\n")
                succnum += 1
            else:
                # print("success!!\n")
                failnum += 1

    # print(_buff)
    # print(len(_buff))
    print(f"\t\t{succnum}")
    print(f"\t\t{failnum}")
