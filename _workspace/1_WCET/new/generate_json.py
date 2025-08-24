#!/usr/bin/env python3

import json
import os

from argparse import ArgumentParser
from pathlib import Path

tasks = list()

parser = ArgumentParser(description='Generate json files for testing')
parser.add_argument(
    '-s', '--src', help='source directory (default: ./src)', default='./src')

args = parser.parse_args()

src = os.listdir(args.src)
src_dir = Path(os.path.abspath(args.src))
tasks = [f.replace('.c', '') for f in src]
tasks = [x for x in tasks if x != 'lib']

tasks_func = [f.replace('.c', '') for f in src]
tasks_func = [x for x in tasks_func if x != 'lib']

libs = [f'lib{f.replace(".c", "")}' for f in src]
libs = [x for x in libs if x != 'liblib']
# check if the file exists
for lib in libs:
    lib_path = src_dir / 'lib' / f'{lib}.so'
    if not os.path.exists(lib_path):
        print(f'[-] {lib}.so not found')
        exit(1)

    nm_command = f'nm {lib_path}'
    p = os.popen(nm_command).read()

    idx = libs.index(lib)
    func = tasks_func[idx]
    if func not in p:
        print(f'[-] Function {func} not found in {lib}.so')
        exit(1)

print('[+] All files and functions found')


idx = 0
format_str = r'CoreInfo.json'

# for i in range(len(tasks)):
for j in range(len(tasks)):
    core_0_task = {
        "core": 0,
        "tasks": [
            {
                "function": 'main',
                "lib": f'{libs[j]}_1.so'
            }
        ]
    }

    output = [core_0_task]
    json_path = Path(os.path.abspath(src_dir /tasks[j]))


    with open(json_path/ format_str.format(idx), 'w') as f:
        json.dump(output, f, indent=4)
    idx += 1
