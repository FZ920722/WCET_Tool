#!/usr/bin/env python3

import os
import re
from argparse import ArgumentParser

def is_already_commented(content, match_start, match_end):
    """
    检查匹配的文本是否已经在注释中
    """
    # 获取匹配文本前面的内容
    text_before = content[:match_start]
    
    # 检查是否在单行注释中
    lines_before = text_before.split('\n')
    current_line_start = text_before.rfind('\n') + 1
    current_line = content[current_line_start:match_start]
    
    # 如果当前行已经有//注释
    if '//' in current_line:
        return True
    
    # 检查是否在块注释中
    last_block_comment_start = text_before.rfind('/*')
    last_block_comment_end = text_before.rfind('*/')
    
    # 如果找到了/*但没有对应的*/，说明在块注释中
    if last_block_comment_start > last_block_comment_end:
        return True
    
    return False

def find_complete_statement(content, directive_match):
    """
    找到包含指令的完整语句边界
    改进版：更好地处理没有分号的情况
    """
    start_pos = directive_match.start()
    
    # 向前查找语句的开始
    # 找到前一个分号或行首
    prev_semicolon = content.rfind(';', 0, start_pos)
    prev_newline = content.rfind('\n', 0, start_pos)
    
    statement_start = max(prev_semicolon + 1 if prev_semicolon != -1 else 0, 
                         prev_newline + 1 if prev_newline != -1 else 0)
    
    # 向后查找语句的结束
    directive_end = directive_match.end()
    
    # 查找下一个分号
    next_semicolon = content.find(';', directive_end)
    
    # 查找下一个换行符
    next_newline = content.find('\n', directive_end)
    
    # 查找下一个右大括号（可能是语句块的结束）
    next_brace = content.find('}', directive_end)
    
    # 确定语句结束位置
    potential_ends = []
    
    if next_semicolon != -1:
        potential_ends.append(next_semicolon + 1)  # 包含分号
    
    if next_newline != -1:
        potential_ends.append(next_newline)
    
    if next_brace != -1:
        potential_ends.append(next_brace)
    
    if potential_ends:
        # 取最小的有效结束位置
        statement_end = min(potential_ends)
    else:
        # 没有找到任何结束标记，到文件结尾
        statement_end = len(content)
    
    return statement_start, statement_end

def is_safe_to_comment(content, start_pos, end_pos):
    """
    检查是否安全注释这段代码
    避免注释掉包含多个语句的复杂行
    """
    statement_text = content[start_pos:end_pos].strip()
    
    # 如果语句中包含多个分号，可能包含多个语句
    semicolon_count = statement_text.count(';')
    if semicolon_count > 1:
        # 检查是否在同一行
        newline_count = statement_text.count('\n')
        if newline_count == 0:
            # 同一行有多个分号，需要更精确的处理
            return False
    
    return True

def smart_comment_statement(content, start_pos, end_pos, directive_match):
    """
    智能注释语句，处理复杂情况
    """
    original_statement = content[start_pos:end_pos]
    
    # 如果语句很简单，直接注释整个语句
    if ';' not in original_statement or original_statement.strip().endswith(';'):
        return f"/* {original_statement} */"
    
    # 复杂情况：一行中有多个语句，只注释包含指令的部分
    directive_pattern = re.compile(
        r'(DEBUGASSERT|assert|exit|setjmp|pthread_exit)\s*\([^)]*\)',
        re.IGNORECASE
    )
    
    # 在语句中查找指令
    directive_match_in_statement = directive_pattern.search(original_statement)
    if not directive_match_in_statement:
        return f"/* {original_statement} */"
    
    # 找到指令前后的部分
    before_directive = original_statement[:directive_match_in_statement.start()]
    after_directive = original_statement[directive_match_in_statement.end():]
    
    # 检查指令后面是否有分号
    semicolon_after = after_directive.find(';')
    if semicolon_after != -1:
        # 指令后面有分号，说明这是一个完整的子语句
        directive_part = original_statement[directive_match_in_statement.start():directive_match_in_statement.end() + semicolon_after + 1]
        remaining_after = after_directive[semicolon_after + 1:]
        
        # 只注释包含指令的子语句
        commented = before_directive + "/* " + directive_part + " */" + remaining_after
        return commented
    else:
        # 没有分号的情况，检查是否有其他结束标记
        # 查找换行符、右大括号等
        newline_after = after_directive.find('\n')
        brace_after = after_directive.find('}')
        
        if newline_after != -1:
            # 到行尾结束
            directive_part = original_statement[directive_match_in_statement.start():directive_match_in_statement.end() + newline_after]
            remaining_after = after_directive[newline_after:]
            commented = before_directive + "/* " + directive_part + " */" + remaining_after
            return commented
        elif brace_after != -1:
            # 到右大括号结束
            directive_part = original_statement[directive_match_in_statement.start():directive_match_in_statement.end() + brace_after]
            remaining_after = after_directive[brace_after:]
            commented = before_directive + "/* " + directive_part + " */" + remaining_after
            return commented
        else:
            # 无法精确分割，回退到注释整个语句
            return f"/* {original_statement} */"

def comment_directives_in_file(file_path):
    """
    在文件中识别并注释掉指定的指令
    """
    # 定义要识别的指令模式 - 现在包括 pthread_exit
    directives_pattern = re.compile(
        r'(DEBUGASSERT|assert|exit|setjmp|pthread_exit)\s*\([^)]*\)',
        re.IGNORECASE
    )
    
    try:
        # 读取文件内容
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        # 查找所有匹配的指令
        matches = list(directives_pattern.finditer(content))
        if not matches:
            return False
        
        modified = False
        new_content = content
        
        # 按位置从后往前处理，避免位置偏移问题
        matches_sorted = sorted(matches, key=lambda x: x.start(), reverse=True)
        
        for match in matches_sorted:
            if is_already_commented(content, match.start(), match.end()):
                continue
            
            # 找到完整的语句边界
            start_pos, end_pos = find_complete_statement(content, match)
            
            # 检查是否安全注释
            if not is_safe_to_comment(content, start_pos, end_pos):
                # 不安全的情况，使用智能注释
                commented_text = smart_comment_statement(content, start_pos, end_pos, match)
            else:
                # 安全情况，直接注释整个语句
                statement_text = new_content[start_pos:end_pos]
                commented_text = f"/* {statement_text} */"
            
            # 计算原始行号用于输出
            original_line_num = content[:match.start()].count('\n') + 1
            statement_preview = content[start_pos:end_pos].strip()[:50]  # 预览前50个字符
            print(f"注释: {file_path}:{original_line_num} - {statement_preview}...")
            
            # 替换内容
            new_content = new_content[:start_pos] + commented_text + new_content[end_pos:]
            
            modified = True
        
        # 如果文件被修改，写回文件
        if modified:
            with open(file_path, 'w', encoding='utf-8', errors='ignore') as f:
                f.write(new_content)
        
        return modified
        
    except Exception as e:
        print(f"处理文件 {file_path} 时出错: {e}")
        return False

if __name__ == "__main__":
    parser = ArgumentParser(description='识别并注释掉指定的指令(DEBUGASSERT, assert, exit, setjmp, pthread_exit)')
    parser.add_argument('--src-dir', default='/home/hwq/Timing-Analysis-Multicores/testcases/test/fmref/',
                       help='源代码目录路径')
    parser.add_argument('--dry-run', action='store_true',
                       help='只显示将要注释的行，不实际修改文件')
    
    args = parser.parse_args()
    
    if not os.path.exists(args.src_dir):
        print(f"错误: 目录不存在 - {args.src_dir}")
        exit()
    
    # 收集所有C文件
    c_files = []
    for root, dirs, files in os.walk(args.src_dir):
        for file in files:
            if file.endswith('.c'):
                c_files.append(os.path.join(root, file))
    
    print(f"找到 {len(c_files)} 个C文件")
    
    if not c_files:
        print("错误: 没有找到任何.c文件")
        exit()
    
    # 处理文件
    modified_count = 0
    
    for file_path in c_files:
        if args.dry_run:
            # 干跑模式：只显示不修改
            try:
                with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                
                directives_pattern = re.compile(
                    r'(DEBUGASSERT|assert|exit|setjmp|pthread_exit)\s*\([^)]*\)',
                    re.IGNORECASE
                )
                
                matches = directives_pattern.finditer(content)
                for match in matches:
                    if not is_already_commented(content, match.start(), match.end()):
                        start_pos, end_pos = find_complete_statement(content, match)
                        statement_text = content[start_pos:end_pos].strip()[:50]
                        line_num = content[:match.start()].count('\n') + 1
                        print(f"将注释: {file_path}:{line_num} - {statement_text}...")
            except Exception as e:
                print(f"读取文件 {file_path} 时出错: {e}")
        else:
            # 实际修改模式
            if comment_directives_in_file(file_path):
                modified_count += 1
    
    if not args.dry_run:
        print(f"\n完成! 修改了 {modified_count} 个文件")