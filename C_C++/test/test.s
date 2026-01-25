	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.eabi_attribute	6, 2	@ Tag_CPU_arch
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 1	@ Tag_THUMB_ISA_use
	.fpu	vfpv2
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 0	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"test.c"
	.globl	say_hello                       @ -- Begin function say_hello
	.p2align	2
	.type	say_hello,%function
	.code	32                              @ @say_hello
say_hello:
.Lfunc_begin0:
	.file	0 "/home/fyj/DiskN/WCET_Tool/C_C++/test" "test.c" md5 0x1728bdf09d5cf58858ed5e3ffba0d7ce
	.loc	0 3 0                           @ test.c:3:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:                                @ %entry
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	mov	r11, sp
	.cfi_def_cfa_register r11
.Ltmp0:
	.loc	0 4 5 prologue_end              @ test.c:4:5
	ldr	r0, .LCPI0_0
	bl	printf
	.loc	0 5 1                           @ test.c:5:1
	pop	{r11, lr}
	bx	lr
.Ltmp1:
	.p2align	2
@ %bb.1:
	.loc	0 0 1 is_stmt 0                 @ test.c:0:1
.LCPI0_0:
	.long	.L.str
.Lfunc_end0:
	.size	say_hello, .Lfunc_end0-say_hello
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	Func1                           @ -- Begin function Func1
	.p2align	2
	.type	Func1,%function
	.code	32                              @ @Func1
Func1:
.Lfunc_begin1:
	.loc	0 7 0 is_stmt 1                 @ test.c:7:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %entry
	.loc	0 12 1 prologue_end             @ test.c:12:1
	bx	lr
.Ltmp2:
.Lfunc_end1:
	.size	Func1, .Lfunc_end1-Func1
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	Func2                           @ -- Begin function Func2
	.p2align	2
	.type	Func2,%function
	.code	32                              @ @Func2
Func2:
.Lfunc_begin2:
	.loc	0 14 0                          @ test.c:14:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %entry
	mov	r1, r0
.Ltmp3:
	.loc	0 15 14 prologue_end            @ test.c:15:14
	ldr	r0, [r1]
	.loc	0 15 19 is_stmt 0               @ test.c:15:19
	add	r0, r0, #10
	.loc	0 15 11                         @ test.c:15:11
	str	r0, [r1]
	.loc	0 19 1 is_stmt 1                @ test.c:19:1
	bx	lr
.Ltmp4:
.Lfunc_end2:
	.size	Func2, .Lfunc_end2-Func2
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	factorial                       @ -- Begin function factorial
	.p2align	2
	.type	factorial,%function
	.code	32                              @ @factorial
factorial:
.Lfunc_begin3:
	.loc	0 28 0                          @ test.c:28:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %entry
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	mov	r11, sp
	.cfi_def_cfa_register r11
	sub	sp, sp, #8
	mov	r1, r0
	str	r1, [sp]                        @ 4-byte Spill
	mov	r0, #1
.Ltmp5:
	.loc	0 29 16 prologue_end            @ test.c:29:16
	cmp	r1, #2
	str	r0, [sp, #4]                    @ 4-byte Spill
	blo	.LBB3_2
	b	.LBB3_1
.LBB3_1:                                @ %if.end
	.loc	0 32 28                         @ test.c:32:28
	ldr	r0, [sp]                        @ 4-byte Reload
	sub	r0, r0, #1
	.loc	0 32 16 is_stmt 0               @ test.c:32:16
	bl	factorial
	ldr	r2, [sp]                        @ 4-byte Reload
	mov	r1, r0
	.loc	0 32 14                         @ test.c:32:14
	mul	r0, r1, r2
	str	r0, [sp, #4]                    @ 4-byte Spill
	.loc	0 32 5                          @ test.c:32:5
	b	.LBB3_2
.LBB3_2:                                @ %return
	.loc	0 0 0                           @ test.c:0:0
	ldr	r0, [sp, #4]                    @ 4-byte Reload
	.loc	0 33 1 is_stmt 1                @ test.c:33:1
	mov	sp, r11
	pop	{r11, lr}
	bx	lr
.Ltmp6:
.Lfunc_end3:
	.size	factorial, .Lfunc_end3-factorial
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	main                            @ -- Begin function main
	.p2align	2
	.type	main,%function
	.code	32                              @ @main
main:
.Lfunc_begin4:
	.loc	0 35 0                          @ test.c:35:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %entry
	mov	r0, #0
.Ltmp7:
	.loc	0 64 5 prologue_end             @ test.c:64:5
	bx	lr
.Ltmp8:
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"Hello, \351\227\264\346\216\245\350\260\203\347\224\250\357\274\201\n"
	.size	.L.str, 24

	.section	.debug_abbrev,"",%progbits
	.byte	1                               @ Abbreviation Code
	.byte	17                              @ DW_TAG_compile_unit
	.byte	0                               @ DW_CHILDREN_no
	.byte	37                              @ DW_AT_producer
	.byte	37                              @ DW_FORM_strx1
	.byte	19                              @ DW_AT_language
	.byte	5                               @ DW_FORM_data2
	.byte	3                               @ DW_AT_name
	.byte	37                              @ DW_FORM_strx1
	.byte	114                             @ DW_AT_str_offsets_base
	.byte	23                              @ DW_FORM_sec_offset
	.byte	16                              @ DW_AT_stmt_list
	.byte	23                              @ DW_FORM_sec_offset
	.byte	27                              @ DW_AT_comp_dir
	.byte	37                              @ DW_FORM_strx1
	.byte	17                              @ DW_AT_low_pc
	.byte	27                              @ DW_FORM_addrx
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	115                             @ DW_AT_addr_base
	.byte	23                              @ DW_FORM_sec_offset
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	0                               @ EOM(3)
	.section	.debug_info,"",%progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 @ Length of Unit
.Ldebug_info_start0:
	.short	5                               @ DWARF version number
	.byte	1                               @ DWARF Unit Type
	.byte	4                               @ Address Size (in bytes)
	.long	.debug_abbrev                   @ Offset Into Abbrev. Section
	.byte	1                               @ Abbrev [1] 0xc:0x17 DW_TAG_compile_unit
	.byte	0                               @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.byte	1                               @ DW_AT_name
	.long	.Lstr_offsets_base0             @ DW_AT_str_offsets_base
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.byte	2                               @ DW_AT_comp_dir
	.byte	0                               @ DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin0       @ DW_AT_high_pc
	.long	.Laddr_table_base0              @ DW_AT_addr_base
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",%progbits
	.long	16                              @ Length of String Offsets Set
	.short	5
	.short	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)" @ string offset=0
.Linfo_string1:
	.asciz	"test.c"                        @ string offset=105
.Linfo_string2:
	.asciz	"/home/fyj/DiskN/WCET_Tool/C_C++/test" @ string offset=112
	.section	.debug_str_offsets,"",%progbits
	.long	.Linfo_string0
	.long	.Linfo_string1
	.long	.Linfo_string2
	.section	.debug_addr,"",%progbits
	.long	.Ldebug_addr_end0-.Ldebug_addr_start0 @ Length of contribution
.Ldebug_addr_start0:
	.short	5                               @ DWARF version number
	.byte	4                               @ Address size
	.byte	0                               @ Segment selector size
.Laddr_table_base0:
	.long	.Lfunc_begin0
.Ldebug_addr_end0:
	.ident	"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"
	.section	".note.GNU-stack","",%progbits
	.section	.debug_line,"",%progbits
.Lline_table_start0:
