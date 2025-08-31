; ModuleID = 'unoptimized.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-unknown"

%struct.pthread_attr_s = type { i8, i8, i8, i8, i8*, i32 }
%struct.dq_entry_s = type { %struct.dq_entry_s*, %struct.dq_entry_s* }
%union.sigval = type { i32 }
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
%struct.sem_s = type { i16, i8, %struct.dq_entry_s }
%union.entry_u = type { i8* (i8*)* }
%struct.wdog_s = type { %struct.wdlist_node, i32, void (i32)*, i32 }
%struct.wdlist_node = type { %struct.wdlist_node*, %struct.wdlist_node* }
%struct.sigset_s = type { [2 x i32] }
%struct.sq_queue_s = type { %struct.sq_entry_s*, %struct.sq_entry_s* }
%struct.siginfo = type { i8, i8, i8, %union.sigval, i32, i32, i8* }
%struct.pthread_mutex_s = type { %struct.pthread_mutex_s*, i8, i8, %struct.rmutex_s }
%struct.xcptcontext = type { i32*, i32* }
%struct.pthread_tcb_s = type { %struct.tcb_s, void (i8* (i8*)*, i8*)*, i8* }

@g_default_pthread_attr = dso_local constant %struct.pthread_attr_s { i8 100, i8 0, i8 1, i8 0, i8* null, i32 4096 }, align 4
@.str = private unnamed_addr constant [88 x i8] c"/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c\00", align 1
@g_readytorun = external dso_local global %struct.dq_entry_s, align 4
@.str.1 = private unnamed_addr constant [6 x i8] c"panic\00", align 1

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @nx_pthread_create(void (i8* (i8*)*, i8*)* noundef %0, i32* noundef %1, %struct.pthread_attr_s* noundef %2, i8* (i8*)* noundef %3, i8* noundef %4) #0 !dbg !12 {
  %6 = alloca %struct.pthread_attr_s, align 4
  %7 = alloca %union.sigval, align 4
  %8 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %6, i32 0, i32 0, !dbg !16
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* noundef nonnull align 4 dereferenceable(12) %8, i8* noundef nonnull align 4 dereferenceable(12) getelementptr inbounds (%struct.pthread_attr_s, %struct.pthread_attr_s* @g_default_pthread_attr, i32 0, i32 0), i32 12, i1 false), !dbg !16
  %.not.not = icmp eq void (i8* (i8*)*, i8*)* %0, null, !dbg !17
  br i1 %.not.not, label %9, label %11, !dbg !17

9:                                                ; preds = %5
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i32 0, i32 0), i32 noundef 191, i8* noundef null) #5, !dbg !17
  unreachable, !dbg !17

10:                                               ; No predecessors!
  br label %12, !dbg !17

11:                                               ; preds = %5
  br label %12, !dbg !17

12:                                               ; preds = %11, %10
  %13 = load %struct.tcb_s*, %struct.tcb_s** bitcast (%struct.dq_entry_s* @g_readytorun to %struct.tcb_s**), align 4, !dbg !18
  %.not.not5 = icmp eq %struct.tcb_s* %13, null, !dbg !19
  br i1 %.not.not5, label %14, label %16, !dbg !19

14:                                               ; preds = %12
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i32 0, i32 0), i32 noundef 194, i8* noundef null) #5, !dbg !19
  unreachable, !dbg !19

15:                                               ; No predecessors!
  br label %17, !dbg !19

16:                                               ; preds = %12
  br label %17, !dbg !19

17:                                               ; preds = %16, %15
  %.not = icmp eq %struct.pthread_attr_s* %2, null, !dbg !20
  br i1 %.not, label %18, label %27, !dbg !21

18:                                               ; preds = %17
  %19 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %13, i32 0, i32 8, !dbg !22
  %20 = load i32, i32* %19, align 4, !dbg !22
  %21 = icmp slt i32 %20, 1, !dbg !22
  br i1 %21, label %26, label %22, !dbg !23

22:                                               ; preds = %18
  %23 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %13, i32 0, i32 9, !dbg !24
  %24 = load i8, i8* %23, align 4, !dbg !24
  %25 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %6, i32 0, i32 0, !dbg !25
  store i8 %24, i8* %25, align 4, !dbg !26
  br label %26, !dbg !27

26:                                               ; preds = %22, %18
  br label %27, !dbg !28

27:                                               ; preds = %26, %17
  %.03 = phi %struct.pthread_attr_s* [ %2, %17 ], [ %6, %26 ]
  %28 = call arm_aapcs_vfpcc noalias i8* @zalloc(i32 noundef 204) #6, !dbg !29
  %29 = bitcast i8* %28 to %struct.pthread_tcb_s*, !dbg !29
  %.not6 = icmp eq i8* %28, null, !dbg !30
  br i1 %.not6, label %30, label %33, !dbg !31

30:                                               ; preds = %27
  br label %31, !dbg !32

31:                                               ; preds = %30
  br label %32, !dbg !32

32:                                               ; preds = %31
  br label %123, !dbg !33

33:                                               ; preds = %27
  %34 = getelementptr inbounds i8, i8* %28, i32 64, !dbg !34
  %35 = bitcast i8* %34 to i32*, !dbg !34
  %36 = load i32, i32* %35, align 4, !dbg !35
  %37 = or i32 %36, 32768, !dbg !35
  store i32 %37, i32* %35, align 4, !dbg !35
  %38 = bitcast i8* %28 to %struct.tcb_s*, !dbg !36
  call arm_aapcs_vfpcc void @nxtask_joininit(%struct.tcb_s* noundef nonnull %38) #7, !dbg !37
  call arm_aapcs_vfpcc void @group_bind(%struct.pthread_tcb_s* noundef nonnull %29) #7, !dbg !38
  %39 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i32 0, i32 3, !dbg !39
  %40 = load i8, i8* %39, align 1, !dbg !39
  %41 = icmp eq i8 %40, 1, !dbg !40
  br i1 %41, label %42, label %47, !dbg !41

42:                                               ; preds = %33
  %43 = getelementptr inbounds i8, i8* %28, i32 64, !dbg !42
  %44 = bitcast i8* %43 to i32*, !dbg !42
  %45 = load i32, i32* %44, align 4, !dbg !43
  %46 = or i32 %45, 4096, !dbg !43
  store i32 %46, i32* %44, align 4, !dbg !43
  br label %47, !dbg !44

47:                                               ; preds = %42, %33
  %48 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i32 0, i32 4, !dbg !45
  %49 = load i8*, i8** %48, align 4, !dbg !45
  %.not7 = icmp eq i8* %49, null, !dbg !46
  br i1 %.not7, label %57, label %50, !dbg !46

50:                                               ; preds = %47
  %51 = bitcast i8* %28 to %struct.tcb_s*, !dbg !47
  %52 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i32 0, i32 4, !dbg !48
  %53 = load i8*, i8** %52, align 4, !dbg !48
  %54 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i32 0, i32 5, !dbg !49
  %55 = load i32, i32* %54, align 4, !dbg !49
  %56 = call arm_aapcs_vfpcc i32 @up_use_stack(%struct.tcb_s* noundef nonnull %51, i8* noundef %53, i32 noundef %55) #7, !dbg !50
  br label %62, !dbg !51

57:                                               ; preds = %47
  %58 = bitcast i8* %28 to %struct.tcb_s*, !dbg !52
  %59 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i32 0, i32 5, !dbg !53
  %60 = load i32, i32* %59, align 4, !dbg !53
  %61 = call arm_aapcs_vfpcc i32 @up_create_stack(%struct.tcb_s* noundef nonnull %58, i32 noundef %60, i8 noundef zeroext 1) #7, !dbg !54
  br label %62

62:                                               ; preds = %57, %50
  %.01 = phi i32 [ %56, %50 ], [ %61, %57 ], !dbg !55
  %.not8 = icmp eq i32 %.01, 0, !dbg !56
  br i1 %.not8, label %64, label %63, !dbg !57

63:                                               ; preds = %62
  br label %118, !dbg !58

64:                                               ; preds = %62
  %65 = bitcast i8* %28 to %struct.tcb_s*, !dbg !59
  %66 = call arm_aapcs_vfpcc i32 @tls_init_info(%struct.tcb_s* noundef nonnull %65) #7, !dbg !60
  %.not9 = icmp eq i32 %66, 0, !dbg !61
  br i1 %.not9, label %69, label %67, !dbg !62

67:                                               ; preds = %64
  %68 = sub nsw i32 0, %66, !dbg !63
  br label %118, !dbg !64

69:                                               ; preds = %64
  %70 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i32 0, i32 2, !dbg !65
  %71 = load i8, i8* %70, align 2, !dbg !65
  %72 = icmp eq i8 %71, 0, !dbg !66
  br i1 %72, label %73, label %84, !dbg !67

73:                                               ; preds = %69
  %74 = call arm_aapcs_vfpcc i32 @nxsched_get_param(i32 noundef 0, %union.sigval* noundef nonnull %7) #7, !dbg !68
  %75 = icmp slt i32 %74, 0, !dbg !69
  br i1 %75, label %76, label %78, !dbg !70

76:                                               ; preds = %73
  %77 = sub nsw i32 0, %74, !dbg !71
  br label %118, !dbg !72

78:                                               ; preds = %73
  %79 = call arm_aapcs_vfpcc i32 @nxsched_get_scheduler(i32 noundef 0) #7, !dbg !73
  %80 = icmp slt i32 %79, 0, !dbg !74
  br i1 %80, label %81, label %83, !dbg !75

81:                                               ; preds = %78
  %82 = sub nsw i32 0, %79, !dbg !76
  br label %118, !dbg !77

83:                                               ; preds = %78
  br label %92, !dbg !78

84:                                               ; preds = %69
  %85 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i32 0, i32 1, !dbg !79
  %86 = load i8, i8* %85, align 1, !dbg !79
  %87 = zext i8 %86 to i32, !dbg !80
  %88 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i32 0, i32 0, !dbg !81
  %89 = load i8, i8* %88, align 4, !dbg !81
  %90 = zext i8 %89 to i32, !dbg !82
  %91 = getelementptr inbounds %union.sigval, %union.sigval* %7, i32 0, i32 0, !dbg !83
  store i32 %90, i32* %91, align 4, !dbg !84
  br label %92

92:                                               ; preds = %84, %83
  %.04 = phi i32 [ %79, %83 ], [ %87, %84 ], !dbg !55
  %93 = getelementptr inbounds %union.sigval, %union.sigval* %7, i32 0, i32 0, !dbg !85
  %94 = load i32, i32* %93, align 4, !dbg !85
  %95 = call arm_aapcs_vfpcc i32 @pthread_setup_scheduler(%struct.pthread_tcb_s* noundef nonnull %29, i32 noundef %94, void ()* noundef nonnull @pthread_start, i8* (i8*)* noundef %3) #7, !dbg !86
  %.not10 = icmp eq i32 %95, 0, !dbg !87
  br i1 %.not10, label %97, label %96, !dbg !88

96:                                               ; preds = %92
  br label %118, !dbg !89

97:                                               ; preds = %92
  call arm_aapcs_vfpcc void @pthread_tcb_setup(%struct.pthread_tcb_s* noundef nonnull %29, %struct.tcb_s* noundef nonnull %13, void (i8* (i8*)*, i8*)* noundef nonnull %0, i8* noundef %4) #8, !dbg !90
  call arm_aapcs_vfpcc void @group_join(%struct.pthread_tcb_s* noundef nonnull %29) #7, !dbg !91
  %98 = getelementptr inbounds i8, i8* %28, i32 64, !dbg !92
  %99 = bitcast i8* %98 to i32*, !dbg !92
  %100 = load i32, i32* %99, align 4, !dbg !93
  %101 = and i32 %100, -25, !dbg !93
  store i32 %101, i32* %99, align 4, !dbg !93
  switch i32 %.04, label %102 [
    i32 1, label %103
    i32 0, label %104
    i32 2, label %104
  ], !dbg !94

102:                                              ; preds = %97
  br label %103, !dbg !95

103:                                              ; preds = %102, %97
  br label %111, !dbg !96

104:                                              ; preds = %97, %97
  %105 = getelementptr inbounds i8, i8* %28, i32 64, !dbg !97
  %106 = bitcast i8* %105 to i32*, !dbg !97
  %107 = load i32, i32* %106, align 4, !dbg !98
  %108 = or i32 %107, 8, !dbg !98
  store i32 %108, i32* %106, align 4, !dbg !98
  %109 = getelementptr inbounds i8, i8* %28, i32 72, !dbg !99
  %110 = bitcast i8* %109 to i32*, !dbg !99
  store i32 2000, i32* %110, align 4, !dbg !100
  br label %111, !dbg !101

111:                                              ; preds = %104, %103
  %.not11 = icmp eq i32* %1, null, !dbg !102
  br i1 %.not11, label %116, label %112, !dbg !103

112:                                              ; preds = %111
  %113 = getelementptr inbounds i8, i8* %28, i32 44, !dbg !104
  %114 = bitcast i8* %113 to i32*, !dbg !104
  %115 = load i32, i32* %114, align 4, !dbg !104
  store i32 %115, i32* %1, align 4, !dbg !105
  br label %116, !dbg !106

116:                                              ; preds = %112, %111
  %117 = bitcast i8* %28 to %struct.tcb_s*, !dbg !107
  call arm_aapcs_vfpcc void @nxtask_activate(%struct.tcb_s* noundef nonnull %117) #7, !dbg !108
  br label %123, !dbg !109

118:                                              ; preds = %96, %81, %76, %67, %63
  %.02 = phi i32 [ 12, %63 ], [ %68, %67 ], [ %77, %76 ], [ %82, %81 ], [ 16, %96 ], !dbg !55
  %119 = getelementptr inbounds i8, i8* %28, i32 8, !dbg !110
  %120 = bitcast i8* %119 to %struct.task_group_s**, !dbg !110
  store %struct.task_group_s* null, %struct.task_group_s** %120, align 4, !dbg !111
  %121 = bitcast i8* %28 to %struct.tcb_s*, !dbg !112
  %122 = call arm_aapcs_vfpcc i32 @nxsched_release_tcb(%struct.tcb_s* noundef nonnull %121, i8 noundef zeroext 1) #7, !dbg !113
  br label %123, !dbg !114

123:                                              ; preds = %118, %116, %32
  %.0 = phi i32 [ %.02, %118 ], [ 0, %116 ], [ 12, %32 ], !dbg !55
  ret i32 %.0, !dbg !115
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

; Function Attrs: noreturn
declare dso_local arm_aapcs_vfpcc void @__assert(i8* noundef, i32 noundef, i8* noundef) #2

; Function Attrs: allocsize(0)
declare dso_local arm_aapcs_vfpcc noalias i8* @zalloc(i32 noundef) #3

declare dso_local arm_aapcs_vfpcc void @nxtask_joininit(%struct.tcb_s* noundef) #4

declare dso_local arm_aapcs_vfpcc void @group_bind(%struct.pthread_tcb_s* noundef) #4

declare dso_local arm_aapcs_vfpcc i32 @up_use_stack(%struct.tcb_s* noundef, i8* noundef, i32 noundef) #4

declare dso_local arm_aapcs_vfpcc i32 @up_create_stack(%struct.tcb_s* noundef, i32 noundef, i8 noundef zeroext) #4

declare dso_local arm_aapcs_vfpcc i32 @tls_init_info(%struct.tcb_s* noundef) #4

declare dso_local arm_aapcs_vfpcc i32 @nxsched_get_param(i32 noundef, %union.sigval* noundef) #4

declare dso_local arm_aapcs_vfpcc i32 @nxsched_get_scheduler(i32 noundef) #4

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc void @pthread_start() #0 !dbg !116 {
  %1 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** bitcast (%struct.dq_entry_s* @g_readytorun to %struct.pthread_tcb_s**), align 4, !dbg !117
  %2 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %1, i32 0, i32 0, i32 9, !dbg !118
  %3 = load i8, i8* %2, align 4, !dbg !118
  %4 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %1, i32 0, i32 0, i32 10, !dbg !119
  %5 = load i8, i8* %4, align 1, !dbg !119
  %6 = icmp ugt i8 %3, %5, !dbg !120
  br i1 %6, label %7, label %18, !dbg !121

7:                                                ; preds = %0
  %8 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %1, i32 0, i32 0, !dbg !122
  %9 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %1, i32 0, i32 0, i32 10, !dbg !122
  %10 = load i8, i8* %9, align 1, !dbg !122
  %11 = zext i8 %10 to i32, !dbg !122
  %12 = call arm_aapcs_vfpcc i32 @nxsched_set_priority(%struct.tcb_s* noundef %8, i32 noundef %11) #7, !dbg !122
  %13 = icmp slt i32 %12, 0, !dbg !122
  br i1 %13, label %14, label %16, !dbg !122

14:                                               ; preds = %7
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i32 0, i32 0), i32 noundef 131, i8* noundef null) #5, !dbg !122
  unreachable, !dbg !122

15:                                               ; No predecessors!
  br label %17, !dbg !122

16:                                               ; preds = %7
  br label %17, !dbg !122

17:                                               ; preds = %16, %15
  br label %18, !dbg !123

18:                                               ; preds = %17, %0
  %19 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %1, i32 0, i32 1, !dbg !124
  %20 = load void (i8* (i8*)*, i8*)*, void (i8* (i8*)*, i8*)** %19, align 4, !dbg !124
  %.not = icmp eq void (i8* (i8*)*, i8*)* %20, null, !dbg !124
  br i1 %.not, label %25, label %21, !dbg !124

21:                                               ; preds = %18
  %22 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %1, i32 0, i32 0, i32 12, i32 0, !dbg !124
  %23 = load i8* (i8*)*, i8* (i8*)** %22, align 4, !dbg !124
  %24 = icmp eq i8* (i8*)* %23, null, !dbg !124
  br label %25

25:                                               ; preds = %21, %18
  %26 = phi i1 [ true, %18 ], [ %24, %21 ]
  br i1 %26, label %27, label %29, !dbg !124

27:                                               ; preds = %25
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i32 0, i32 0), i32 noundef 139, i8* noundef null) #5, !dbg !124
  unreachable, !dbg !124

28:                                               ; No predecessors!
  br label %30, !dbg !124

29:                                               ; preds = %25
  br label %30, !dbg !124

30:                                               ; preds = %29, %28
  %31 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %1, i32 0, i32 1, !dbg !125
  %32 = load void (i8* (i8*)*, i8*)*, void (i8* (i8*)*, i8*)** %31, align 4, !dbg !125
  %33 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %1, i32 0, i32 0, i32 12, i32 0, !dbg !126
  %34 = load i8* (i8*)*, i8* (i8*)** %33, align 4, !dbg !126
  %35 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %1, i32 0, i32 2, !dbg !127
  %36 = load i8*, i8** %35, align 4, !dbg !127
  call arm_aapcs_vfpcc void %32(i8* (i8*)* noundef %34, i8* noundef %36) #7, !dbg !128
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i32 0, i32 0), i32 noundef 149, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0)) #5, !dbg !129
  unreachable, !dbg !129
}

declare dso_local arm_aapcs_vfpcc i32 @pthread_setup_scheduler(%struct.pthread_tcb_s* noundef, i32 noundef, void ()* noundef, i8* (i8*)* noundef) #4

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc void @pthread_tcb_setup(%struct.pthread_tcb_s* noundef %0, %struct.tcb_s* noundef %1, void (i8* (i8*)*, i8*)* noundef %2, i8* noundef %3) #0 !dbg !130 {
  %5 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %0, i32 0, i32 0, i32 31, i32 0, !dbg !131
  %6 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %1, i32 0, i32 31, i32 0, !dbg !132
  %7 = call arm_aapcs_vfpcc i32 @strlcpy(i8* noundef nonnull %5, i8* noundef nonnull %6, i32 noundef 31) #7, !dbg !133
  %8 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %0, i32 0, i32 1, !dbg !134
  store void (i8* (i8*)*, i8*)* %2, void (i8* (i8*)*, i8*)** %8, align 4, !dbg !135
  %9 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %0, i32 0, i32 2, !dbg !136
  store i8* %3, i8** %9, align 4, !dbg !137
  ret void, !dbg !138
}

declare dso_local arm_aapcs_vfpcc void @group_join(%struct.pthread_tcb_s* noundef) #4

declare dso_local arm_aapcs_vfpcc void @nxtask_activate(%struct.tcb_s* noundef) #4

declare dso_local arm_aapcs_vfpcc i32 @nxsched_release_tcb(%struct.tcb_s* noundef, i8 noundef zeroext) #4

declare dso_local arm_aapcs_vfpcc i32 @strlcpy(i8* noundef, i8* noundef, i32 noundef) #4

declare dso_local arm_aapcs_vfpcc i32 @nxsched_set_priority(%struct.tcb_s* noundef, i32 noundef) #4

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { noreturn "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #4 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #5 = { nobuiltin noreturn nounwind "no-builtins" }
attributes #6 = { nobuiltin nounwind allocsize(0) "no-builtins" }
attributes #7 = { nobuiltin nounwind "no-builtins" }
attributes #8 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!2}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8, !9, !10, !11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c", directory: "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/Compile", checksumkind: CSK_MD5, checksum: "0bdbab8be08e4a2fd6eed438223da3ea")
!2 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!3 = !{i32 7, !"Dwarf Version", i32 5}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 1, !"min_enum_size", i32 4}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = distinct !DISubprogram(name: "nx_pthread_create", scope: !13, file: !13, line: 179, type: !14, scopeLine: 182, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "0bdbab8be08e4a2fd6eed438223da3ea")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 183, column: 33, scope: !12)
!17 = !DILocation(line: 191, column: 3, scope: !12)
!18 = !DILocation(line: 193, column: 12, scope: !12)
!19 = !DILocation(line: 194, column: 3, scope: !12)
!20 = !DILocation(line: 198, column: 8, scope: !12)
!21 = !DILocation(line: 198, column: 7, scope: !12)
!22 = !DILocation(line: 202, column: 12, scope: !12)
!23 = !DILocation(line: 202, column: 11, scope: !12)
!24 = !DILocation(line: 204, column: 43, scope: !12)
!25 = !DILocation(line: 204, column: 24, scope: !12)
!26 = !DILocation(line: 204, column: 33, scope: !12)
!27 = !DILocation(line: 205, column: 9, scope: !12)
!28 = !DILocation(line: 208, column: 5, scope: !12)
!29 = !DILocation(line: 212, column: 10, scope: !12)
!30 = !DILocation(line: 213, column: 8, scope: !12)
!31 = !DILocation(line: 213, column: 7, scope: !12)
!32 = !DILocation(line: 215, column: 7, scope: !12)
!33 = !DILocation(line: 216, column: 7, scope: !12)
!34 = !DILocation(line: 219, column: 13, scope: !12)
!35 = !DILocation(line: 219, column: 19, scope: !12)
!36 = !DILocation(line: 223, column: 26, scope: !12)
!37 = !DILocation(line: 223, column: 3, scope: !12)
!38 = !DILocation(line: 229, column: 3, scope: !12)
!39 = !DILocation(line: 242, column: 13, scope: !12)
!40 = !DILocation(line: 242, column: 25, scope: !12)
!41 = !DILocation(line: 242, column: 7, scope: !12)
!42 = !DILocation(line: 244, column: 17, scope: !12)
!43 = !DILocation(line: 244, column: 23, scope: !12)
!44 = !DILocation(line: 245, column: 5, scope: !12)
!45 = !DILocation(line: 247, column: 13, scope: !12)
!46 = !DILocation(line: 247, column: 7, scope: !12)
!47 = !DILocation(line: 251, column: 26, scope: !12)
!48 = !DILocation(line: 251, column: 58, scope: !12)
!49 = !DILocation(line: 252, column: 32, scope: !12)
!50 = !DILocation(line: 251, column: 13, scope: !12)
!51 = !DILocation(line: 253, column: 5, scope: !12)
!52 = !DILocation(line: 258, column: 29, scope: !12)
!53 = !DILocation(line: 258, column: 61, scope: !12)
!54 = !DILocation(line: 258, column: 13, scope: !12)
!55 = !DILocation(line: 0, scope: !12)
!56 = !DILocation(line: 262, column: 11, scope: !12)
!57 = !DILocation(line: 262, column: 7, scope: !12)
!58 = !DILocation(line: 265, column: 7, scope: !12)
!59 = !DILocation(line: 282, column: 30, scope: !12)
!60 = !DILocation(line: 282, column: 9, scope: !12)
!61 = !DILocation(line: 283, column: 11, scope: !12)
!62 = !DILocation(line: 283, column: 7, scope: !12)
!63 = !DILocation(line: 285, column: 17, scope: !12)
!64 = !DILocation(line: 286, column: 7, scope: !12)
!65 = !DILocation(line: 294, column: 13, scope: !12)
!66 = !DILocation(line: 294, column: 26, scope: !12)
!67 = !DILocation(line: 294, column: 7, scope: !12)
!68 = !DILocation(line: 300, column: 13, scope: !12)
!69 = !DILocation(line: 301, column: 15, scope: !12)
!70 = !DILocation(line: 301, column: 11, scope: !12)
!71 = !DILocation(line: 303, column: 21, scope: !12)
!72 = !DILocation(line: 304, column: 11, scope: !12)
!73 = !DILocation(line: 309, column: 16, scope: !12)
!74 = !DILocation(line: 310, column: 18, scope: !12)
!75 = !DILocation(line: 310, column: 11, scope: !12)
!76 = !DILocation(line: 312, column: 21, scope: !12)
!77 = !DILocation(line: 313, column: 11, scope: !12)
!78 = !DILocation(line: 315, column: 5, scope: !12)
!79 = !DILocation(line: 320, column: 50, scope: !12)
!80 = !DILocation(line: 320, column: 44, scope: !12)
!81 = !DILocation(line: 321, column: 50, scope: !12)
!82 = !DILocation(line: 321, column: 44, scope: !12)
!83 = !DILocation(line: 321, column: 13, scope: !12)
!84 = !DILocation(line: 321, column: 42, scope: !12)
!85 = !DILocation(line: 388, column: 45, scope: !12)
!86 = !DILocation(line: 388, column: 9, scope: !12)
!87 = !DILocation(line: 390, column: 11, scope: !12)
!88 = !DILocation(line: 390, column: 7, scope: !12)
!89 = !DILocation(line: 393, column: 7, scope: !12)
!90 = !DILocation(line: 414, column: 3, scope: !12)
!91 = !DILocation(line: 418, column: 3, scope: !12)
!92 = !DILocation(line: 422, column: 13, scope: !12)
!93 = !DILocation(line: 422, column: 19, scope: !12)
!94 = !DILocation(line: 423, column: 3, scope: !12)
!95 = !DILocation(line: 424, column: 5, scope: !12)
!96 = !DILocation(line: 428, column: 9, scope: !12)
!97 = !DILocation(line: 433, column: 19, scope: !12)
!98 = !DILocation(line: 433, column: 28, scope: !12)
!99 = !DILocation(line: 434, column: 19, scope: !12)
!100 = !DILocation(line: 434, column: 29, scope: !12)
!101 = !DILocation(line: 435, column: 9, scope: !12)
!102 = !DILocation(line: 447, column: 14, scope: !12)
!103 = !DILocation(line: 447, column: 7, scope: !12)
!104 = !DILocation(line: 449, column: 38, scope: !12)
!105 = !DILocation(line: 449, column: 15, scope: !12)
!106 = !DILocation(line: 450, column: 5, scope: !12)
!107 = !DILocation(line: 454, column: 19, scope: !12)
!108 = !DILocation(line: 454, column: 3, scope: !12)
!109 = !DILocation(line: 456, column: 3, scope: !12)
!110 = !DILocation(line: 462, column: 13, scope: !12)
!111 = !DILocation(line: 462, column: 19, scope: !12)
!112 = !DILocation(line: 464, column: 23, scope: !12)
!113 = !DILocation(line: 464, column: 3, scope: !12)
!114 = !DILocation(line: 465, column: 3, scope: !12)
!115 = !DILocation(line: 466, column: 1, scope: !12)
!116 = distinct !DISubprogram(name: "pthread_start", scope: !13, file: !13, line: 120, type: !14, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!117 = !DILocation(line: 122, column: 64, scope: !116)
!118 = !DILocation(line: 129, column: 17, scope: !116)
!119 = !DILocation(line: 129, column: 44, scope: !116)
!120 = !DILocation(line: 129, column: 32, scope: !116)
!121 = !DILocation(line: 129, column: 7, scope: !116)
!122 = !DILocation(line: 131, column: 7, scope: !116)
!123 = !DILocation(line: 132, column: 5, scope: !116)
!124 = !DILocation(line: 139, column: 3, scope: !116)
!125 = !DILocation(line: 142, column: 9, scope: !116)
!126 = !DILocation(line: 142, column: 36, scope: !116)
!127 = !DILocation(line: 142, column: 51, scope: !116)
!128 = !DILocation(line: 142, column: 3, scope: !116)
!129 = !DILocation(line: 149, column: 3, scope: !116)
!130 = distinct !DISubprogram(name: "pthread_tcb_setup", scope: !13, file: !13, line: 90, type: !14, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!131 = !DILocation(line: 98, column: 11, scope: !130)
!132 = !DILocation(line: 98, column: 27, scope: !130)
!133 = !DILocation(line: 98, column: 3, scope: !130)
!134 = !DILocation(line: 105, column: 9, scope: !130)
!135 = !DILocation(line: 105, column: 20, scope: !130)
!136 = !DILocation(line: 106, column: 9, scope: !130)
!137 = !DILocation(line: 106, column: 20, scope: !130)
!138 = !DILocation(line: 107, column: 1, scope: !130)
