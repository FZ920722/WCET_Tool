; ModuleID = '/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/sched/sched_lockcount.c'
source_filename = "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/sched/sched_lockcount.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-unknown"

%struct.dq_queue_s = type { %struct.dq_entry_s*, %struct.dq_entry_s* }
%struct.dq_entry_s = type { %struct.dq_entry_s*, %struct.dq_entry_s* }
%struct.tcb_s = type { %struct.tcb_s*, %struct.tcb_s*, %struct.task_group_s*, %struct.sq_entry_s, %struct.sq_queue_s, %struct.sq_entry_s, %struct.sem_s, i8*, i32, i8, i8, void ()*, %union.entry_u, i8, i32, i16, i16, i32, %struct.wdog_s, i32, i8*, i8*, i8*, %struct.sigset_s, %struct.sigset_s, %struct.sq_queue_s, %struct.sq_queue_s, %struct.siginfo*, %struct.pthread_mutex_s*, %struct.xcptcontext, void (%struct.tcb_s*)*, [32 x i8] }
%struct.task_group_s = type { i32, i32, i8, i32, i32, i32, i32, %struct.sq_queue_s, %struct.binary_s*, %struct.child_status_s*, i32, %struct.rmutex_s, %struct.sq_queue_s, %struct.task_info_s, %struct.task_info_s*, %struct.sq_queue_s, %struct.sq_queue_s, %struct.sigset_s, i8**, i32, i32, i8*, %struct.filelist, %struct.mm_map_s }
%struct.binary_s = type opaque
%struct.child_status_s = type { %struct.child_status_s*, i8, i32, i32 }
%struct.rmutex_s = type { %struct.mutex_s, i32 }
%struct.mutex_s = type { %struct.sem_s, i32 }
%struct.task_info_s = type { %struct.mutex_s, [32 x i32], [16 x void (i8*)*], %struct.getopt_s, i32, [32 x i8], %struct.atexit_list_s, %struct.streamlist }
%struct.getopt_s = type { i8*, i32, i32, i32, i8*, i8 }
%struct.atexit_list_s = type { i32, [1 x %struct.atexit_s] }
%struct.atexit_s = type { i32, void ()*, i8* }
%struct.streamlist = type { %struct.mutex_s, [3 x %struct.file_struct], %struct.sq_queue_s }
%struct.file_struct = type { %struct.sq_entry_s, %struct.rmutex_s, %struct.cookie_io_functions_t, i8*, i8*, i8*, i8*, i8*, [64 x i8], i16, i8, i8, [2 x i8] }
%struct.cookie_io_functions_t = type { i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64*, i32)*, i32 (i8*)* }
%struct.filelist = type { i8, i8, %struct.file** }
%struct.file = type { i32, i32, i64, %struct.inode*, i8*, i64, i8, i8 }
%struct.inode = type { %struct.inode*, %struct.inode*, %struct.inode*, i16, i16, %union.inode_ops_u, i16, i8*, [1 x i8] }
%union.inode_ops_u = type { %struct.file_operations* }
%struct.file_operations = type { i32 (%struct.file*)*, i32 (%struct.file*)*, i32 (%struct.file*, i8*, i32)*, i32 (%struct.file*, i8*, i32)*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.mm_map_entry_s*)*, i32 (%struct.file*, i64)*, i32 (%struct.file*, %struct.pollfd*, i1)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.inode*)* }
%struct.mm_map_entry_s = type { %struct.mm_map_entry_s*, i8*, i32, i64, i32, i32, %union.anon, i32 (%struct.mm_map_entry_s*, i8*, i32, i32)*, i32 (%struct.task_group_s*, %struct.mm_map_entry_s*, i8*, i32)* }
%union.anon = type { i8* }
%struct.pollfd = type opaque
%struct.uio = type { %struct.iovec*, i32 }
%struct.iovec = type { i8*, i32 }
%struct.mm_map_s = type { %struct.sq_queue_s, i32, %struct.rmutex_s }
%struct.sq_entry_s = type { %struct.sq_entry_s* }
%struct.sem_s = type { i16, i8, %struct.dq_queue_s }
%union.entry_u = type { i8* (i8*)* }
%struct.wdog_s = type { %struct.wdlist_node, i32, void (i32)*, i32 }
%struct.wdlist_node = type { %struct.wdlist_node*, %struct.wdlist_node* }
%struct.sigset_s = type { [2 x i32] }
%struct.sq_queue_s = type { %struct.sq_entry_s*, %struct.sq_entry_s* }
%struct.siginfo = type { i8, i8, i8, %union.sigval, i32, i32, i8* }
%union.sigval = type { i32 }
%struct.pthread_mutex_s = type { %struct.pthread_mutex_s*, i8, i8, %struct.rmutex_s }
%struct.xcptcontext = type { i32*, i32* }

@g_readytorun = external dso_local global %struct.dq_queue_s, align 4

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @sched_lockcount() #0 !dbg !12 {
  %1 = alloca %struct.tcb_s*, align 4
  %2 = load %struct.dq_entry_s*, %struct.dq_entry_s** getelementptr inbounds (%struct.dq_queue_s, %struct.dq_queue_s* @g_readytorun, i32 0, i32 0), align 4, !dbg !16
  %3 = bitcast %struct.dq_entry_s* %2 to %struct.tcb_s*, !dbg !16
  store %struct.tcb_s* %3, %struct.tcb_s** %1, align 4, !dbg !17
  %4 = load %struct.tcb_s*, %struct.tcb_s** %1, align 4, !dbg !18
  %5 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %4, i32 0, i32 15, !dbg !19
  %6 = load i16, i16* %5, align 4, !dbg !19
  %7 = sext i16 %6 to i32, !dbg !20
  ret i32 %7, !dbg !21
}

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/sched/sched_lockcount.c", directory: "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/sched_lockcount/Compile", checksumkind: CSK_MD5, checksum: "dd81849aba13f637e795cc8e7a6ec67d")
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
!12 = distinct !DISubprogram(name: "sched_lockcount", scope: !13, file: !13, line: 55, type: !14, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/sched/sched/sched_lockcount.c", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "dd81849aba13f637e795cc8e7a6ec67d")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 57, column: 28, scope: !12)
!17 = !DILocation(line: 57, column: 21, scope: !12)
!18 = !DILocation(line: 58, column: 15, scope: !12)
!19 = !DILocation(line: 58, column: 21, scope: !12)
!20 = !DILocation(line: 58, column: 10, scope: !12)
!21 = !DILocation(line: 58, column: 3, scope: !12)
