; ModuleID = '/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_close.c'
source_filename = "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_close.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-unknown"

%struct.file = type { i32, i32, i64, %struct.inode*, i8*, i64, i8, i8 }
%struct.inode = type { %struct.inode*, %struct.inode*, %struct.inode*, i16, i16, %union.inode_ops_u, i16, i8*, [1 x i8] }
%union.inode_ops_u = type { %struct.file_operations* }
%struct.file_operations = type { {}*, {}*, i32 (%struct.file*, i8*, i32)*, i32 (%struct.file*, i8*, i32)*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.mm_map_entry_s*)*, i32 (%struct.file*, i64)*, i32 (%struct.file*, %struct.pollfd*, i1)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.inode*)* }
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
%struct.filelist = type { i8, i8, %struct.file** }
%struct.mm_map_s = type { %struct.sq_queue_s, i32, %struct.rmutex_s }
%struct.pollfd = type { i32, i32, i32, i8*, void (%struct.pollfd*)*, i8* }
%struct.uio = type { %struct.iovec*, i32 }
%struct.iovec = type { i8*, i32 }

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @file_mq_close(%struct.file* noundef %0) #0 !dbg !12 {
  %2 = alloca %struct.file*, align 4
  store %struct.file* %0, %struct.file** %2, align 4
  %3 = load %struct.file*, %struct.file** %2, align 4, !dbg !16
  %4 = call arm_aapcs_vfpcc i32 @file_close(%struct.file* noundef %3) #2, !dbg !17
  ret i32 %4, !dbg !18
}

declare dso_local arm_aapcs_vfpcc i32 @file_close(%struct.file* noundef) #1

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @nxmq_close(i32 noundef %0) #0 !dbg !19 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4, !dbg !20
  %4 = call arm_aapcs_vfpcc i32 @nx_close(i32 noundef %3) #2, !dbg !21
  ret i32 %4, !dbg !22
}

declare dso_local arm_aapcs_vfpcc i32 @nx_close(i32 noundef) #1

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @mq_close(i32 noundef %0) #0 !dbg !23 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4, !dbg !24
  %4 = call arm_aapcs_vfpcc i32 @close(i32 noundef %3) #2, !dbg !25
  ret i32 %4, !dbg !26
}

declare dso_local arm_aapcs_vfpcc i32 @close(i32 noundef) #1

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_close.c", directory: "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/mq_close/Compile", checksumkind: CSK_MD5, checksum: "8ecf0b1e11efabbd4d79d34f9a3cdaab")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 1, !"min_enum_size", i32 4}
!6 = !{i32 1, !"branch-target-enforcement", i32 0}
!7 = !{i32 1, !"sign-return-address", i32 0}
!8 = !{i32 1, !"sign-return-address-all", i32 0}
!9 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!12 = distinct !DISubprogram(name: "file_mq_close", scope: !13, file: !13, line: 68, type: !14, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_close.c", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "8ecf0b1e11efabbd4d79d34f9a3cdaab")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 70, column: 21, scope: !12)
!17 = !DILocation(line: 70, column: 10, scope: !12)
!18 = !DILocation(line: 70, column: 3, scope: !12)
!19 = distinct !DISubprogram(name: "nxmq_close", scope: !13, file: !13, line: 96, type: !14, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!20 = !DILocation(line: 98, column: 19, scope: !19)
!21 = !DILocation(line: 98, column: 10, scope: !19)
!22 = !DILocation(line: 98, column: 3, scope: !19)
!23 = distinct !DISubprogram(name: "mq_close", scope: !13, file: !13, line: 129, type: !14, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!24 = !DILocation(line: 131, column: 16, scope: !23)
!25 = !DILocation(line: 131, column: 10, scope: !23)
!26 = !DILocation(line: 131, column: 3, scope: !23)
