; ModuleID = 'unoptimized.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64"

%struct.pthread_attr_s = type { i8, i8, i8, i8, i8*, i64 }
%struct.sched_param = type { i32 }
%struct.tcb_s = type { %struct.tcb_s*, %struct.tcb_s*, %struct.task_group_s*, %struct.sq_entry_s, %struct.sq_queue_s, %struct.sq_entry_s, %struct.sem_s, i8*, i32, i8, i8, void ()*, %union.entry_u, i8, i32, i16, i16, i32, %struct.wdog_s, i64, i8*, i8*, i8*, %struct.sigset_s, %struct.sigset_s, %struct.sq_queue_s, %struct.sq_queue_s, %struct.siginfo*, %struct.pthread_mutex_s*, %struct.xcptcontext, void (%struct.tcb_s*)*, [32 x i8] }
%struct.task_group_s = type { i32, i32, i8, i32, i32, i32, i32, %struct.sq_queue_s, i16, i32, %struct.rmutex_s, %struct.sq_queue_s, %struct.task_info_s, %struct.task_info_s*, %struct.sq_queue_s, %struct.sq_queue_s, %struct.sigset_s, i8**, i64, i64, i8*, %struct.filelist, %struct.mm_map_s }
%struct.rmutex_s = type { %struct.mutex_s, i32 }
%struct.mutex_s = type { %struct.sem_s, i32 }
%struct.task_info_s = type { %struct.mutex_s, [32 x i64], [16 x void (i8*)*], %struct.getopt_s, i32, [96 x i8], %struct.atexit_list_s, %struct.streamlist }
%struct.getopt_s = type { i8*, i32, i32, i32, i8*, i8 }
%struct.atexit_list_s = type { i32, [1 x %struct.atexit_s] }
%struct.atexit_s = type { i32, void ()*, i8* }
%struct.streamlist = type { %struct.mutex_s, [3 x %struct.file_struct], %struct.sq_queue_s }
%struct.file_struct = type { %struct.sq_entry_s, %struct.rmutex_s, %struct.cookie_io_functions_t, i8*, i8*, i8*, i8*, i8*, [64 x i8], i16, i8, i8, [2 x i8] }
%struct.cookie_io_functions_t = type { i64 (i8*, i8*, i64)*, i64 (i8*, i8*, i64)*, i64 (i8*, i64*, i32)*, i32 (i8*)* }
%struct.filelist = type { i8, i8, %struct.file** }
%struct.file = type { i32, i32, i64, %struct.inode*, i8*, i64, i8 }
%struct.inode = type { %struct.inode*, %struct.inode*, %struct.inode*, i16, i16, %union.inode_ops_u, i16, i8*, [1 x i8] }
%union.inode_ops_u = type { %struct.file_operations* }
%struct.file_operations = type { i32 (%struct.file*)*, i32 (%struct.file*)*, i64 (%struct.file*, i8*, i64)*, i64 (%struct.file*, i8*, i64)*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i32, i64)*, i32 (%struct.file*, %struct.mm_map_entry_s*)*, i32 (%struct.file*, i64)*, i32 (%struct.file*, %struct.pollfd*, i1)*, i64 (%struct.file*, %struct.uio*)*, i64 (%struct.file*, %struct.uio*)*, i32 (%struct.inode*)* }
%struct.mm_map_entry_s = type { %struct.mm_map_entry_s*, i8*, i64, i64, i32, i32, %union.anon, i32 (%struct.mm_map_entry_s*, i8*, i64, i32)*, i32 (%struct.task_group_s*, %struct.mm_map_entry_s*, i8*, i64)* }
%union.anon = type { i8* }
%struct.pollfd = type opaque
%struct.uio = type { %struct.iovec*, i32 }
%struct.iovec = type { i8*, i64 }
%struct.mm_map_s = type { %struct.sq_queue_s, i64, %struct.rmutex_s }
%struct.sq_entry_s = type { %struct.sq_entry_s* }
%struct.sem_s = type { i16, i8, %struct.dq_entry_s }
%struct.dq_entry_s = type { %struct.dq_entry_s*, %struct.dq_entry_s* }
%union.entry_u = type { i8* (i8*)* }
%struct.wdog_s = type { %struct.wdlist_node, i64, void (i64)*, i64 }
%struct.wdlist_node = type { %struct.wdlist_node*, %struct.wdlist_node* }
%struct.sigset_s = type { [2 x i32] }
%struct.sq_queue_s = type { %struct.sq_entry_s*, %struct.sq_entry_s* }
%struct.siginfo = type { i8, i8, i8, %union.anon, i32, i32, i8* }
%struct.pthread_mutex_s = type { %struct.pthread_mutex_s*, i8, i8, %struct.rmutex_s }
%struct.xcptcontext = type { i64*, i64*, i64*, i64* }
%struct.pthread_tcb_s = type { %struct.tcb_s, void (i8* (i8*)*, i8*)*, i8* }

@g_default_pthread_attr = dso_local constant %struct.pthread_attr_s { i8 100, i8 0, i8 1, i8 0, i8* null, i64 8192 }, align 8
@.str = private unnamed_addr constant [88 x i8] c"/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"panic\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @nx_pthread_create(void (i8* (i8*)*, i8*)* noundef %0, i32* noundef %1, %struct.pthread_attr_s* noundef %2, i8* (i8*)* noundef %3, i8* noundef %4) #0 !dbg !12 {
  %6 = alloca %struct.pthread_attr_s, align 8
  %7 = alloca %struct.sched_param, align 4
  %8 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %6, i64 0, i32 0, !dbg !16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(24) %8, i8* noundef nonnull align 8 dereferenceable(24) getelementptr inbounds (%struct.pthread_attr_s, %struct.pthread_attr_s* @g_default_pthread_attr, i64 0, i32 0), i64 24, i1 false), !dbg !16
  %.not.not = icmp eq void (i8* (i8*)*, i8*)* %0, null, !dbg !17
  br i1 %.not.not, label %9, label %11, !dbg !17

9:                                                ; preds = %5
  call void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i64 0, i64 0), i32 noundef 191, i8* noundef null) #5, !dbg !17
  unreachable, !dbg !17

10:                                               ; No predecessors!
  br label %12, !dbg !17

11:                                               ; preds = %5
  br label %12, !dbg !17

12:                                               ; preds = %11, %10
  %13 = call i64 asm sideeffect "mrs $0, tpidr_el1", "=r,~{memory}"() #6, !dbg !18, !srcloc !19
  %14 = and i64 %13, -2, !dbg !18
  %15 = inttoptr i64 %14 to %struct.tcb_s*, !dbg !18
  %.not.not5 = icmp eq i64 %14, 0, !dbg !20
  br i1 %.not.not5, label %16, label %18, !dbg !20

16:                                               ; preds = %12
  call void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i64 0, i64 0), i32 noundef 194, i8* noundef null) #5, !dbg !20
  unreachable, !dbg !20

17:                                               ; No predecessors!
  br label %19, !dbg !20

18:                                               ; preds = %12
  br label %19, !dbg !20

19:                                               ; preds = %18, %17
  %.not = icmp eq %struct.pthread_attr_s* %2, null, !dbg !21
  br i1 %.not, label %20, label %29, !dbg !22

20:                                               ; preds = %19
  %21 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %15, i64 0, i32 8, !dbg !23
  %22 = load i32, i32* %21, align 8, !dbg !23
  %23 = icmp slt i32 %22, 1, !dbg !23
  br i1 %23, label %28, label %24, !dbg !24

24:                                               ; preds = %20
  %25 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %15, i64 0, i32 9, !dbg !25
  %26 = load i8, i8* %25, align 4, !dbg !25
  %27 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %6, i64 0, i32 0, !dbg !26
  store i8 %26, i8* %27, align 8, !dbg !27
  br label %28, !dbg !28

28:                                               ; preds = %24, %20
  br label %29, !dbg !29

29:                                               ; preds = %28, %19
  %.03 = phi %struct.pthread_attr_s* [ %2, %19 ], [ %6, %28 ]
  %30 = call noalias i8* @zalloc(i64 noundef 352) #7, !dbg !30
  %31 = bitcast i8* %30 to %struct.pthread_tcb_s*, !dbg !30
  %.not6 = icmp eq i8* %30, null, !dbg !31
  br i1 %.not6, label %32, label %35, !dbg !32

32:                                               ; preds = %29
  br label %33, !dbg !33

33:                                               ; preds = %32
  br label %34, !dbg !33

34:                                               ; preds = %33
  br label %125, !dbg !34

35:                                               ; preds = %29
  %36 = getelementptr inbounds i8, i8* %30, i64 116, !dbg !35
  %37 = bitcast i8* %36 to i32*, !dbg !35
  %38 = load i32, i32* %37, align 4, !dbg !36
  %39 = or i32 %38, 32768, !dbg !36
  store i32 %39, i32* %37, align 4, !dbg !36
  %40 = bitcast i8* %30 to %struct.tcb_s*, !dbg !37
  call void @nxtask_joininit(%struct.tcb_s* noundef nonnull %40) #8, !dbg !38
  call void @group_bind(%struct.pthread_tcb_s* noundef nonnull %31) #8, !dbg !39
  %41 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i64 0, i32 3, !dbg !40
  %42 = load i8, i8* %41, align 1, !dbg !40
  %43 = icmp eq i8 %42, 1, !dbg !41
  br i1 %43, label %44, label %49, !dbg !42

44:                                               ; preds = %35
  %45 = getelementptr inbounds i8, i8* %30, i64 116, !dbg !43
  %46 = bitcast i8* %45 to i32*, !dbg !43
  %47 = load i32, i32* %46, align 4, !dbg !44
  %48 = or i32 %47, 4096, !dbg !44
  store i32 %48, i32* %46, align 4, !dbg !44
  br label %49, !dbg !45

49:                                               ; preds = %44, %35
  %50 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i64 0, i32 4, !dbg !46
  %51 = load i8*, i8** %50, align 8, !dbg !46
  %.not7 = icmp eq i8* %51, null, !dbg !47
  br i1 %.not7, label %59, label %52, !dbg !47

52:                                               ; preds = %49
  %53 = bitcast i8* %30 to %struct.tcb_s*, !dbg !48
  %54 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i64 0, i32 4, !dbg !49
  %55 = load i8*, i8** %54, align 8, !dbg !49
  %56 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i64 0, i32 5, !dbg !50
  %57 = load i64, i64* %56, align 8, !dbg !50
  %58 = call i32 @up_use_stack(%struct.tcb_s* noundef nonnull %53, i8* noundef %55, i64 noundef %57) #8, !dbg !51
  br label %64, !dbg !52

59:                                               ; preds = %49
  %60 = bitcast i8* %30 to %struct.tcb_s*, !dbg !53
  %61 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i64 0, i32 5, !dbg !54
  %62 = load i64, i64* %61, align 8, !dbg !54
  %63 = call i32 @up_create_stack(%struct.tcb_s* noundef nonnull %60, i64 noundef %62, i8 noundef 1) #8, !dbg !55
  br label %64

64:                                               ; preds = %59, %52
  %.01 = phi i32 [ %58, %52 ], [ %63, %59 ], !dbg !56
  %.not8 = icmp eq i32 %.01, 0, !dbg !57
  br i1 %.not8, label %66, label %65, !dbg !58

65:                                               ; preds = %64
  br label %120, !dbg !59

66:                                               ; preds = %64
  %67 = bitcast i8* %30 to %struct.tcb_s*, !dbg !60
  %68 = call i32 @tls_init_info(%struct.tcb_s* noundef nonnull %67) #8, !dbg !61
  %.not9 = icmp eq i32 %68, 0, !dbg !62
  br i1 %.not9, label %71, label %69, !dbg !63

69:                                               ; preds = %66
  %70 = sub nsw i32 0, %68, !dbg !64
  br label %120, !dbg !65

71:                                               ; preds = %66
  %72 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i64 0, i32 2, !dbg !66
  %73 = load i8, i8* %72, align 2, !dbg !66
  %74 = icmp eq i8 %73, 0, !dbg !67
  br i1 %74, label %75, label %86, !dbg !68

75:                                               ; preds = %71
  %76 = call i32 @nxsched_get_param(i32 noundef 0, %struct.sched_param* noundef nonnull %7) #8, !dbg !69
  %77 = icmp slt i32 %76, 0, !dbg !70
  br i1 %77, label %78, label %80, !dbg !71

78:                                               ; preds = %75
  %79 = sub nsw i32 0, %76, !dbg !72
  br label %120, !dbg !73

80:                                               ; preds = %75
  %81 = call i32 @nxsched_get_scheduler(i32 noundef 0) #8, !dbg !74
  %82 = icmp slt i32 %81, 0, !dbg !75
  br i1 %82, label %83, label %85, !dbg !76

83:                                               ; preds = %80
  %84 = sub nsw i32 0, %81, !dbg !77
  br label %120, !dbg !78

85:                                               ; preds = %80
  br label %94, !dbg !79

86:                                               ; preds = %71
  %87 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i64 0, i32 1, !dbg !80
  %88 = load i8, i8* %87, align 1, !dbg !80
  %89 = zext i8 %88 to i32, !dbg !81
  %90 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %.03, i64 0, i32 0, !dbg !82
  %91 = load i8, i8* %90, align 8, !dbg !82
  %92 = zext i8 %91 to i32, !dbg !83
  %93 = getelementptr inbounds %struct.sched_param, %struct.sched_param* %7, i64 0, i32 0, !dbg !84
  store i32 %92, i32* %93, align 4, !dbg !85
  br label %94

94:                                               ; preds = %86, %85
  %.04 = phi i32 [ %81, %85 ], [ %89, %86 ], !dbg !56
  %95 = getelementptr inbounds %struct.sched_param, %struct.sched_param* %7, i64 0, i32 0, !dbg !86
  %96 = load i32, i32* %95, align 4, !dbg !86
  %97 = call i32 @pthread_setup_scheduler(%struct.pthread_tcb_s* noundef nonnull %31, i32 noundef %96, void ()* noundef nonnull @pthread_start, i8* (i8*)* noundef %3) #8, !dbg !87
  %.not10 = icmp eq i32 %97, 0, !dbg !88
  br i1 %.not10, label %99, label %98, !dbg !89

98:                                               ; preds = %94
  br label %120, !dbg !90

99:                                               ; preds = %94
  call void @pthread_tcb_setup(%struct.pthread_tcb_s* noundef nonnull %31, %struct.tcb_s* noundef nonnull %15, void (i8* (i8*)*, i8*)* noundef nonnull %0, i8* noundef %4) #9, !dbg !91
  call void @group_join(%struct.pthread_tcb_s* noundef nonnull %31) #8, !dbg !92
  %100 = getelementptr inbounds i8, i8* %30, i64 116, !dbg !93
  %101 = bitcast i8* %100 to i32*, !dbg !93
  %102 = load i32, i32* %101, align 4, !dbg !94
  %103 = and i32 %102, -25, !dbg !94
  store i32 %103, i32* %101, align 4, !dbg !94
  switch i32 %.04, label %104 [
    i32 1, label %105
    i32 0, label %106
    i32 2, label %106
  ], !dbg !95

104:                                              ; preds = %99
  br label %105, !dbg !96

105:                                              ; preds = %104, %99
  br label %113, !dbg !97

106:                                              ; preds = %99, %99
  %107 = getelementptr inbounds i8, i8* %30, i64 116, !dbg !98
  %108 = bitcast i8* %107 to i32*, !dbg !98
  %109 = load i32, i32* %108, align 4, !dbg !99
  %110 = or i32 %109, 8, !dbg !99
  store i32 %110, i32* %108, align 4, !dbg !99
  %111 = getelementptr inbounds i8, i8* %30, i64 124, !dbg !100
  %112 = bitcast i8* %111 to i32*, !dbg !100
  store i32 2000, i32* %112, align 4, !dbg !101
  br label %113, !dbg !102

113:                                              ; preds = %106, %105
  %.not11 = icmp eq i32* %1, null, !dbg !103
  br i1 %.not11, label %118, label %114, !dbg !104

114:                                              ; preds = %113
  %115 = getelementptr inbounds i8, i8* %30, i64 88, !dbg !105
  %116 = bitcast i8* %115 to i32*, !dbg !105
  %117 = load i32, i32* %116, align 8, !dbg !105
  store i32 %117, i32* %1, align 4, !dbg !106
  br label %118, !dbg !107

118:                                              ; preds = %114, %113
  %119 = bitcast i8* %30 to %struct.tcb_s*, !dbg !108
  call void @nxtask_activate(%struct.tcb_s* noundef nonnull %119) #8, !dbg !109
  br label %125, !dbg !110

120:                                              ; preds = %98, %83, %78, %69, %65
  %.02 = phi i32 [ 12, %65 ], [ %70, %69 ], [ %79, %78 ], [ %84, %83 ], [ 16, %98 ], !dbg !56
  %121 = getelementptr inbounds i8, i8* %30, i64 16, !dbg !111
  %122 = bitcast i8* %121 to %struct.task_group_s**, !dbg !111
  store %struct.task_group_s* null, %struct.task_group_s** %122, align 8, !dbg !112
  %123 = bitcast i8* %30 to %struct.tcb_s*, !dbg !113
  %124 = call i32 @nxsched_release_tcb(%struct.tcb_s* noundef nonnull %123, i8 noundef 1) #8, !dbg !114
  br label %125, !dbg !115

125:                                              ; preds = %120, %118, %34
  %.0 = phi i32 [ %.02, %120 ], [ 0, %118 ], [ 12, %34 ], !dbg !56
  ret i32 %.0, !dbg !116
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noreturn
declare dso_local void @__assert(i8* noundef, i32 noundef, i8* noundef) #2

; Function Attrs: allocsize(0)
declare dso_local noalias i8* @zalloc(i64 noundef) #3

declare dso_local void @nxtask_joininit(%struct.tcb_s* noundef) #4

declare dso_local void @group_bind(%struct.pthread_tcb_s* noundef) #4

declare dso_local i32 @up_use_stack(%struct.tcb_s* noundef, i8* noundef, i64 noundef) #4

declare dso_local i32 @up_create_stack(%struct.tcb_s* noundef, i64 noundef, i8 noundef) #4

declare dso_local i32 @tls_init_info(%struct.tcb_s* noundef) #4

declare dso_local i32 @nxsched_get_param(i32 noundef, %struct.sched_param* noundef) #4

declare dso_local i32 @nxsched_get_scheduler(i32 noundef) #4

; Function Attrs: noinline nounwind uwtable
define internal void @pthread_start() #0 !dbg !117 {
  %1 = call i64 asm sideeffect "mrs $0, tpidr_el1", "=r,~{memory}"() #6, !dbg !118, !srcloc !119
  %2 = and i64 %1, -2, !dbg !118
  %3 = inttoptr i64 %2 to %struct.pthread_tcb_s*, !dbg !120
  %4 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %3, i64 0, i32 0, i32 9, !dbg !121
  %5 = load i8, i8* %4, align 4, !dbg !121
  %6 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %3, i64 0, i32 0, i32 10, !dbg !122
  %7 = load i8, i8* %6, align 1, !dbg !122
  %8 = icmp ugt i8 %5, %7, !dbg !123
  br i1 %8, label %9, label %19, !dbg !124

9:                                                ; preds = %0
  %10 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %3, i64 0, i32 0, !dbg !125
  %11 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %3, i64 0, i32 0, i32 10, !dbg !125
  %12 = load i8, i8* %11, align 1, !dbg !125
  %13 = zext i8 %12 to i32, !dbg !125
  %14 = call i32 @nxsched_set_priority(%struct.tcb_s* noundef %10, i32 noundef %13) #8, !dbg !125
  %.not3 = icmp sgt i32 %14, -1, !dbg !125
  br i1 %.not3, label %17, label %15, !dbg !125

15:                                               ; preds = %9
  call void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i64 0, i64 0), i32 noundef 131, i8* noundef null) #5, !dbg !125
  unreachable, !dbg !125

16:                                               ; No predecessors!
  br label %18, !dbg !125

17:                                               ; preds = %9
  br label %18, !dbg !125

18:                                               ; preds = %17, %16
  br label %19, !dbg !126

19:                                               ; preds = %18, %0
  %20 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %3, i64 0, i32 1, !dbg !127
  %21 = load void (i8* (i8*)*, i8*)*, void (i8* (i8*)*, i8*)** %20, align 8, !dbg !127
  %.not = icmp eq void (i8* (i8*)*, i8*)* %21, null, !dbg !127
  br i1 %.not, label %26, label %22, !dbg !127

22:                                               ; preds = %19
  %23 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %3, i64 0, i32 0, i32 12, i32 0, !dbg !127
  %24 = load i8* (i8*)*, i8* (i8*)** %23, align 8, !dbg !127
  %25 = icmp ne i8* (i8*)* %24, null, !dbg !127
  br label %26

26:                                               ; preds = %22, %19
  %27 = phi i1 [ false, %19 ], [ %25, %22 ]
  br i1 %27, label %30, label %28, !dbg !127

28:                                               ; preds = %26
  call void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i64 0, i64 0), i32 noundef 139, i8* noundef null) #5, !dbg !127
  unreachable, !dbg !127

29:                                               ; No predecessors!
  br label %31, !dbg !127

30:                                               ; preds = %26
  br label %31, !dbg !127

31:                                               ; preds = %30, %29
  %32 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %3, i64 0, i32 1, !dbg !128
  %33 = load void (i8* (i8*)*, i8*)*, void (i8* (i8*)*, i8*)** %32, align 8, !dbg !128
  %34 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %3, i64 0, i32 0, i32 12, i32 0, !dbg !129
  %35 = load i8* (i8*)*, i8* (i8*)** %34, align 8, !dbg !129
  %36 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %3, i64 0, i32 2, !dbg !130
  %37 = load i8*, i8** %36, align 8, !dbg !130
  call void %33(i8* (i8*)* noundef %35, i8* noundef %37) #8, !dbg !131
  call void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i64 0, i64 0), i32 noundef 149, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0)) #5, !dbg !132
  unreachable, !dbg !132
}

declare dso_local i32 @pthread_setup_scheduler(%struct.pthread_tcb_s* noundef, i32 noundef, void ()* noundef, i8* (i8*)* noundef) #4

; Function Attrs: noinline nounwind uwtable
define internal void @pthread_tcb_setup(%struct.pthread_tcb_s* noundef %0, %struct.tcb_s* noundef %1, void (i8* (i8*)*, i8*)* noundef %2, i8* noundef %3) #0 !dbg !133 {
  %5 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %0, i64 0, i32 0, i32 31, i64 0, !dbg !134
  %6 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %1, i64 0, i32 31, i64 0, !dbg !135
  %7 = call i64 @strlcpy(i8* noundef nonnull %5, i8* noundef nonnull %6, i64 noundef 31) #8, !dbg !136
  %8 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %0, i64 0, i32 1, !dbg !137
  store void (i8* (i8*)*, i8*)* %2, void (i8* (i8*)*, i8*)** %8, align 8, !dbg !138
  %9 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %0, i64 0, i32 2, !dbg !139
  store i8* %3, i8** %9, align 8, !dbg !140
  ret void, !dbg !141
}

declare dso_local void @group_join(%struct.pthread_tcb_s* noundef) #4

declare dso_local void @nxtask_activate(%struct.tcb_s* noundef) #4

declare dso_local i32 @nxsched_release_tcb(%struct.tcb_s* noundef, i8 noundef) #4

declare dso_local i64 @strlcpy(i8* noundef, i8* noundef, i64 noundef) #4

declare dso_local i32 @nxsched_set_priority(%struct.tcb_s* noundef, i32 noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { noreturn "frame-pointer"="non-leaf" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #3 = { allocsize(0) "frame-pointer"="non-leaf" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #4 = { "frame-pointer"="non-leaf" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+v8a" }
attributes #5 = { nobuiltin noreturn nounwind "no-builtins" }
attributes #6 = { nounwind }
attributes #7 = { nobuiltin nounwind allocsize(0) "no-builtins" }
attributes #8 = { nobuiltin nounwind "no-builtins" }
attributes #9 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!2}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8, !9, !10, !11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c", directory: "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/Compile", checksumkind: CSK_MD5, checksum: "0bdbab8be08e4a2fd6eed438223da3ea")
!2 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!3 = !{i32 7, !"Dwarf Version", i32 5}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 1, !"branch-target-enforcement", i32 0}
!7 = !{i32 1, !"sign-return-address", i32 0}
!8 = !{i32 1, !"sign-return-address-all", i32 0}
!9 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 1}
!12 = distinct !DISubprogram(name: "nx_pthread_create", scope: !13, file: !13, line: 179, type: !14, scopeLine: 182, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "0bdbab8be08e4a2fd6eed438223da3ea")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 183, column: 33, scope: !12)
!17 = !DILocation(line: 191, column: 3, scope: !12)
!18 = !DILocation(line: 193, column: 12, scope: !12)
!19 = !{i64 2148822916}
!20 = !DILocation(line: 194, column: 3, scope: !12)
!21 = !DILocation(line: 198, column: 8, scope: !12)
!22 = !DILocation(line: 198, column: 7, scope: !12)
!23 = !DILocation(line: 202, column: 12, scope: !12)
!24 = !DILocation(line: 202, column: 11, scope: !12)
!25 = !DILocation(line: 204, column: 43, scope: !12)
!26 = !DILocation(line: 204, column: 24, scope: !12)
!27 = !DILocation(line: 204, column: 33, scope: !12)
!28 = !DILocation(line: 205, column: 9, scope: !12)
!29 = !DILocation(line: 208, column: 5, scope: !12)
!30 = !DILocation(line: 212, column: 10, scope: !12)
!31 = !DILocation(line: 213, column: 8, scope: !12)
!32 = !DILocation(line: 213, column: 7, scope: !12)
!33 = !DILocation(line: 215, column: 7, scope: !12)
!34 = !DILocation(line: 216, column: 7, scope: !12)
!35 = !DILocation(line: 219, column: 13, scope: !12)
!36 = !DILocation(line: 219, column: 19, scope: !12)
!37 = !DILocation(line: 223, column: 26, scope: !12)
!38 = !DILocation(line: 223, column: 3, scope: !12)
!39 = !DILocation(line: 229, column: 3, scope: !12)
!40 = !DILocation(line: 242, column: 13, scope: !12)
!41 = !DILocation(line: 242, column: 25, scope: !12)
!42 = !DILocation(line: 242, column: 7, scope: !12)
!43 = !DILocation(line: 244, column: 17, scope: !12)
!44 = !DILocation(line: 244, column: 23, scope: !12)
!45 = !DILocation(line: 245, column: 5, scope: !12)
!46 = !DILocation(line: 247, column: 13, scope: !12)
!47 = !DILocation(line: 247, column: 7, scope: !12)
!48 = !DILocation(line: 251, column: 26, scope: !12)
!49 = !DILocation(line: 251, column: 58, scope: !12)
!50 = !DILocation(line: 252, column: 32, scope: !12)
!51 = !DILocation(line: 251, column: 13, scope: !12)
!52 = !DILocation(line: 253, column: 5, scope: !12)
!53 = !DILocation(line: 258, column: 29, scope: !12)
!54 = !DILocation(line: 258, column: 61, scope: !12)
!55 = !DILocation(line: 258, column: 13, scope: !12)
!56 = !DILocation(line: 0, scope: !12)
!57 = !DILocation(line: 262, column: 11, scope: !12)
!58 = !DILocation(line: 262, column: 7, scope: !12)
!59 = !DILocation(line: 265, column: 7, scope: !12)
!60 = !DILocation(line: 282, column: 30, scope: !12)
!61 = !DILocation(line: 282, column: 9, scope: !12)
!62 = !DILocation(line: 283, column: 11, scope: !12)
!63 = !DILocation(line: 283, column: 7, scope: !12)
!64 = !DILocation(line: 285, column: 17, scope: !12)
!65 = !DILocation(line: 286, column: 7, scope: !12)
!66 = !DILocation(line: 294, column: 13, scope: !12)
!67 = !DILocation(line: 294, column: 26, scope: !12)
!68 = !DILocation(line: 294, column: 7, scope: !12)
!69 = !DILocation(line: 300, column: 13, scope: !12)
!70 = !DILocation(line: 301, column: 15, scope: !12)
!71 = !DILocation(line: 301, column: 11, scope: !12)
!72 = !DILocation(line: 303, column: 21, scope: !12)
!73 = !DILocation(line: 304, column: 11, scope: !12)
!74 = !DILocation(line: 309, column: 16, scope: !12)
!75 = !DILocation(line: 310, column: 18, scope: !12)
!76 = !DILocation(line: 310, column: 11, scope: !12)
!77 = !DILocation(line: 312, column: 21, scope: !12)
!78 = !DILocation(line: 313, column: 11, scope: !12)
!79 = !DILocation(line: 315, column: 5, scope: !12)
!80 = !DILocation(line: 320, column: 50, scope: !12)
!81 = !DILocation(line: 320, column: 44, scope: !12)
!82 = !DILocation(line: 321, column: 50, scope: !12)
!83 = !DILocation(line: 321, column: 44, scope: !12)
!84 = !DILocation(line: 321, column: 13, scope: !12)
!85 = !DILocation(line: 321, column: 42, scope: !12)
!86 = !DILocation(line: 388, column: 45, scope: !12)
!87 = !DILocation(line: 388, column: 9, scope: !12)
!88 = !DILocation(line: 390, column: 11, scope: !12)
!89 = !DILocation(line: 390, column: 7, scope: !12)
!90 = !DILocation(line: 393, column: 7, scope: !12)
!91 = !DILocation(line: 414, column: 3, scope: !12)
!92 = !DILocation(line: 418, column: 3, scope: !12)
!93 = !DILocation(line: 422, column: 13, scope: !12)
!94 = !DILocation(line: 422, column: 19, scope: !12)
!95 = !DILocation(line: 423, column: 3, scope: !12)
!96 = !DILocation(line: 424, column: 5, scope: !12)
!97 = !DILocation(line: 428, column: 9, scope: !12)
!98 = !DILocation(line: 433, column: 19, scope: !12)
!99 = !DILocation(line: 433, column: 28, scope: !12)
!100 = !DILocation(line: 434, column: 19, scope: !12)
!101 = !DILocation(line: 434, column: 29, scope: !12)
!102 = !DILocation(line: 435, column: 9, scope: !12)
!103 = !DILocation(line: 447, column: 14, scope: !12)
!104 = !DILocation(line: 447, column: 7, scope: !12)
!105 = !DILocation(line: 449, column: 38, scope: !12)
!106 = !DILocation(line: 449, column: 15, scope: !12)
!107 = !DILocation(line: 450, column: 5, scope: !12)
!108 = !DILocation(line: 454, column: 19, scope: !12)
!109 = !DILocation(line: 454, column: 3, scope: !12)
!110 = !DILocation(line: 456, column: 3, scope: !12)
!111 = !DILocation(line: 462, column: 13, scope: !12)
!112 = !DILocation(line: 462, column: 19, scope: !12)
!113 = !DILocation(line: 464, column: 23, scope: !12)
!114 = !DILocation(line: 464, column: 3, scope: !12)
!115 = !DILocation(line: 465, column: 3, scope: !12)
!116 = !DILocation(line: 466, column: 1, scope: !12)
!117 = distinct !DISubprogram(name: "pthread_start", scope: !13, file: !13, line: 120, type: !14, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!118 = !DILocation(line: 122, column: 64, scope: !117)
!119 = !{i64 2148820135}
!120 = !DILocation(line: 122, column: 36, scope: !117)
!121 = !DILocation(line: 129, column: 17, scope: !117)
!122 = !DILocation(line: 129, column: 44, scope: !117)
!123 = !DILocation(line: 129, column: 32, scope: !117)
!124 = !DILocation(line: 129, column: 7, scope: !117)
!125 = !DILocation(line: 131, column: 7, scope: !117)
!126 = !DILocation(line: 132, column: 5, scope: !117)
!127 = !DILocation(line: 139, column: 3, scope: !117)
!128 = !DILocation(line: 142, column: 9, scope: !117)
!129 = !DILocation(line: 142, column: 36, scope: !117)
!130 = !DILocation(line: 142, column: 51, scope: !117)
!131 = !DILocation(line: 142, column: 3, scope: !117)
!132 = !DILocation(line: 149, column: 3, scope: !117)
!133 = distinct !DISubprogram(name: "pthread_tcb_setup", scope: !13, file: !13, line: 90, type: !14, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!134 = !DILocation(line: 98, column: 11, scope: !133)
!135 = !DILocation(line: 98, column: 27, scope: !133)
!136 = !DILocation(line: 98, column: 3, scope: !133)
!137 = !DILocation(line: 105, column: 9, scope: !133)
!138 = !DILocation(line: 105, column: 20, scope: !133)
!139 = !DILocation(line: 106, column: 9, scope: !133)
!140 = !DILocation(line: 106, column: 20, scope: !133)
!141 = !DILocation(line: 107, column: 1, scope: !133)
