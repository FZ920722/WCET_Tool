; ModuleID = '/home/fyj/DiskD/WCET_Tool/WorkSpace/f1/fs_fstatfs.c'
source_filename = "/home/fyj/DiskD/WCET_Tool/WorkSpace/f1/fs_fstatfs.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv4t-unknown-unknown"

%struct.statfs = type { i32, i32, i32, i64, i64, i64, i64, i64, %struct.fsid_s }
%struct.fsid_s = type { [2 x i32] }
%struct.file = type { i32, i32, i64, %struct.inode*, i8*, i64, i8, i8 }
%struct.inode = type { %struct.inode*, %struct.inode*, %struct.inode*, i16, i16, %union.inode_ops_u, i16, i8*, [1 x i8] }
%union.inode_ops_u = type { %struct.file_operations* }
%struct.file_operations = type { i32 (%struct.file*)*, i32 (%struct.file*)*, i32 (%struct.file*, i8*, i32)*, i32 (%struct.file*, i8*, i32)*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.mm_map_entry_s*)*, i32 (%struct.file*, i64)*, i32 (%struct.file*, %struct.pollfd*, i1)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.inode*)* }
%struct.mm_map_entry_s = type { %struct.mm_map_entry_s*, i8*, i32, i64, i32, i32, %union.anon, i32 (%struct.mm_map_entry_s*, i8*, i32, i32)*, i32 (%struct.task_group_s*, %struct.mm_map_entry_s*, i8*, i32)* }
%union.anon = type { i8* }
%struct.task_group_s = type { i32, i32, i8, i32, i32, i32, i32, %struct.sq_queue_s, %struct.binary_s*, %struct.child_status_s*, i32, %struct.rmutex_s, %struct.sq_queue_s, %struct.task_info_s, %struct.task_info_s*, %struct.sq_queue_s, %struct.sq_queue_s, %struct.sigset_s, i8**, i32, i32, i8*, %struct.filelist, %struct.mm_map_s }
%struct.binary_s = type opaque
%struct.child_status_s = type { %struct.child_status_s*, i8, i32, i32 }
%struct.rmutex_s = type { %struct.mutex_s, i32 }
%struct.mutex_s = type { %struct.sem_s, i32 }
%struct.sem_s = type { i16, i8, %struct.dq_queue_s }
%struct.dq_queue_s = type { %struct.dq_entry_s*, %struct.dq_entry_s* }
%struct.dq_entry_s = type { %struct.dq_entry_s*, %struct.dq_entry_s* }
%struct.task_info_s = type { %struct.mutex_s, [32 x i32], [16 x void (i8*)*], %struct.getopt_s, i32, [32 x i8], %struct.atexit_list_s, %struct.streamlist }
%struct.getopt_s = type { i8*, i32, i32, i32, i8*, i8 }
%struct.atexit_list_s = type { i32, [1 x %struct.atexit_s] }
%struct.atexit_s = type { i32, void ()*, i8* }
%struct.streamlist = type { %struct.mutex_s, [3 x %struct.file_struct], %struct.sq_queue_s }
%struct.file_struct = type { %struct.sq_entry_s, %struct.rmutex_s, %struct.cookie_io_functions_t, i8*, i8*, i8*, i8*, i8*, [64 x i8], i16, i8, i8, [2 x i8] }
%struct.sq_entry_s = type { %struct.sq_entry_s* }
%struct.cookie_io_functions_t = type { i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64*, i32)*, i32 (i8*)* }
%struct.sq_queue_s = type { %struct.sq_entry_s*, %struct.sq_entry_s* }
%struct.sigset_s = type { [2 x i32] }
%struct.filelist = type { i8, i8, %struct.file**, %struct.file*, [8 x %struct.file] }
%struct.mm_map_s = type { %struct.sq_queue_s, i32, %struct.rmutex_s }
%struct.pollfd = type opaque
%struct.uio = type { %struct.iovec*, i32, i32, i32 }
%struct.iovec = type { i8*, i32 }
%struct.mountpt_operations = type { i32 (%struct.file*, i8*, i32, i32)*, i32 (%struct.file*)*, i32 (%struct.file*, i8*, i32)*, i32 (%struct.file*, i8*, i32)*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.mm_map_entry_s*)*, i32 (%struct.file*, i64)*, i32 (%struct.file*, %struct.pollfd*, i1)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*)*, i32 (%struct.file*, %struct.file*)*, i32 (%struct.file*, %struct.stat*)*, i32 (%struct.file*, %struct.stat*, i32)*, i32 (%struct.inode*, i8*, %struct.fs_dirent_s**)*, i32 (%struct.inode*, %struct.fs_dirent_s*)*, i32 (%struct.inode*, %struct.fs_dirent_s*, %struct.dirent*)*, i32 (%struct.inode*, %struct.fs_dirent_s*)*, i32 (%struct.inode*, i8*, i8**)*, i32 (i8*, %struct.inode**, i32)*, i32 (%struct.inode*, %struct.statfs*)*, i32 (%struct.inode*, i8*)*, i32 (%struct.inode*, i8*, i32)*, i32 (%struct.inode*, i8*)*, i32 (%struct.inode*, i8*, i8*)*, i32 (%struct.inode*, i8*, %struct.stat*)*, i32 (%struct.inode*, i8*, %struct.stat*, i32)*, i32 (%struct.inode*)* }
%struct.stat = type opaque
%struct.fs_dirent_s = type { %struct.inode*, i8* }
%struct.dirent = type { i8, [33 x i8] }

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @fstatfs(i32 noundef %fd, %struct.statfs* noundef %buf) #0 !dbg !12 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca %struct.statfs*, align 4
  %filep = alloca %struct.file*, align 4
  %inode = alloca %struct.inode*, align 4
  %ret = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.statfs* %buf, %struct.statfs** %buf.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4, !dbg !16
  %call = call arm_aapcs_vfpcc i32 @fs_getfilep(i32 noundef %0, %struct.file** noundef %filep) #2, !dbg !17
  store i32 %call, i32* %ret, align 4, !dbg !18
  %1 = load i32, i32* %ret, align 4, !dbg !19
  %cmp = icmp slt i32 %1, 0, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !19

if.then:                                          ; preds = %entry
  br label %errout, !dbg !21

if.end:                                           ; preds = %entry
  %2 = load %struct.file*, %struct.file** %filep, align 4, !dbg !22
  %f_inode = getelementptr inbounds %struct.file, %struct.file* %2, i32 0, i32 3, !dbg !23
  %3 = load %struct.inode*, %struct.inode** %f_inode, align 8, !dbg !23
  store %struct.inode* %3, %struct.inode** %inode, align 4, !dbg !24
  %4 = load %struct.inode*, %struct.inode** %inode, align 4, !dbg !25
  %i_flags = getelementptr inbounds %struct.inode, %struct.inode* %4, i32 0, i32 4, !dbg !25
  %5 = load i16, i16* %i_flags, align 2, !dbg !25
  %conv = zext i16 %5 to i32, !dbg !25
  %and = and i32 %conv, 15, !dbg !25
  %cmp1 = icmp eq i32 %and, 3, !dbg !25
  br i1 %cmp1, label %if.then3, label %if.else, !dbg !25

if.then3:                                         ; preds = %if.end
  store i32 -38, i32* %ret, align 4, !dbg !26
  %6 = load %struct.inode*, %struct.inode** %inode, align 4, !dbg !27
  %u = getelementptr inbounds %struct.inode, %struct.inode* %6, i32 0, i32 5, !dbg !28
  %i_mops = bitcast %union.inode_ops_u* %u to %struct.mountpt_operations**, !dbg !29
  %7 = load %struct.mountpt_operations*, %struct.mountpt_operations** %i_mops, align 4, !dbg !29
  %tobool = icmp ne %struct.mountpt_operations* %7, null, !dbg !27
  br i1 %tobool, label %land.lhs.true, label %if.end13, !dbg !30

land.lhs.true:                                    ; preds = %if.then3
  %8 = load %struct.inode*, %struct.inode** %inode, align 4, !dbg !31
  %u4 = getelementptr inbounds %struct.inode, %struct.inode* %8, i32 0, i32 5, !dbg !32
  %i_mops5 = bitcast %union.inode_ops_u* %u4 to %struct.mountpt_operations**, !dbg !33
  %9 = load %struct.mountpt_operations*, %struct.mountpt_operations** %i_mops5, align 4, !dbg !33
  %statfs = getelementptr inbounds %struct.mountpt_operations, %struct.mountpt_operations* %9, i32 0, i32 21, !dbg !34
  %10 = load i32 (%struct.inode*, %struct.statfs*)*, i32 (%struct.inode*, %struct.statfs*)** %statfs, align 4, !dbg !34
  %tobool6 = icmp ne i32 (%struct.inode*, %struct.statfs*)* %10, null, !dbg !31
  br i1 %tobool6, label %if.then7, label %if.end13, !dbg !27

if.then7:                                         ; preds = %land.lhs.true
  %11 = load %struct.statfs*, %struct.statfs** %buf.addr, align 4, !dbg !35
  %12 = bitcast %struct.statfs* %11 to i8*, !dbg !35
  %call8 = call arm_aapcs_vfpcc i8* @memset(i8* noundef %12, i32 noundef 0, i32 noundef 64) #2, !dbg !36
  %13 = load %struct.inode*, %struct.inode** %inode, align 4, !dbg !37
  %u9 = getelementptr inbounds %struct.inode, %struct.inode* %13, i32 0, i32 5, !dbg !38
  %i_mops10 = bitcast %union.inode_ops_u* %u9 to %struct.mountpt_operations**, !dbg !39
  %14 = load %struct.mountpt_operations*, %struct.mountpt_operations** %i_mops10, align 4, !dbg !39
  %statfs11 = getelementptr inbounds %struct.mountpt_operations, %struct.mountpt_operations* %14, i32 0, i32 21, !dbg !40
  %15 = load i32 (%struct.inode*, %struct.statfs*)*, i32 (%struct.inode*, %struct.statfs*)** %statfs11, align 4, !dbg !40
  %16 = load %struct.inode*, %struct.inode** %inode, align 4, !dbg !41
  %17 = load %struct.statfs*, %struct.statfs** %buf.addr, align 4, !dbg !42
  %call12 = call arm_aapcs_vfpcc i32 %15(%struct.inode* noundef %16, %struct.statfs* noundef %17) #2, !dbg !37
  store i32 %call12, i32* %ret, align 4, !dbg !43
  br label %if.end13, !dbg !44

if.end13:                                         ; preds = %if.then7, %land.lhs.true, %if.then3
  br label %if.end15, !dbg !45

if.else:                                          ; preds = %if.end
  %18 = load %struct.statfs*, %struct.statfs** %buf.addr, align 4, !dbg !46
  %19 = bitcast %struct.statfs* %18 to i8*, !dbg !46
  %call14 = call arm_aapcs_vfpcc i8* @memset(i8* noundef %19, i32 noundef 0, i32 noundef 64) #2, !dbg !47
  %20 = load %struct.statfs*, %struct.statfs** %buf.addr, align 4, !dbg !48
  %f_type = getelementptr inbounds %struct.statfs, %struct.statfs* %20, i32 0, i32 0, !dbg !49
  store i32 40864, i32* %f_type, align 8, !dbg !50
  %21 = load %struct.statfs*, %struct.statfs** %buf.addr, align 4, !dbg !51
  %f_namelen = getelementptr inbounds %struct.statfs, %struct.statfs* %21, i32 0, i32 1, !dbg !52
  store i32 32, i32* %f_namelen, align 4, !dbg !53
  store i32 0, i32* %ret, align 4, !dbg !54
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.end13
  %22 = load %struct.file*, %struct.file** %filep, align 4, !dbg !55
  %call16 = call arm_aapcs_vfpcc i32 @fs_putfilep(%struct.file* noundef %22) #2, !dbg !56
  %23 = load i32, i32* %ret, align 4, !dbg !57
  %cmp17 = icmp sge i32 %23, 0, !dbg !58
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !57

if.then19:                                        ; preds = %if.end15
  store i32 0, i32* %retval, align 4, !dbg !59
  br label %return, !dbg !59

if.end20:                                         ; preds = %if.end15
  br label %errout, !dbg !60

errout:                                           ; preds = %if.end20, %if.then
  br label %do.body, !dbg !61

do.body:                                          ; preds = %errout
  %24 = load i32, i32* %ret, align 4, !dbg !61
  %sub = sub nsw i32 0, %24, !dbg !61
  %call21 = call arm_aapcs_vfpcc i32* @__errno() #2, !dbg !61
  store i32 %sub, i32* %call21, align 4, !dbg !61
  br label %do.end, !dbg !61

do.end:                                           ; preds = %do.body
  store i32 -1, i32* %retval, align 4, !dbg !62
  br label %return, !dbg !62

return:                                           ; preds = %do.end, %if.then19
  %25 = load i32, i32* %retval, align 4, !dbg !63
  ret i32 %25, !dbg !63
}

declare dso_local arm_aapcs_vfpcc i32 @fs_getfilep(i32 noundef, %struct.file** noundef) #1

declare dso_local arm_aapcs_vfpcc i8* @memset(i8* noundef, i32 noundef, i32 noundef) #1

declare dso_local arm_aapcs_vfpcc i32 @fs_putfilep(%struct.file* noundef) #1

declare dso_local arm_aapcs_vfpcc i32* @__errno() #1

attributes #0 = { noinline nounwind "disable-tail-calls"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm7tdmi" "target-features"="+armv4t,+strict-align,-aes,-bf16,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve.fp,-neon,-sha2,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { "disable-tail-calls"="true" "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm7tdmi" "target-features"="+armv4t,+strict-align,-aes,-bf16,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve.fp,-neon,-sha2,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://gitee.com/zzmmma/tam.git da2a436da583758d7c610dada3fa3f35c8d35100)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/DiskD/WCET_Tool/WorkSpace/f1/fs_fstatfs.c", directory: "/home/fyj/DiskD/tam/testcases/tam_oh0zpx3u", checksumkind: CSK_MD5, checksum: "13ca8e6576d4e95a22683ec0174bf1c3")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 1, !"min_enum_size", i32 4}
!6 = !{i32 1, !"branch-target-enforcement", i32 0}
!7 = !{i32 1, !"sign-return-address", i32 0}
!8 = !{i32 1, !"sign-return-address-all", i32 0}
!9 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 14.0.6 (https://gitee.com/zzmmma/tam.git da2a436da583758d7c610dada3fa3f35c8d35100)"}
!12 = distinct !DISubprogram(name: "fstatfs", scope: !13, file: !13, line: 59, type: !14, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "WCET_Tool/WorkSpace/f1/fs_fstatfs.c", directory: "/home/fyj/DiskD", checksumkind: CSK_MD5, checksum: "13ca8e6576d4e95a22683ec0174bf1c3")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 73, column: 21, scope: !12)
!17 = !DILocation(line: 73, column: 9, scope: !12)
!18 = !DILocation(line: 73, column: 7, scope: !12)
!19 = !DILocation(line: 74, column: 7, scope: !12)
!20 = !DILocation(line: 74, column: 11, scope: !12)
!21 = !DILocation(line: 76, column: 7, scope: !12)
!22 = !DILocation(line: 82, column: 11, scope: !12)
!23 = !DILocation(line: 82, column: 18, scope: !12)
!24 = !DILocation(line: 82, column: 9, scope: !12)
!25 = !DILocation(line: 88, column: 7, scope: !12)
!26 = !DILocation(line: 94, column: 11, scope: !12)
!27 = !DILocation(line: 95, column: 11, scope: !12)
!28 = !DILocation(line: 95, column: 18, scope: !12)
!29 = !DILocation(line: 95, column: 20, scope: !12)
!30 = !DILocation(line: 95, column: 27, scope: !12)
!31 = !DILocation(line: 95, column: 30, scope: !12)
!32 = !DILocation(line: 95, column: 37, scope: !12)
!33 = !DILocation(line: 95, column: 39, scope: !12)
!34 = !DILocation(line: 95, column: 47, scope: !12)
!35 = !DILocation(line: 99, column: 18, scope: !12)
!36 = !DILocation(line: 99, column: 11, scope: !12)
!37 = !DILocation(line: 100, column: 17, scope: !12)
!38 = !DILocation(line: 100, column: 24, scope: !12)
!39 = !DILocation(line: 100, column: 26, scope: !12)
!40 = !DILocation(line: 100, column: 34, scope: !12)
!41 = !DILocation(line: 100, column: 41, scope: !12)
!42 = !DILocation(line: 100, column: 48, scope: !12)
!43 = !DILocation(line: 100, column: 15, scope: !12)
!44 = !DILocation(line: 101, column: 9, scope: !12)
!45 = !DILocation(line: 102, column: 5, scope: !12)
!46 = !DILocation(line: 108, column: 14, scope: !12)
!47 = !DILocation(line: 108, column: 7, scope: !12)
!48 = !DILocation(line: 109, column: 7, scope: !12)
!49 = !DILocation(line: 109, column: 12, scope: !12)
!50 = !DILocation(line: 109, column: 22, scope: !12)
!51 = !DILocation(line: 110, column: 7, scope: !12)
!52 = !DILocation(line: 110, column: 12, scope: !12)
!53 = !DILocation(line: 110, column: 22, scope: !12)
!54 = !DILocation(line: 111, column: 22, scope: !12)
!55 = !DILocation(line: 116, column: 15, scope: !12)
!56 = !DILocation(line: 116, column: 3, scope: !12)
!57 = !DILocation(line: 117, column: 7, scope: !12)
!58 = !DILocation(line: 117, column: 11, scope: !12)
!59 = !DILocation(line: 121, column: 7, scope: !12)
!60 = !DILocation(line: 117, column: 14, scope: !12)
!61 = !DILocation(line: 125, column: 3, scope: !12)
!62 = !DILocation(line: 126, column: 3, scope: !12)
!63 = !DILocation(line: 127, column: 1, scope: !12)
