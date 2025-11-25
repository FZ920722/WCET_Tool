#!/usr/bin/env python3

import os
import re
import json
import shutil


# if __name__ == "__main__":
#     os.makedirs("/home/fyj/WCET_Tool/IRFile", exist_ok=False)
#     with open("/home/fyj/WCET_Tool/compile_commands.json", "r", encoding="utf-8") as f:
#         loaded_data = json.load(f)
#     print(len(loaded_data))

#     _buff = set()
#     failnum = 0
#     succnum = 0
#     for data in loaded_data:
#         _sfile_name, _ssuffix = os.path.splitext(os.path.basename(data['arguments'][-1]))
#         if _ssuffix != ".cpp" and \
#            "/home/fyj/Desktop/data/vela-opensource/nuttx" in data['directory'] and \
#            "/home/fyj/Desktop/data/vela-opensource/nuttx/arch" not in data['directory'] and \
#            "/home/fyj/Desktop/data/vela-opensource/nuttx/libs/libc" not in data['directory'] and \
#            "/home/fyj/Desktop/data/vela-opensource/nuttx/drivers/sensors" not in os.path.join(data['directory'], data['file']):
#             _tdata = data['arguments'].copy()
#             # (1)
#             _tdata[0] = _tdata[0].split('/')[-1]
#             _buff.add(_tdata[0])
#             # (2) -o path
#             if not _tdata[-3] == "-o":
#                 assert False
#             _outpid = f"/home/fyj/WCET_Tool/IRFile/{_sfile_name}.ll"
#             _tdata[-2] = _outpid
#             # (3) inst
#             # if not os.path.exists( os.path.join(data['directory'], data['file']) ):
#             #     assert False
#             _tdata[-1] = os.path.join(data['directory'], data['file']) 
#             # (4)
#             try:
#                 _temp_index = _tdata.index("-DLV_ASSERT_HANDLER=ASSERT(0);")
#                 _tdata[_temp_index] = "-DLV_ASSERT_HANDLER='ASSERT(0);'"
#             except ValueError:
#                 pass
#             # (5) final;
#             _retx = inst_tran(_tdata)
#             # (6) 
#             os.chdir(data['directory'])
#             # if os.system(_retx) != 0:
#             if os.system(_retx + " >/dev/null 2>&1") != 0:
#                 print( os.path.join(data['directory'], data['file']) )
#                 # print(_retx + '\n')
#                 # print("fail!!\n")
#                 succnum += 1
#                 # exit(1)
#             else:
#                 # print("success!!\n")
#                 failnum += 1

#     print(f"\t\t{succnum}")
#     print(f"\t\t{failnum}")


if __name__ == "__main__":
    ROOT_PATH = "/home/fyj/WCET_Tool/"

    IRFILE_PATH = os.path.join(ROOT_PATH, "_IRFile")
    ORFILE_PATH = os.path.join(ROOT_PATH, "_ORFile")
    ARFILE_PATH = os.path.join(ROOT_PATH, "_ARFile")

    if not os.path.exists(IRFILE_PATH):
        exit(1)

    if os.path.exists(ORFILE_PATH):
        shutil.rmtree(ORFILE_PATH)
    os.makedirs(ORFILE_PATH)

    if os.path.exists(ARFILE_PATH):
        shutil.rmtree(ARFILE_PATH)
    os.makedirs(ARFILE_PATH)

    for _file in os.listdir(os.path.join(ROOT_PATH, "_IRFile")):
        _sfname, _sfsuffix = os.path.splitext(_file)
        # print(_sfname)
        # print(_sfsuffix)

        # (1) opt
        OPT_INSTRUCT = f"opt {os.path.join(IRFILE_PATH, _sfname)}.ll -S -mem2reg -indvars -loop-simplify -instcombine -globaldce -dce -o {os.path.join(ORFILE_PATH, _sfname)}_opt.ll"
        print(OPT_INSTRUCT)
        print()
        if os.system(OPT_INSTRUCT) != 0:
            exit(1)

        # (2) analysis
        ANA_INSTRUCT = f"opt {os.path.join(IRFILE_PATH, _sfname)}.ll -S -mem2reg -indvars -loop-simplify -instcombine -globaldce -dce -o {os.path.join(ORFILE_PATH, _sfname)}_opt.ll"
        print(ANA_INSTRUCT)
        # os.chdir(os.path.join(ROOT_PATH, "ORFile"))
        # for i, file in enumerate(files, 1):
        #     file_path = os.path.join(current_dir, file)
        #     file_size = os.path.getsize(file_path)
        #     print(f"{i:2d}. {file} ({file_size} bytes)")
