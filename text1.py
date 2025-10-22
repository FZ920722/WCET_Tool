#!/usr/bin/env python3

import os
import re
import pandas as pd
from argparse import ArgumentParser

# python3 text1 -src 'C:\\Users\\49467\\Desktop\\123\\testcases\\ndes_jfdctint' -ub 'C:\\Users\\49467\\Desktop\\123\\testcases\\ndes_jfdctint\\LoopAnnotations.csv' -lb 'C:\\Users\\49467\\Desktop\\123\\testcases\\ndes_jfdctint\\LLoopAnnotations.csv'

# -----------+-------------+-------------+--------------+--------------+----------------
#  file name | line number | -block date | -upper_bound | -lower_bound | -function name
# -----------+-------------+-------------+--------------+--------------+----------------
if __name__ == "__main__":
    parser = ArgumentParser(description='Fill the loop bound for the given file')
    parser.add_argument('-ub',  '--upper',  type=str, help='')
    parser.add_argument('-lb',  '--lower',  type=str, help='')
    parser.add_argument('-src', '--source', type=str, help='')
    args = parser.parse_args()

    # (1) 上边界检测（LoopAnnotations.csv）；
    ub = args.ub
    if not os.path.exists(ub):
        print(f'Cannot find loop bound file {ub}')
        exit(1)

    # (2) 下边界检测（LLoopAnnotations.csv）；
    lb = args.lb
    if not os.path.exists(lb):
        print(f'Cannot find loop bound file {lb}')
        exit(1)

    # (3) 源代码;
    src = args.src
    if not os.path.exists(src):
        print(f'Cannot find source file path;')
        exit(1)

    src_data = dict()
    csv_data = dict()
    PATTERN = r'(/\*)|(\*/)'
    FILERE = re.compile(r'Loop in file (.*) near line (.*)')
    LOOPRE = re.compile(r'\w*_Pragma\(\s*\"Loopbound\s*min\s*(\d+)\s*max\s*(\d+)\s*\"\s*\).*', re.IGNORECASE)
    
    # S1. 源代码检测；
    for _root, _dirs, _files in os.walk(src):
        for _file in _files:
            if _file.endswith('.c'):
                _file_path = os.path.join(_root, _file)
                with open(_file_path, 'r', encoding='utf-8', errors='ignore') as _f:
                    _in_block = False
                    _pred_data = None
                    for _line_num, _line_data in enumerate(_f):
                        _result = []
                        _line_data = _line_data.replace('\n', '').replace('\r', '').replace('\t', '')
                        for _pat in re.split(PATTERN, _line_data):
                            if _in_block:
                                if _pat == "*/":
                                    _in_block = False
                                elif _pat == "/*":
                                    assert False
                                else:
                                    pass
                            else:
                                if _pat == "/*":
                                    _in_block = True
                                elif _pat == "*/":
                                    assert False
                                else:
                                    _result.append(_pat)
                        _line_data = ''.join(_result)
                        _line_data = _line_data.split('//')[0].strip()

                        if len(_line_data) > 0:
                            if (_line_data.startswith(('for', 'while', 'do'))):
                                _pattern = LOOPRE.match(_pred_data)
                                if _pattern:
                                    min_bound = int(_pattern.group(1))
                                    max_bound = int(_pattern.group(2))
                                    assert min_bound >= 0 and max_bound >= 0
                                    src_data[(_file, _line_num + 1)] = {"upper_bound" : max_bound, "lower_bound" : min_bound}
                                else:
                                    print(f"Annotation error!:")
                                    print(f"file:{_file_path}")
                                    print(f"line {_line_num - 1} need add Pragma annotation")
                                    print(f"  For instance: __Pragma( \"loopbound min __ max __\" )")
                                    exit(1)
                        _pred_data = _line_data

    # S2 csv文件检测；
    udf = pd.read_csv(ub, encoding='utf-8')
    ldf = pd.read_csv(lb, encoding='utf-8')
    assert len(udf) == len(ldf), 'The number of loop bounds is not equal'

    for row, rdata in ldf.iterrows():       # row: 行号, rdata:  行数据;
        for col, rcdata in rdata.items():   # col: 列头, rcdata: 行列数据;
            segment = rcdata.split('|')
            pattern = FILERE.match(segment[1])
            csv_data[(pattern.group(1), int(pattern.group(2)))] = \
                {"function": segment[0], "block_data": segment[2], "lower_bound": segment[3]}

    for row, rdata in udf.iterrows():
        for col, rcdata in rdata.items(): 
            segment = rcdata.split('|')
            pattern = FILERE.match(segment[1])
            target = (pattern.group(1), int(pattern.group(2)))
            if target in csv_data and \
               csv_data[target]["function"] == segment[0] and \
               csv_data[target]["block_data"] == segment[2]:
                csv_data[target]["upper_bound"] = segment[3]
            else:
                print("loop bound data error!")
                exit()

    # (*) 数据更新：
    for _k in csv_data.keys():
        csv_data[_k]["upper_bound"] = src_data[_k]["upper_bound"]
        csv_data[_k]["lower_bound"] = src_data[_k]["lower_bound"]
