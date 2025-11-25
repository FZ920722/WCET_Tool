import os
import sys
import shutil
import re
from typing import List

def get_absolute_file_path(file_path):
    """验证并返回文件的绝对路径"""
    normalized_path = os.path.normpath(file_path)
    if not os.path.exists(normalized_path):
        print(f"错误: 路径 '{normalized_path}' 不存在", file=sys.stderr)
        return None
    return os.path.abspath(normalized_path)

def get_last_nuttx_path(file_path):
    """从文件路径中提取最后一个包含'nuttx'的路径"""
    absolute_path = os.path.abspath(file_path)
    current = absolute_path
    while True:
        parent = os.path.dirname(current)
        if parent == current:
            break
        if os.path.basename(parent).lower() == 'nuttx':
            return parent
        current = parent
    return ""

ASM_RE = re.compile(r'\b__asm__(?:\s*__volatile__)?\b')

def is_blank_or_comment_line(s: str) -> bool:
    st = s.strip()
    return not st or st.startswith('//')

def strip_strings(line: str) -> str:
    # 去掉字符串常量
    return re.sub(r'"([^"\\]|\\.)*"|\'([^\'\\]|\\.)*\'', '', line)

def count_braces_outside_comments_and_strings(lines: List[str]) -> int:
    depth = 0
    in_block_comment = False
    for ln in lines:
        s = ln
        idx = 0
        while idx < len(s):
            if not in_block_comment:
                start = s.find("/*", idx)
                if start == -1:
                    rest = strip_strings(s[idx:])
                    depth += rest.count("{") - rest.count("}")
                    break
                else:
                    rest = strip_strings(s[idx:start])
                    depth += rest.count("{") - rest.count("}")
                    in_block_comment = True
                    idx = start + 2
            else:
                end = s.find("*/", idx)
                if end == -1:
                    break
                else:
                    in_block_comment = False
                    idx = end + 2
    return depth

def comment_asm_functions(path: str):

    only_macro = False
    only_func = False
    bak = path + ".bak"

    if not os.path.exists(bak):
        shutil.copy2(path, bak)
        print(f"处理: {path}（备份: {bak}）")
    else:
        print(f"备份文件已存在，跳过备份: {bak}")

    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        orig_lines = f.readlines()

    out_lines: List[str] = []
    i = 0
    N = len(orig_lines)

    in_block_comment = False
    while i < N:
        line = orig_lines[i]
        stripped = line.lstrip()
        if not in_block_comment:
            if '/*' in line and '*/' not in line:
                in_block_comment = True
        else:
            if '*/' in line:
                in_block_comment = False
            out_lines.append(line)
            i += 1
            continue

        # ---------- 检测宏 ---------- 
        if not only_func and re.match(r'^#\s*define\b', stripped):
            macro_buf = [line]
            j = i
            brace_depth = 0
            brace_depth += count_braces_outside_comments_and_strings([line])

            while True:
                last = macro_buf[-1]
                continued = last.rstrip().endswith("\\")
                if not continued and brace_depth <= 0:
                    break
                j += 1
                if j >= N:
                    break
                next_line = orig_lines[j]
                macro_buf.append(next_line)
                brace_depth += count_braces_outside_comments_and_strings([next_line])

            macro_join = "".join(macro_buf)
            if ASM_RE.search(macro_join):
                out_lines.append("// 包含汇编指令的宏被注释 - 开始\n")
                for ml in macro_buf:
                    if ml.strip():
                        indent = len(ml) - len(ml.lstrip())
                        out_lines.append(" " * indent + "// " + ml.lstrip())
                    else:
                        out_lines.append("//\n")
                out_lines.append("// 包含汇编指令的宏被注释 - 结束\n")
                print(f"注释宏: {macro_buf[0].strip()}")
            else:
                out_lines.extend(macro_buf)

            i = j + 1
            continue

        # ---------- 检测函数 ----------
        if not only_macro:
            if stripped.startswith("#"):
                preproc_buf = [line]
                j = i
                while preproc_buf[-1].rstrip().endswith("\\") and j + 1 < N:
                    j += 1
                    preproc_buf.append(orig_lines[j])
                out_lines.extend(preproc_buf)
                i = j + 1
                continue

            if stripped.strip().startswith(("typedef", "struct", "enum", "union")):
                out_lines.append(line)
                i += 1
                continue

            if stripped.startswith("/*") or stripped.startswith("*") or stripped.startswith("//"):
                out_lines.append(line)
                i += 1
                continue

            if '(' in line and not re.search(r';\s*$', line):  
                sig_buf = [line]
                j = i
                seen_open_paren = line.count('(') - line.count(')')
                body_started = '{' in line
                declaration_ended = bool(re.search(r';\s*$', line))
                while not body_started and not declaration_ended and j + 1 < N:
                    j += 1
                    ln = orig_lines[j]
                    sig_buf.append(ln)
                    if '{' in ln:
                        body_started = True
                    if re.search(r';\s*$', ln):
                        declaration_ended = True
                        break
                    seen_open_paren += ln.count('(') - ln.count(')')
                if body_started:
                    func_buf = sig_buf[:]
                    brace_depth = count_braces_outside_comments_and_strings(func_buf)
                    while brace_depth <= 0 and j + 1 < N:
                        j += 1
                        ln = orig_lines[j]
                        func_buf.append(ln)
                        brace_depth = count_braces_outside_comments_and_strings(func_buf)
                        if brace_depth > 0:
                            break
                    while brace_depth > 0 and j + 1 < N:
                        j += 1
                        ln = orig_lines[j]
                        func_buf.append(ln)
                        brace_depth += count_braces_outside_comments_and_strings([ln])
                    func_join = "".join(func_buf)
                    if ASM_RE.search(func_join):
                        out_lines.append("// 包含汇编指令的函数被注释 - 开始\n")
                        for fl in func_buf:
                            if fl.strip():
                                indent = len(fl) - len(fl.lstrip())
                                out_lines.append(" " * indent + "// " + fl.lstrip())
                            else:
                                out_lines.append("//\n")
                        out_lines.append("// 包含汇编指令的函数被注释 - 结束\n")
                        m = re.search(r'([a-zA-Z_][a-zA-Z0-9_]*)\s*\(', sig_buf[0])
                        fname = m.group(1) if m else "<unknown>"
                        print(f"注释函数: {fname}")
                    else:
                        out_lines.extend(func_buf)
                    i = j + 1
                    continue
                else:
                    out_lines.extend(sig_buf)
                    i = j + 1
                    continue

        out_lines.append(line)
        i += 1

    with open(path, "w", encoding="utf-8") as f:
        f.writelines(out_lines)
    


def process_c_files(directory):
    """遍历目录下所有.c/.h文件"""
    if not os.path.isdir(directory):
        print(f"错误: '{directory}' 不是目录", file=sys.stderr)
        return

    processed_count = 0
    asm_function_count = 0
    
    # for root, _, files in os.walk(directory):
    #     for name in files:
    #         if name.endswith((".c", ".h")):
    #             full = os.path.join(root, name)
    #             try:
    #                 comment_asm_functions(full)
    #                 processed_count += 1
    #             except Exception as e:
    #                 print(f"处理失败 {full}: {e}", file=sys.stderr)
    #     #break

    for name in os.listdir(directory):
        full = os.path.join(directory, name)
        if os.path.isfile(full) and name.endswith((".c", ".h")):
            try:
                comment_asm_functions(full)
                processed_count += 1
            except Exception as e:
                print(f"处理失败 {full}: {e}", file=sys.stderr)
                
    print(f"处理完成: 共处理 {processed_count} 个文件")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("用法: python assemblyFunctionProcessor.py <文件或目录路径>")
        sys.exit(1)

    path = sys.argv[1]
    abs_path = get_absolute_file_path(path)
    if not abs_path:
        sys.exit(1)

    nuttx_path = get_last_nuttx_path(abs_path)
    if not nuttx_path:
        print("未找到包含 'nuttx' 的路径")
        sys.exit(1)

    target_dirs = [
        os.path.join(nuttx_path, "arch/arm/include/armv7-a"),
        os.path.join(nuttx_path, "arch/arm/include"),
    ]

    for target_dir in target_dirs:
        if not os.path.exists(target_dir):
            print(f"错误: 目标目录不存在: {target_dir}")
            sys.exit(1)

        print(f"\n即将处理目录: {target_dir}")
        print(f"目录内容: {os.listdir(target_dir)}")

        confirm = input("是否继续？(y/n): ").strip().lower()
        if confirm == "y":
            process_c_files(target_dir)
            print("处理完成")
        else:
            print("操作已取消")
        