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
	.file	"llvm-link"
	.globl	fstatfs                         @ -- Begin function fstatfs
	.p2align	2
	.type	fstatfs,%function
	.code	32                              @ @fstatfs
fstatfs:
.Lfunc_begin0:
	.file	0 "/home/fyj/DiskD/tam/testcases/tam_oh0zpx3u" "/home/fyj/DiskD/WCET_Tool/WorkSpace/f1/fs_fstatfs.c" md5 0x13ca8e6576d4e95a22683ec0174bf1c3
	.file	1 "/home/fyj/DiskD" "WCET_Tool/WorkSpace/f1/fs_fstatfs.c" md5 0x13ca8e6576d4e95a22683ec0174bf1c3
	.loc	1 60 0                          @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:60:0
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
	sub	sp, sp, #48
	str	r1, [r11, #-12]                 @ 4-byte Spill
	sub	r1, r11, #4
.Ltmp0:
	.loc	1 73 9 prologue_end             @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:73:9
	bl	fs_getfilep
	mov	r1, r0
	str	r1, [r11, #-8]                  @ 4-byte Spill
	.loc	1 74 7                          @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:74:7
	cmn	r0, #1
	bgt	.LBB0_2
	b	.LBB0_1
.LBB0_1:                                @ %if.then
	.loc	1 0 7 is_stmt 0                 @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:0:7
	ldr	r0, [r11, #-8]                  @ 4-byte Reload
	str	r0, [r11, #-16]                 @ 4-byte Spill
	.loc	1 76 7 is_stmt 1                @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:76:7
	b	.LBB0_11
.LBB0_2:                                @ %if.end
	.loc	1 82 11                         @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:82:11
	ldr	r0, [r11, #-4]
	.loc	1 82 18 is_stmt 0               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:82:18
	ldr	r0, [r0, #16]
	str	r0, [r11, #-20]                 @ 4-byte Spill
	.loc	1 88 7 is_stmt 1                @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:88:7
	ldrh	r0, [r0, #14]
	and	r0, r0, #15
	cmp	r0, #3
	bne	.LBB0_7
	b	.LBB0_3
.LBB0_3:                                @ %if.then3
	.loc	1 95 20                         @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:95:20
	ldr	r0, [r11, #-20]                 @ 4-byte Reload
	ldr	r1, [r0, #16]
	mvn	r0, #37
	.loc	1 95 27 is_stmt 0               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:95:27
	cmp	r1, #0
	str	r0, [sp, #24]                   @ 4-byte Spill
	beq	.LBB0_6
	b	.LBB0_4
.LBB0_4:                                @ %land.lhs.true
	.loc	1 95 39                         @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:95:39
	ldr	r0, [r11, #-20]                 @ 4-byte Reload
	ldr	r0, [r0, #16]
	.loc	1 95 47                         @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:95:47
	ldr	r1, [r0, #84]
	mvn	r0, #37
	.loc	1 95 11                         @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:95:11
	cmp	r1, #0
	str	r0, [sp, #24]                   @ 4-byte Spill
	beq	.LBB0_6
	b	.LBB0_5
.LBB0_5:                                @ %if.then7
	.loc	1 99 11 is_stmt 1               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:99:11
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	mov	r1, #0
	mov	r2, #64
	bl	memset
	ldr	r1, [r11, #-12]                 @ 4-byte Reload
                                        @ kill: def $r2 killed $r0
	.loc	1 100 26                        @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:100:26
	ldr	r0, [r11, #-20]                 @ 4-byte Reload
	ldr	r2, [r0, #16]
	.loc	1 100 34 is_stmt 0              @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:100:34
	ldr	r2, [r2, #84]
	.loc	1 100 17                        @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:100:17
	mov	lr, pc
	bx	r2
	str	r0, [sp, #24]                   @ 4-byte Spill
	.loc	1 101 9 is_stmt 1               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:101:9
	b	.LBB0_6
.LBB0_6:                                @ %if.end13
	.loc	1 0 0 is_stmt 0                 @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:0:0
	ldr	r0, [sp, #24]                   @ 4-byte Reload
	str	r0, [sp, #20]                   @ 4-byte Spill
	.loc	1 102 5 is_stmt 1               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:102:5
	b	.LBB0_8
.LBB0_7:                                @ %if.else
	.loc	1 108 7                         @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:108:7
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	mov	r1, #0
	str	r1, [sp, #16]                   @ 4-byte Spill
	mov	r2, #64
	bl	memset
	ldr	r2, [r11, #-12]                 @ 4-byte Reload
                                        @ kill: def $r1 killed $r0
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	mov	r1, #4000
	orr	r1, r1, #36864
	.loc	1 109 22                        @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:109:22
	str	r1, [r2]
	mov	r1, #32
	.loc	1 110 22                        @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:110:22
	str	r1, [r2, #4]
	str	r0, [sp, #20]                   @ 4-byte Spill
	b	.LBB0_8
.LBB0_8:                                @ %if.end15
	.loc	1 0 0 is_stmt 0                 @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:0:0
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	str	r0, [sp, #12]                   @ 4-byte Spill
	.loc	1 116 15 is_stmt 1              @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:116:15
	ldr	r0, [r11, #-4]
	.loc	1 116 3 is_stmt 0               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:116:3
	bl	fs_putfilep
                                        @ kill: def $r1 killed $r0
	.loc	1 117 7 is_stmt 1               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:117:7
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	cmp	r0, #0
	bmi	.LBB0_10
	b	.LBB0_9
.LBB0_9:                                @ %if.then19
	.loc	1 0 7 is_stmt 0                 @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:0:7
	mov	r0, #0
	str	r0, [sp, #8]                    @ 4-byte Spill
	.loc	1 121 7 is_stmt 1               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:121:7
	b	.LBB0_14
.LBB0_10:                               @ %if.end20
	.loc	1 0 7 is_stmt 0                 @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:0:7
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	str	r0, [r11, #-16]                 @ 4-byte Spill
	.loc	1 117 14 is_stmt 1              @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:117:14
	b	.LBB0_11
.LBB0_11:                               @ %errout
	.loc	1 0 0 is_stmt 0                 @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:0:0
	ldr	r0, [r11, #-16]                 @ 4-byte Reload
	str	r0, [sp, #4]                    @ 4-byte Spill
	.loc	1 125 3 is_stmt 1               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:125:3
	b	.LBB0_12
.LBB0_12:                               @ %do.body
	ldr	r0, [sp, #4]                    @ 4-byte Reload
	rsb	r0, r0, #0
	str	r0, [sp]                        @ 4-byte Spill
	bl	__errno
	mov	r1, r0
	ldr	r0, [sp]                        @ 4-byte Reload
	str	r0, [r1]
	b	.LBB0_13
.LBB0_13:                               @ %do.end
	.loc	1 0 3 is_stmt 0                 @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:0:3
	mvn	r0, #0
	str	r0, [sp, #8]                    @ 4-byte Spill
	.loc	1 126 3 is_stmt 1               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:126:3
	b	.LBB0_14
.LBB0_14:                               @ %return
	.loc	1 0 0 is_stmt 0                 @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:0:0
	ldr	r0, [sp, #8]                    @ 4-byte Reload
	.loc	1 127 1 is_stmt 1               @ WCET_Tool/WorkSpace/f1/fs_fstatfs.c:127:1
	mov	sp, r11
	pop	{r11, lr}
	bx	lr
.Ltmp1:
.Lfunc_end0:
	.size	fstatfs, .Lfunc_end0-fstatfs
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
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
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.long	.Laddr_table_base0              @ DW_AT_addr_base
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",%progbits
	.long	16                              @ Length of String Offsets Set
	.short	5
	.short	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"clang version 14.0.6 (https://gitee.com/zzmmma/tam.git da2a436da583758d7c610dada3fa3f35c8d35100)" @ string offset=0
.Linfo_string1:
	.asciz	"/home/fyj/DiskD/WCET_Tool/WorkSpace/f1/fs_fstatfs.c" @ string offset=97
.Linfo_string2:
	.asciz	"/home/fyj/DiskD/tam/testcases/tam_oh0zpx3u" @ string offset=149
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
	.ident	"clang version 14.0.6 (https://gitee.com/zzmmma/tam.git da2a436da583758d7c610dada3fa3f35c8d35100)"
	.section	".note.GNU-stack","",%progbits
	.section	.debug_line,"",%progbits
.Lline_table_start0:
