	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.eabi_attribute	6, 10	@ Tag_CPU_arch
	.eabi_attribute	7, 65	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.fpu	vfpv3
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"llvm-link"
	.globl	file_fcntl                      @ -- Begin function file_fcntl
	.p2align	2
	.type	file_fcntl,%function
	.code	32                              @ @file_fcntl
file_fcntl:
.Lfunc_begin0:
	.file	0 "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/fcntl/Compile" "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c" md5 0x82f0ae00e0aeca46555c7e5a196e459f
	.file	1 "/home/fyj/Desktop/data" "1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c" md5 0x82f0ae00e0aeca46555c7e5a196e459f
	.loc	1 299 0                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:299:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	push	{r11, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset lr, -12
	.cfi_offset r11, -16
	mov	r11, sp
	.cfi_def_cfa_register r11
	sub	sp, sp, #8
	str	r3, [r11, #12]
	str	r2, [r11, #8]
	add	r2, r11, #8
.Ltmp0:
	.loc	1 305 3 prologue_end            @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:305:3
	str	r2, [sp, #4]
	.loc	1 311 9                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:311:9
	ldr	r2, [sp, #4]
	bl	file_vfcntl
	.loc	1 314 3                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:314:3
	mov	sp, r11
	pop	{r11, lr}
	add	sp, sp, #8
	bx	lr
.Ltmp1:
.Lfunc_end0:
	.size	file_fcntl, .Lfunc_end0-file_fcntl
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function file_vfcntl
	.type	file_vfcntl,%function
	.code	32                              @ @file_vfcntl
file_vfcntl:
.Lfunc_begin1:
	.loc	1 50 0                          @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:50:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	mov	r11, sp
	.cfi_def_cfa_register r11
	sub	sp, sp, #56
	str	r1, [r11, #-16]                 @ 4-byte Spill
	str	r0, [r11, #-12]                 @ 4-byte Spill
	str	r2, [r11, #-4]
.Ltmp2:
	.loc	1 55 15 prologue_end            @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:55:15
	ldr	r0, [r0, #16]
	.loc	1 55 7 is_stmt 0                @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:55:7
	cmp	r0, #0
	bne	.LBB1_2
	b	.LBB1_1
.LBB1_1:
	.loc	1 0 7                           @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:0:7
	mvn	r0, #8
	str	r0, [r11, #-20]                 @ 4-byte Spill
	.loc	1 57 7 is_stmt 1                @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:57:7
	b	.LBB1_29
.LBB1_2:
	.loc	1 60 3                          @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:60:3
	ldr	r0, [r11, #-16]                 @ 4-byte Reload
	mov	r1, r0
	str	r1, [r11, #-24]                 @ 4-byte Spill
	cmp	r0, #20
	bhi	.LBB1_27
@ %bb.3:
	.loc	1 0 3 is_stmt 0                 @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:0:3
	ldr	r1, [r11, #-24]                 @ 4-byte Reload
	adr	r0, .LJTI1_0
	ldr	r0, [r0, r1, lsl #2]
	mov	pc, r0
@ %bb.4:
	.p2align	2
.LJTI1_0:
	.long	.LBB1_5
	.long	.LBB1_7
	.long	.LBB1_14
	.long	.LBB1_27
	.long	.LBB1_21
	.long	.LBB1_20
	.long	.LBB1_27
	.long	.LBB1_27
	.long	.LBB1_8
	.long	.LBB1_15
	.long	.LBB1_27
	.long	.LBB1_22
	.long	.LBB1_23
	.long	.LBB1_20
	.long	.LBB1_27
	.long	.LBB1_24
	.long	.LBB1_27
	.long	.LBB1_27
	.long	.LBB1_6
	.long	.LBB1_25
	.long	.LBB1_26
.LBB1_5:
	.loc	1 76 33 is_stmt 1               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:76:33
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	ldr	r1, [r11, #-4]
	add	r2, r1, #4
	str	r2, [r11, #-4]
	ldr	r1, [r1]
	mov	r2, #0
	.loc	1 76 17 is_stmt 0               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:76:17
	bl	file_dup
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 78 9 is_stmt 1                @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:78:9
	b	.LBB1_28
.LBB1_6:
	.loc	1 82 33                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:82:33
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	ldr	r1, [r11, #-4]
	add	r2, r1, #4
	str	r2, [r11, #-4]
	ldr	r1, [r1]
	mov	r2, #1024
	.loc	1 82 17 is_stmt 0               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:82:17
	bl	file_dup
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 84 9 is_stmt 1                @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:84:9
	b	.LBB1_28
.LBB1_7:
	.loc	1 94 24                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:94:24
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	ldr	r0, [r0]
	.loc	1 94 17 is_stmt 0               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:94:17
	ubfx	r0, r0, #10, #1
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 96 9 is_stmt 1                @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:96:9
	b	.LBB1_28
.LBB1_8:
	.loc	1 107 24                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:107:24
	ldr	r0, [r11, #-4]
	add	r1, r0, #4
	str	r1, [r11, #-4]
	ldr	r0, [r0]
	str	r0, [sp, #24]                   @ 4-byte Spill
	.loc	1 109 15                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:109:15
	cmp	r0, #2
	blo	.LBB1_10
	b	.LBB1_9
.LBB1_9:
	.loc	1 0 15 is_stmt 0                @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:0:15
	mvn	r0, #37
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 112 15 is_stmt 1              @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:112:15
	b	.LBB1_28
.LBB1_10:
	.loc	1 115 15                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:115:15
	ldr	r0, [sp, #24]                   @ 4-byte Reload
	tst	r0, #1
	beq	.LBB1_12
	b	.LBB1_11
.LBB1_11:
	.loc	1 117 21                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:117:21
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	movw	r1, #779
	mov	r2, #0
	bl	file_ioctl
	str	r0, [sp, #20]                   @ 4-byte Spill
	.loc	1 118 13                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:118:13
	b	.LBB1_13
.LBB1_12:
	.loc	1 121 21                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:121:21
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	mov	r1, #780
	mov	r2, #0
	bl	file_ioctl
	str	r0, [sp, #20]                   @ 4-byte Spill
	b	.LBB1_13
.LBB1_13:
	.loc	1 0 0 is_stmt 0                 @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:0:0
	ldr	r0, [sp, #20]                   @ 4-byte Reload
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 124 9 is_stmt 1               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:124:9
	b	.LBB1_28
.LBB1_14:
	.loc	1 137 24                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:137:24
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	ldr	r0, [r0]
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 139 9                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:139:9
	b	.LBB1_28
.LBB1_15:
	.loc	1 152 24                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:152:24
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	ldr	r1, [r11, #-4]
	add	r2, r1, #4
	str	r2, [r11, #-4]
	ldr	r1, [r1]
	str	r1, [sp, #8]                    @ 4-byte Spill
	.loc	1 153 26                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:153:26
	ubfx	r1, r1, #6, #1
	.loc	1 153 15 is_stmt 0              @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:153:15
	str	r1, [r11, #-8]
	movw	r1, #778
	sub	r2, r11, #8
	.loc	1 155 17 is_stmt 1              @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:155:17
	bl	file_ioctl
	mov	r1, r0
	mov	r0, r1
	str	r0, [sp, #12]                   @ 4-byte Spill
	.loc	1 156 15                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:156:15
	cmp	r1, #0
	str	r0, [sp, #16]                   @ 4-byte Spill
	bne	.LBB1_19
	b	.LBB1_16
.LBB1_16:
	.loc	1 158 31                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:158:31
	ldr	r0, [sp, #12]                   @ 4-byte Reload
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	ldr	r3, [r11, #-12]                 @ 4-byte Reload
	and	r12, r1, #144
	.loc	1 159 31                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:159:31
	ldr	r2, [r3]
	bic	r2, r2, #144
	.loc	1 160 31                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:160:31
	orr	r2, r2, r12
	str	r2, [r3]
	.loc	1 162 19                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:162:19
	tst	r1, #16
	str	r0, [sp, #4]                    @ 4-byte Spill
	beq	.LBB1_18
	b	.LBB1_17
.LBB1_17:
	.loc	1 164 25                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:164:25
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	mov	r2, sp
	mov	r1, #2
	str	r1, [r2]
	mov	r3, #0
	mov	r2, r3
	bl	file_seek
	str	r0, [sp, #4]                    @ 4-byte Spill
	.loc	1 165 17                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:165:17
	b	.LBB1_18
.LBB1_18:
	.loc	1 0 0 is_stmt 0                 @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:0:0
	ldr	r0, [sp, #4]                    @ 4-byte Reload
	str	r0, [sp, #16]                   @ 4-byte Spill
	.loc	1 166 13 is_stmt 1              @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:166:13
	b	.LBB1_19
.LBB1_19:
	.loc	1 0 0 is_stmt 0                 @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:0:0
	ldr	r0, [sp, #16]                   @ 4-byte Reload
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 168 9 is_stmt 1               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:168:9
	b	.LBB1_28
.LBB1_20:
	.loc	1 0 9 is_stmt 0                 @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:0:9
	mvn	r0, #8
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 188 9 is_stmt 1               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:188:9
	b	.LBB1_28
.LBB1_21:
	.loc	1 202 28                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:202:28
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	ldr	r1, [r11, #-4]
	add	r2, r1, #4
	str	r2, [r11, #-4]
	ldr	r2, [r1]
	movw	r1, #787
	.loc	1 201 17                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:201:17
	bl	file_ioctl
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 205 9                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:205:9
	b	.LBB1_28
.LBB1_22:
	.loc	1 219 28                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:219:28
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	ldr	r1, [r11, #-4]
	add	r2, r1, #4
	str	r2, [r11, #-4]
	ldr	r2, [r1]
	movw	r1, #786
	.loc	1 218 17                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:218:17
	bl	file_ioctl
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 222 9                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:222:9
	b	.LBB1_28
.LBB1_23:
	.loc	1 235 28                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:235:28
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	ldr	r1, [r11, #-4]
	add	r2, r1, #4
	str	r2, [r11, #-4]
	ldr	r2, [r1]
	mov	r1, #788
	.loc	1 234 17                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:234:17
	bl	file_ioctl
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 238 9                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:238:9
	b	.LBB1_28
.LBB1_24:
	.loc	1 245 50                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:245:50
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	ldr	r1, [r11, #-4]
	add	r2, r1, #4
	str	r2, [r11, #-4]
	ldr	r2, [r1]
	movw	r1, #771
	.loc	1 245 17 is_stmt 0              @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:245:17
	bl	file_ioctl
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 248 9 is_stmt 1               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:248:9
	b	.LBB1_28
.LBB1_25:
	.loc	1 255 52                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:255:52
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	ldr	r1, [r11, #-4]
	add	r2, r1, #4
	str	r2, [r11, #-4]
	ldr	r2, [r1]
	movw	r1, #6149
	.loc	1 255 17 is_stmt 0              @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:255:17
	bl	file_ioctl
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 258 9 is_stmt 1               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:258:9
	b	.LBB1_28
.LBB1_26:
	.loc	1 264 17                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:264:17
	ldr	r0, [r11, #-12]                 @ 4-byte Reload
	movw	r1, #6150
	bl	file_ioctl
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 267 9                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:267:9
	b	.LBB1_28
.LBB1_27:
	.loc	1 0 9 is_stmt 0                 @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:0:9
	mvn	r0, #21
	str	r0, [sp, #28]                   @ 4-byte Spill
	.loc	1 269 9 is_stmt 1               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:269:9
	b	.LBB1_28
.LBB1_28:
	.loc	1 0 0 is_stmt 0                 @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:0:0
	ldr	r0, [sp, #28]                   @ 4-byte Reload
	str	r0, [r11, #-20]                 @ 4-byte Spill
	.loc	1 272 3 is_stmt 1               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:272:3
	b	.LBB1_29
.LBB1_29:
	.loc	1 0 0 is_stmt 0                 @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:0:0
	ldr	r0, [r11, #-20]                 @ 4-byte Reload
	.loc	1 273 1 is_stmt 1               @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:273:1
	mov	sp, r11
	pop	{r11, pc}
.Ltmp3:
.Lfunc_end1:
	.size	file_vfcntl, .Lfunc_end1-file_vfcntl
	.cfi_endproc
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	fcntl                           @ -- Begin function fcntl
	.p2align	2
	.type	fcntl,%function
	.code	32                              @ @fcntl
fcntl:
.Lfunc_begin2:
	.loc	1 337 0                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:337:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	push	{r11, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset lr, -12
	.cfi_offset r11, -16
	mov	r11, sp
	.cfi_def_cfa_register r11
	sub	sp, sp, #32
	str	r1, [sp, #16]                   @ 4-byte Spill
	str	r3, [r11, #12]
	str	r2, [r11, #8]
	add	r1, r11, #8
.Ltmp4:
	.loc	1 348 3 prologue_end            @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:348:3
	str	r1, [r11, #-8]
	sub	r1, r11, #4
	.loc	1 352 9                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:352:9
	bl	fs_getfilep
	mov	r1, r0
	mov	r0, r1
	.loc	1 353 7                         @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:353:7
	cmp	r1, #0
	str	r0, [r11, #-12]                 @ 4-byte Spill
	bmi	.LBB2_2
	b	.LBB2_1
.LBB2_1:
	.loc	1 359 25                        @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:359:25
	ldr	r1, [sp, #16]                   @ 4-byte Reload
	ldr	r0, [r11, #-4]
	.loc	1 359 13 is_stmt 0              @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:359:13
	ldr	r2, [r11, #-8]
	bl	file_vfcntl
	str	r0, [sp, #12]                   @ 4-byte Spill
	.loc	1 360 19 is_stmt 1              @ 1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c:360:19
	