; ModuleID = '/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c'
source_filename = "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-unknown"

%struct.pthread_attr_s = type { i8, i8, i8, i8, i8*, i32 }
%struct.dq_queue_s = type { %struct.dq_entry_s*, %struct.dq_entry_s* }
%struct.dq_entry_s = type { %struct.dq_entry_s*, %struct.dq_entry_s* }
%struct.pthread_tcb_s = type { %struct.tcb_s, void (i8* (i8*)*, i8*)*, i8* }
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
%struct.sched_param = type { i32 }

@g_default_pthread_attr = dso_local constant %struct.pthread_attr_s { i8 100, i8 0, i8 1, i8 0, i8* null, i32 4096 }, align 4
@.str = private unnamed_addr constant [88 x i8] c"/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c\00", align 1
@g_readytorun = external dso_local global %struct.dq_queue_s, align 4
@.str.1 = private unnamed_addr constant [6 x i8] c"panic\00", align 1

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @nx_pthread_create(void (i8* (i8*)*, i8*)* noundef %0, i32* noundef %1, %struct.pthread_attr_s* noundef %2, i8* (i8*)* noundef %3, i8* noundef %4) #0 !dbg !12 {
  %6 = alloca i32, align 4
  %7 = alloca void (i8* (i8*)*, i8*)*, align 4
  %8 = alloca i32*, align 4
  %9 = alloca %struct.pthread_attr_s*, align 4
  %10 = alloca i8* (i8*)*, align 4
  %11 = alloca i8*, align 4
  %12 = alloca %struct.pthread_attr_s, align 4
  %13 = alloca %struct.pthread_tcb_s*, align 4
  %14 = alloca %struct.sched_param, align 4
  %15 = alloca %struct.tcb_s*, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store void (i8* (i8*)*, i8*)* %0, void (i8* (i8*)*, i8*)** %7, align 4
  store i32* %1, i32** %8, align 4
  store %struct.pthread_attr_s* %2, %struct.pthread_attr_s** %9, align 4
  store i8* (i8*)* %3, i8* (i8*)** %10, align 4
  store i8* %4, i8** %11, align 4
  %19 = bitcast %struct.pthread_attr_s* %12 to i8*, !dbg !16
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %19, i8* align 4 getelementptr inbounds (%struct.pthread_attr_s, %struct.pthread_attr_s* @g_default_pthread_attr, i32 0, i32 0), i32 12, i1 false), !dbg !16
  %20 = load void (i8* (i8*)*, i8*)*, void (i8* (i8*)*, i8*)** %7, align 4, !dbg !17
  %21 = icmp ne void (i8* (i8*)*, i8*)* %20, null, !dbg !17
  %22 = xor i1 %21, true, !dbg !17
  %23 = xor i1 %22, true, !dbg !17
  %24 = xor i1 %23, true, !dbg !17
  br i1 %24, label %25, label %27, !dbg !17

25:                                               ; preds = %5
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i32 0, i32 0), i32 noundef 191, i8* noundef null) #5, !dbg !17
  unreachable, !dbg !17

26:                                               ; No predecessors!
  br label %28, !dbg !17

27:                                               ; preds = %5
  br label %28, !dbg !17

28:                                               ; preds = %27, %26
  %29 = load %struct.dq_entry_s*, %struct.dq_entry_s** getelementptr inbounds (%struct.dq_queue_s, %struct.dq_queue_s* @g_readytorun, i32 0, i32 0), align 4, !dbg !18
  %30 = bitcast %struct.dq_entry_s* %29 to %struct.tcb_s*, !dbg !18
  store %struct.tcb_s* %30, %struct.tcb_s** %15, align 4, !dbg !19
  %31 = load %struct.tcb_s*, %struct.tcb_s** %15, align 4, !dbg !20
  %32 = icmp ne %struct.tcb_s* %31, null, !dbg !20
  %33 = xor i1 %32, true, !dbg !20
  %34 = xor i1 %33, true, !dbg !20
  %35 = xor i1 %34, true, !dbg !20
  br i1 %35, label %36, label %38, !dbg !20

36:                                               ; preds = %28
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i32 0, i32 0), i32 noundef 194, i8* noundef null) #5, !dbg !20
  unreachable, !dbg !20

37:                                               ; No predecessors!
  br label %39, !dbg !20

38:                                               ; preds = %28
  br label %39, !dbg !20

39:                                               ; preds = %38, %37
  %40 = load %struct.pthread_attr_s*, %struct.pthread_attr_s** %9, align 4, !dbg !21
  %41 = icmp ne %struct.pthread_attr_s* %40, null, !dbg !21
  br i1 %41, label %53, label %42, !dbg !22

42:                                               ; preds = %39
  %43 = load %struct.tcb_s*, %struct.tcb_s** %15, align 4, !dbg !23
  %44 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %43, i32 0, i32 8, !dbg !23
  %45 = load i32, i32* %44, align 4, !dbg !23
  %46 = icmp slt i32 %45, 1, !dbg !23
  br i1 %46, label %52, label %47, !dbg !24

47:                                               ; preds = %42
  %48 = load %struct.tcb_s*, %struct.tcb_s** %15, align 4, !dbg !25
  %49 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %48, i32 0, i32 9, !dbg !26
  %50 = load i8, i8* %49, align 4, !dbg !26
  %51 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %12, i32 0, i32 0, !dbg !27
  store i8 %50, i8* %51, align 4, !dbg !28
  br label %52, !dbg !29

52:                                               ; preds = %47, %42
  store %struct.pthread_attr_s* %12, %struct.pthread_attr_s** %9, align 4, !dbg !30
  br label %53, !dbg !31

53:                                               ; preds = %52, %39
  %54 = call arm_aapcs_vfpcc noalias i8* @zalloc(i32 noundef 204) #6, !dbg !32
  %55 = bitcast i8* %54 to %struct.pthread_tcb_s*, !dbg !32
  store %struct.pthread_tcb_s* %55, %struct.pthread_tcb_s** %13, align 4, !dbg !33
  %56 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !34
  %57 = icmp ne %struct.pthread_tcb_s* %56, null, !dbg !34
  br i1 %57, label %61, label %58, !dbg !35

58:                                               ; preds = %53
  br label %59, !dbg !36

59:                                               ; preds = %58
  br label %60, !dbg !36

60:                                               ; preds = %59
  store i32 12, i32* %6, align 4, !dbg !37
  br label %204, !dbg !37

61:                                               ; preds = %53
  %62 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !38
  %63 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %62, i32 0, i32 0, !dbg !39
  %64 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %63, i32 0, i32 14, !dbg !40
  %65 = load i32, i32* %64, align 4, !dbg !41
  %66 = or i32 %65, 32768, !dbg !41
  store i32 %66, i32* %64, align 4, !dbg !41
  %67 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !42
  %68 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %67, i32 0, i32 0, !dbg !43
  call arm_aapcs_vfpcc void @nxtask_joininit(%struct.tcb_s* noundef %68) #7, !dbg !44
  %69 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !45
  call arm_aapcs_vfpcc void @group_bind(%struct.pthread_tcb_s* noundef %69) #7, !dbg !46
  %70 = load %struct.pthread_attr_s*, %struct.pthread_attr_s** %9, align 4, !dbg !47
  %71 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %70, i32 0, i32 3, !dbg !48
  %72 = load i8, i8* %71, align 1, !dbg !48
  %73 = zext i8 %72 to i32, !dbg !47
  %74 = icmp eq i32 %73, 1, !dbg !49
  br i1 %74, label %75, label %81, !dbg !47

75:                                               ; preds = %61
  %76 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !50
  %77 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %76, i32 0, i32 0, !dbg !51
  %78 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %77, i32 0, i32 14, !dbg !52
  %79 = load i32, i32* %78, align 4, !dbg !53
  %80 = or i32 %79, 4096, !dbg !53
  store i32 %80, i32* %78, align 4, !dbg !53
  br label %81, !dbg !54

81:                                               ; preds = %75, %61
  %82 = load %struct.pthread_attr_s*, %struct.pthread_attr_s** %9, align 4, !dbg !55
  %83 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %82, i32 0, i32 4, !dbg !56
  %84 = load i8*, i8** %83, align 4, !dbg !56
  %85 = icmp ne i8* %84, null, !dbg !55
  br i1 %85, label %86, label %96, !dbg !55

86:                                               ; preds = %81
  %87 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !57
  %88 = bitcast %struct.pthread_tcb_s* %87 to %struct.tcb_s*, !dbg !58
  %89 = load %struct.pthread_attr_s*, %struct.pthread_attr_s** %9, align 4, !dbg !59
  %90 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %89, i32 0, i32 4, !dbg !60
  %91 = load i8*, i8** %90, align 4, !dbg !60
  %92 = load %struct.pthread_attr_s*, %struct.pthread_attr_s** %9, align 4, !dbg !61
  %93 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %92, i32 0, i32 5, !dbg !62
  %94 = load i32, i32* %93, align 4, !dbg !62
  %95 = call arm_aapcs_vfpcc i32 @up_use_stack(%struct.tcb_s* noundef %88, i8* noundef %91, i32 noundef %94) #7, !dbg !63
  store i32 %95, i32* %18, align 4, !dbg !64
  br label %103, !dbg !65

96:                                               ; preds = %81
  %97 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !66
  %98 = bitcast %struct.pthread_tcb_s* %97 to %struct.tcb_s*, !dbg !67
  %99 = load %struct.pthread_attr_s*, %struct.pthread_attr_s** %9, align 4, !dbg !68
  %100 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %99, i32 0, i32 5, !dbg !69
  %101 = load i32, i32* %100, align 4, !dbg !69
  %102 = call arm_aapcs_vfpcc i32 @up_create_stack(%struct.tcb_s* noundef %98, i32 noundef %101, i8 noundef zeroext 1) #7, !dbg !70
  store i32 %102, i32* %18, align 4, !dbg !71
  br label %103

103:                                              ; preds = %96, %86
  %104 = load i32, i32* %18, align 4, !dbg !72
  %105 = icmp ne i32 %104, 0, !dbg !73
  br i1 %105, label %106, label %107, !dbg !72

106:                                              ; preds = %103
  store i32 12, i32* %17, align 4, !dbg !74
  br label %196, !dbg !75

107:                                              ; preds = %103
  %108 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !76
  %109 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %108, i32 0, i32 0, !dbg !77
  %110 = call arm_aapcs_vfpcc i32 @tls_init_info(%struct.tcb_s* noundef %109) #7, !dbg !78
  store i32 %110, i32* %18, align 4, !dbg !79
  %111 = load i32, i32* %18, align 4, !dbg !80
  %112 = icmp ne i32 %111, 0, !dbg !81
  br i1 %112, label %113, label %116, !dbg !80

113:                                              ; preds = %107
  %114 = load i32, i32* %18, align 4, !dbg !82
  %115 = sub nsw i32 0, %114, !dbg !83
  store i32 %115, i32* %17, align 4, !dbg !84
  br label %196, !dbg !85

116:                                              ; preds = %107
  %117 = load %struct.pthread_attr_s*, %struct.pthread_attr_s** %9, align 4, !dbg !86
  %118 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %117, i32 0, i32 2, !dbg !87
  %119 = load i8, i8* %118, align 2, !dbg !87
  %120 = zext i8 %119 to i32, !dbg !86
  %121 = icmp eq i32 %120, 0, !dbg !88
  br i1 %121, label %122, label %137, !dbg !86

122:                                              ; preds = %116
  %123 = call arm_aapcs_vfpcc i32 @nxsched_get_param(i32 noundef 0, %struct.sched_param* noundef %14) #7, !dbg !89
  store i32 %123, i32* %18, align 4, !dbg !90
  %124 = load i32, i32* %18, align 4, !dbg !91
  %125 = icmp slt i32 %124, 0, !dbg !92
  br i1 %125, label %126, label %129, !dbg !91

126:                                              ; preds = %122
  %127 = load i32, i32* %18, align 4, !dbg !93
  %128 = sub nsw i32 0, %127, !dbg !94
  store i32 %128, i32* %17, align 4, !dbg !95
  br label %196, !dbg !96

129:                                              ; preds = %122
  %130 = call arm_aapcs_vfpcc i32 @nxsched_get_scheduler(i32 noundef 0) #7, !dbg !97
  store i32 %130, i32* %16, align 4, !dbg !98
  %131 = load i32, i32* %16, align 4, !dbg !99
  %132 = icmp slt i32 %131, 0, !dbg !100
  br i1 %132, label %133, label %136, !dbg !99

133:                                              ; preds = %129
  %134 = load i32, i32* %16, align 4, !dbg !101
  %135 = sub nsw i32 0, %134, !dbg !102
  store i32 %135, i32* %17, align 4, !dbg !103
  br label %196, !dbg !104

136:                                              ; preds = %129
  br label %147, !dbg !105

137:                                              ; preds = %116
  %138 = load %struct.pthread_attr_s*, %struct.pthread_attr_s** %9, align 4, !dbg !106
  %139 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %138, i32 0, i32 1, !dbg !107
  %140 = load i8, i8* %139, align 1, !dbg !107
  %141 = zext i8 %140 to i32, !dbg !106
  store i32 %141, i32* %16, align 4, !dbg !108
  %142 = load %struct.pthread_attr_s*, %struct.pthread_attr_s** %9, align 4, !dbg !109
  %143 = getelementptr inbounds %struct.pthread_attr_s, %struct.pthread_attr_s* %142, i32 0, i32 0, !dbg !110
  %144 = load i8, i8* %143, align 4, !dbg !110
  %145 = zext i8 %144 to i32, !dbg !109
  %146 = getelementptr inbounds %struct.sched_param, %struct.sched_param* %14, i32 0, i32 0, !dbg !111
  store i32 %145, i32* %146, align 4, !dbg !112
  br label %147

147:                                              ; preds = %137, %136
  %148 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !113
  %149 = getelementptr inbounds %struct.sched_param, %struct.sched_param* %14, i32 0, i32 0, !dbg !114
  %150 = load i32, i32* %149, align 4, !dbg !114
  %151 = load i8* (i8*)*, i8* (i8*)** %10, align 4, !dbg !115
  %152 = call arm_aapcs_vfpcc i32 @pthread_setup_scheduler(%struct.pthread_tcb_s* noundef %148, i32 noundef %150, void ()* noundef @pthread_start, i8* (i8*)* noundef %151) #7, !dbg !116
  store i32 %152, i32* %18, align 4, !dbg !117
  %153 = load i32, i32* %18, align 4, !dbg !118
  %154 = icmp ne i32 %153, 0, !dbg !119
  br i1 %154, label %155, label %156, !dbg !118

155:                                              ; preds = %147
  store i32 16, i32* %17, align 4, !dbg !120
  br label %196, !dbg !121

156:                                              ; preds = %147
  %157 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !122
  %158 = load %struct.tcb_s*, %struct.tcb_s** %15, align 4, !dbg !123
  %159 = load void (i8* (i8*)*, i8*)*, void (i8* (i8*)*, i8*)** %7, align 4, !dbg !124
  %160 = load i8*, i8** %11, align 4, !dbg !125
  call arm_aapcs_vfpcc void @pthread_tcb_setup(%struct.pthread_tcb_s* noundef %157, %struct.tcb_s* noundef %158, void (i8* (i8*)*, i8*)* noundef %159, i8* noundef %160) #7, !dbg !126
  %161 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !127
  call arm_aapcs_vfpcc void @group_join(%struct.pthread_tcb_s* noundef %161) #7, !dbg !128
  %162 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !129
  %163 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %162, i32 0, i32 0, !dbg !130
  %164 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %163, i32 0, i32 14, !dbg !131
  %165 = load i32, i32* %164, align 4, !dbg !132
  %166 = and i32 %165, -25, !dbg !132
  store i32 %166, i32* %164, align 4, !dbg !132
  %167 = load i32, i32* %16, align 4, !dbg !133
  switch i32 %167, label %168 [
    i32 1, label %169
    i32 0, label %175
    i32 2, label %175
  ], !dbg !134

168:                                              ; preds = %156
  br label %169, !dbg !135

169:                                              ; preds = %156, %168
  %170 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !136
  %171 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %170, i32 0, i32 0, !dbg !137
  %172 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %171, i32 0, i32 14, !dbg !138
  %173 = load i32, i32* %172, align 4, !dbg !139
  %174 = or i32 %173, 0, !dbg !139
  store i32 %174, i32* %172, align 4, !dbg !139
  br label %184, !dbg !140

175:                                              ; preds = %156, %156
  %176 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !141
  %177 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %176, i32 0, i32 0, !dbg !142
  %178 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %177, i32 0, i32 14, !dbg !143
  %179 = load i32, i32* %178, align 4, !dbg !144
  %180 = or i32 %179, 8, !dbg !144
  store i32 %180, i32* %178, align 4, !dbg !144
  %181 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !145
  %182 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %181, i32 0, i32 0, !dbg !146
  %183 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %182, i32 0, i32 17, !dbg !147
  store i32 2000, i32* %183, align 4, !dbg !148
  br label %184, !dbg !149

184:                                              ; preds = %175, %169
  %185 = load i32*, i32** %8, align 4, !dbg !150
  %186 = icmp ne i32* %185, null, !dbg !151
  br i1 %186, label %187, label %193, !dbg !150

187:                                              ; preds = %184
  %188 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !152
  %189 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %188, i32 0, i32 0, !dbg !153
  %190 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %189, i32 0, i32 8, !dbg !154
  %191 = load i32, i32* %190, align 4, !dbg !154
  %192 = load i32*, i32** %8, align 4, !dbg !155
  store i32 %191, i32* %192, align 4, !dbg !156
  br label %193, !dbg !157

193:                                              ; preds = %187, %184
  %194 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !158
  %195 = bitcast %struct.pthread_tcb_s* %194 to %struct.tcb_s*, !dbg !159
  call arm_aapcs_vfpcc void @nxtask_activate(%struct.tcb_s* noundef %195) #7, !dbg !160
  store i32 0, i32* %6, align 4, !dbg !161
  br label %204, !dbg !161

196:                                              ; preds = %155, %133, %126, %113, %106
  %197 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !162
  %198 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %197, i32 0, i32 0, !dbg !163
  %199 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %198, i32 0, i32 2, !dbg !164
  store %struct.task_group_s* null, %struct.task_group_s** %199, align 4, !dbg !165
  %200 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %13, align 4, !dbg !166
  %201 = bitcast %struct.pthread_tcb_s* %200 to %struct.tcb_s*, !dbg !167
  %202 = call arm_aapcs_vfpcc i32 @nxsched_release_tcb(%struct.tcb_s* noundef %201, i8 noundef zeroext 1) #7, !dbg !168
  %203 = load i32, i32* %17, align 4, !dbg !169
  store i32 %203, i32* %6, align 4, !dbg !170
  br label %204, !dbg !170

204:                                              ; preds = %196, %193, %60
  %205 = load i32, i32* %6, align 4, !dbg !171
  ret i32 %205, !dbg !171
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

declare dso_local arm_aapcs_vfpcc i32 @nxsched_get_param(i32 noundef, %struct.sched_param* noundef) #4

declare dso_local arm_aapcs_vfpcc i32 @nxsched_get_scheduler(i32 noundef) #4

declare dso_local arm_aapcs_vfpcc i32 @pthread_setup_scheduler(%struct.pthread_tcb_s* noundef, i32 noundef, void ()* noundef, i8* (i8*)* noundef) #4

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc void @pthread_start() #0 !dbg !172 {
  %1 = alloca %struct.pthread_tcb_s*, align 4
  %2 = load %struct.dq_entry_s*, %struct.dq_entry_s** getelementptr inbounds (%struct.dq_queue_s, %struct.dq_queue_s* @g_readytorun, i32 0, i32 0), align 4, !dbg !173
  %3 = bitcast %struct.dq_entry_s* %2 to %struct.tcb_s*, !dbg !173
  %4 = bitcast %struct.tcb_s* %3 to %struct.pthread_tcb_s*, !dbg !174
  store %struct.pthread_tcb_s* %4, %struct.pthread_tcb_s** %1, align 4, !dbg !175
  %5 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %1, align 4, !dbg !176
  %6 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %5, i32 0, i32 0, !dbg !177
  %7 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %6, i32 0, i32 9, !dbg !178
  %8 = load i8, i8* %7, align 4, !dbg !178
  %9 = zext i8 %8 to i32, !dbg !176
  %10 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %1, align 4, !dbg !179
  %11 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %10, i32 0, i32 0, !dbg !180
  %12 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %11, i32 0, i32 10, !dbg !181
  %13 = load i8, i8* %12, align 1, !dbg !181
  %14 = zext i8 %13 to i32, !dbg !179
  %15 = icmp sgt i32 %9, %14, !dbg !182
  br i1 %15, label %16, label %32, !dbg !176

16:                                               ; preds = %0
  %17 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %1, align 4, !dbg !183
  %18 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %17, i32 0, i32 0, !dbg !183
  %19 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %1, align 4, !dbg !183
  %20 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %19, i32 0, i32 0, !dbg !183
  %21 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %20, i32 0, i32 10, !dbg !183
  %22 = load i8, i8* %21, align 1, !dbg !183
  %23 = zext i8 %22 to i32, !dbg !183
  %24 = call arm_aapcs_vfpcc i32 @nxsched_set_priority(%struct.tcb_s* noundef %18, i32 noundef %23) #7, !dbg !183
  %25 = icmp slt i32 %24, 0, !dbg !183
  %26 = xor i1 %25, true, !dbg !183
  %27 = xor i1 %26, true, !dbg !183
  br i1 %27, label %28, label %30, !dbg !183

28:                                               ; preds = %16
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i32 0, i32 0), i32 noundef 131, i8* noundef null) #5, !dbg !183
  unreachable, !dbg !183

29:                                               ; No predecessors!
  br label %31, !dbg !183

30:                                               ; preds = %16
  br label %31, !dbg !183

31:                                               ; preds = %30, %29
  br label %32, !dbg !184

32:                                               ; preds = %31, %0
  %33 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %1, align 4, !dbg !185
  %34 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %33, i32 0, i32 1, !dbg !185
  %35 = load void (i8* (i8*)*, i8*)*, void (i8* (i8*)*, i8*)** %34, align 4, !dbg !185
  %36 = icmp ne void (i8* (i8*)*, i8*)* %35, null, !dbg !185
  br i1 %36, label %37, label %44, !dbg !185

37:                                               ; preds = %32
  %38 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %1, align 4, !dbg !185
  %39 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %38, i32 0, i32 0, !dbg !185
  %40 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %39, i32 0, i32 12, !dbg !185
  %41 = bitcast %union.entry_u* %40 to i8* (i8*)**, !dbg !185
  %42 = load i8* (i8*)*, i8* (i8*)** %41, align 4, !dbg !185
  %43 = icmp ne i8* (i8*)* %42, null, !dbg !185
  br label %44

44:                                               ; preds = %37, %32
  %45 = phi i1 [ false, %32 ], [ %43, %37 ], !dbg !186
  %46 = xor i1 %45, true, !dbg !185
  %47 = xor i1 %46, true, !dbg !185
  %48 = xor i1 %47, true, !dbg !185
  br i1 %48, label %49, label %51, !dbg !185

49:                                               ; preds = %44
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i32 0, i32 0), i32 noundef 139, i8* noundef null) #5, !dbg !185
  unreachable, !dbg !185

50:                                               ; No predecessors!
  br label %52, !dbg !185

51:                                               ; preds = %44
  br label %52, !dbg !185

52:                                               ; preds = %51, %50
  %53 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %1, align 4, !dbg !187
  %54 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %53, i32 0, i32 1, !dbg !188
  %55 = load void (i8* (i8*)*, i8*)*, void (i8* (i8*)*, i8*)** %54, align 4, !dbg !188
  %56 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %1, align 4, !dbg !189
  %57 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %56, i32 0, i32 0, !dbg !190
  %58 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %57, i32 0, i32 12, !dbg !191
  %59 = bitcast %union.entry_u* %58 to i8* (i8*)**, !dbg !192
  %60 = load i8* (i8*)*, i8* (i8*)** %59, align 4, !dbg !192
  %61 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %1, align 4, !dbg !193
  %62 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %61, i32 0, i32 2, !dbg !194
  %63 = load i8*, i8** %62, align 4, !dbg !194
  call arm_aapcs_vfpcc void %55(i8* (i8*)* noundef %60, i8* noundef %63) #7, !dbg !187
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([88 x i8], [88 x i8]* @.str, i32 0, i32 0), i32 noundef 149, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0)) #5, !dbg !195
  unreachable, !dbg !195
}

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc void @pthread_tcb_setup(%struct.pthread_tcb_s* noundef %0, %struct.tcb_s* noundef %1, void (i8* (i8*)*, i8*)* noundef %2, i8* noundef %3) #0 !dbg !196 {
  %5 = alloca %struct.pthread_tcb_s*, align 4
  %6 = alloca %struct.tcb_s*, align 4
  %7 = alloca void (i8* (i8*)*, i8*)*, align 4
  %8 = alloca i8*, align 4
  store %struct.pthread_tcb_s* %0, %struct.pthread_tcb_s** %5, align 4
  store %struct.tcb_s* %1, %struct.tcb_s** %6, align 4
  store void (i8* (i8*)*, i8*)* %2, void (i8* (i8*)*, i8*)** %7, align 4
  store i8* %3, i8** %8, align 4
  %9 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %5, align 4, !dbg !197
  %10 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %9, i32 0, i32 0, !dbg !198
  %11 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %10, i32 0, i32 31, !dbg !199
  %12 = getelementptr inbounds [32 x i8], [32 x i8]* %11, i32 0, i32 0, !dbg !197
  %13 = load %struct.tcb_s*, %struct.tcb_s** %6, align 4, !dbg !200
  %14 = getelementptr inbounds %struct.tcb_s, %struct.tcb_s* %13, i32 0, i32 31, !dbg !201
  %15 = getelementptr inbounds [32 x i8], [32 x i8]* %14, i32 0, i32 0, !dbg !200
  %16 = call arm_aapcs_vfpcc i32 @strlcpy(i8* noundef %12, i8* noundef %15, i32 noundef 31) #7, !dbg !202
  %17 = load void (i8* (i8*)*, i8*)*, void (i8* (i8*)*, i8*)** %7, align 4, !dbg !203
  %18 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %5, align 4, !dbg !204
  %19 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %18, i32 0, i32 1, !dbg !205
  store void (i8* (i8*)*, i8*)* %17, void (i8* (i8*)*, i8*)** %19, align 4, !dbg !206
  %20 = load i8*, i8** %8, align 4, !dbg !207
  %21 = load %struct.pthread_tcb_s*, %struct.pthread_tcb_s** %5, align 4, !dbg !208
  %22 = getelementptr inbounds %struct.pthread_tcb_s, %struct.pthread_tcb_s* %21, i32 0, i32 2, !dbg !209
  store i8* %20, i8** %22, align 4, !dbg !210
  ret void, !dbg !211
}

declare dso_local arm_aapcs_vfpcc void @group_join(%struct.pthread_tcb_s* noundef) #4

declare dso_local arm_aapcs_vfpcc void @nxtask_activate(%struct.tcb_s* noundef) #4

declare dso_local arm_aapcs_vfpcc i32 @nxsched_release_tcb(%struct.tcb_s* noundef, i8 noundef zeroext) #4

declare dso_local arm_aapcs_vfpcc i32 @nxsched_set_priority(%struct.tcb_s* noundef, i32 noundef) #4

declare dso_local arm_aapcs_vfpcc i32 @strlcpy(i8* noundef, i8* noundef, i32 noundef) #4

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { noreturn "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #4 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #5 = { nobuiltin noreturn "no-builtins" }
attributes #6 = { nobuiltin allocsize(0) "no-builtins" }
attributes #7 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c", directory: "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/Compile", checksumkind: CSK_MD5, checksum: "0bdbab8be08e4a2fd6eed438223da3ea")
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
!12 = distinct !DISubprogram(name: "nx_pthread_create", scope: !13, file: !13, line: 179, type: !14, scopeLine: 182, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/sched/pthread/pthread_create.c", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "0bdbab8be08e4a2fd6eed438223da3ea")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 183, column: 33, scope: !12)
!17 = !DILocation(line: 191, column: 3, scope: !12)
!18 = !DILocation(line: 193, column: 12, scope: !12)
!19 = !DILocation(line: 193, column: 10, scope: !12)
!20 = !DILocation(line: 194, column: 3, scope: !12)
!21 = !DILocation(line: 198, column: 8, scope: !12)
!22 = !DILocation(line: 198, column: 7, scope: !12)
!23 = !DILocation(line: 202, column: 12, scope: !12)
!24 = !DILocation(line: 202, column: 11, scope: !12)
!25 = !DILocation(line: 204, column: 35, scope: !12)
!26 = !DILocation(line: 204, column: 43, scope: !12)
!27 = !DILocation(line: 204, column: 24, scope: !12)
!28 = !DILocation(line: 204, column: 33, scope: !12)
!29 = !DILocation(line: 205, column: 9, scope: !12)
!30 = !DILocation(line: 207, column: 12, scope: !12)
!31 = !DILocation(line: 208, column: 5, scope: !12)
!32 = !DILocation(line: 212, column: 10, scope: !12)
!33 = !DILocation(line: 212, column: 8, scope: !12)
!34 = !DILocation(line: 213, column: 8, scope: !12)
!35 = !DILocation(line: 213, column: 7, scope: !12)
!36 = !DILocation(line: 215, column: 7, scope: !12)
!37 = !DILocation(line: 216, column: 7, scope: !12)
!38 = !DILocation(line: 219, column: 3, scope: !12)
!39 = !DILocation(line: 219, column: 9, scope: !12)
!40 = !DILocation(line: 219, column: 13, scope: !12)
!41 = !DILocation(line: 219, column: 19, scope: !12)
!42 = !DILocation(line: 223, column: 20, scope: !12)
!43 = !DILocation(line: 223, column: 26, scope: !12)
!44 = !DILocation(line: 223, column: 3, scope: !12)
!45 = !DILocation(line: 229, column: 14, scope: !12)
!46 = !DILocation(line: 229, column: 3, scope: !12)
!47 = !DILocation(line: 242, column: 7, scope: !12)
!48 = !DILocation(line: 242, column: 13, scope: !12)
!49 = !DILocation(line: 242, column: 25, scope: !12)
!50 = !DILocation(line: 244, column: 7, scope: !12)
!51 = !DILocation(line: 244, column: 13, scope: !12)
!52 = !DILocation(line: 244, column: 17, scope: !12)
!53 = !DILocation(line: 244, column: 23, scope: !12)
!54 = !DILocation(line: 245, column: 5, scope: !12)
!55 = !DILocation(line: 247, column: 7, scope: !12)
!56 = !DILocation(line: 247, column: 13, scope: !12)
!57 = !DILocation(line: 251, column: 46, scope: !12)
!58 = !DILocation(line: 251, column: 26, scope: !12)
!59 = !DILocation(line: 251, column: 52, scope: !12)
!60 = !DILocation(line: 251, column: 58, scope: !12)
!61 = !DILocation(line: 252, column: 26, scope: !12)
!62 = !DILocation(line: 252, column: 32, scope: !12)
!63 = !DILocation(line: 251, column: 13, scope: !12)
!64 = !DILocation(line: 251, column: 11, scope: !12)
!65 = !DILocation(line: 253, column: 5, scope: !12)
!66 = !DILocation(line: 258, column: 49, scope: !12)
!67 = !DILocation(line: 258, column: 29, scope: !12)
!68 = !DILocation(line: 258, column: 55, scope: !12)
!69 = !DILocation(line: 258, column: 61, scope: !12)
!70 = !DILocation(line: 258, column: 13, scope: !12)
!71 = !DILocation(line: 258, column: 11, scope: !12)
!72 = !DILocation(line: 262, column: 7, scope: !12)
!73 = !DILocation(line: 262, column: 11, scope: !12)
!74 = !DILocation(line: 264, column: 15, scope: !12)
!75 = !DILocation(line: 265, column: 7, scope: !12)
!76 = !DILocation(line: 282, column: 24, scope: !12)
!77 = !DILocation(line: 282, column: 30, scope: !12)
!78 = !DILocation(line: 282, column: 9, scope: !12)
!79 = !DILocation(line: 282, column: 7, scope: !12)
!80 = !DILocation(line: 283, column: 7, scope: !12)
!81 = !DILocation(line: 283, column: 11, scope: !12)
!82 = !DILocation(line: 285, column: 18, scope: !12)
!83 = !DILocation(line: 285, column: 17, scope: !12)
!84 = !DILocation(line: 285, column: 15, scope: !12)
!85 = !DILocation(line: 286, column: 7, scope: !12)
!86 = !DILocation(line: 294, column: 7, scope: !12)
!87 = !DILocation(line: 294, column: 13, scope: !12)
!88 = !DILocation(line: 294, column: 26, scope: !12)
!89 = !DILocation(line: 300, column: 13, scope: !12)
!90 = !DILocation(line: 300, column: 11, scope: !12)
!91 = !DILocation(line: 301, column: 11, scope: !12)
!92 = !DILocation(line: 301, column: 15, scope: !12)
!93 = !DILocation(line: 303, column: 22, scope: !12)
!94 = !DILocation(line: 303, column: 21, scope: !12)
!95 = !DILocation(line: 303, column: 19, scope: !12)
!96 = !DILocation(line: 304, column: 11, scope: !12)
!97 = !DILocation(line: 309, column: 16, scope: !12)
!98 = !DILocation(line: 309, column: 14, scope: !12)
!99 = !DILocation(line: 310, column: 11, scope: !12)
!100 = !DILocation(line: 310, column: 18, scope: !12)
!101 = !DILocation(line: 312, column: 22, scope: !12)
!102 = !DILocation(line: 312, column: 21, scope: !12)
!103 = !DILocation(line: 312, column: 19, scope: !12)
!104 = !DILocation(line: 313, column: 11, scope: !12)
!105 = !DILocation(line: 315, column: 5, scope: !12)
!106 = !DILocation(line: 320, column: 44, scope: !12)
!107 = !DILocation(line: 320, column: 50, scope: !12)
!108 = !DILocation(line: 320, column: 42, scope: !12)
!109 = !DILocation(line: 321, column: 44, scope: !12)
!110 = !DILocation(line: 321, column: 50, scope: !12)
!111 = !DILocation(line: 321, column: 13, scope: !12)
!112 = !DILocation(line: 321, column: 42, scope: !12)
!113 = !DILocation(line: 388, column: 33, scope: !12)
!114 = !DILocation(line: 388, column: 45, scope: !12)
!115 = !DILocation(line: 389, column: 33, scope: !12)
!116 = !DILocation(line: 388, column: 9, scope: !12)
!117 = !DILocation(line: 388, column: 7, scope: !12)
!118 = !DILocation(line: 390, column: 7, scope: !12)
!119 = !DILocation(line: 390, column: 11, scope: !12)
!120 = !DILocation(line: 392, column: 15, scope: !12)
!121 = !DILocation(line: 393, column: 7, scope: !12)
!122 = !DILocation(line: 414, column: 21, scope: !12)
!123 = !DILocation(line: 414, column: 27, scope: !12)
!124 = !DILocation(line: 414, column: 35, scope: !12)
!125 = !DILocation(line: 414, column: 47, scope: !12)
!126 = !DILocation(line: 414, column: 3, scope: !12)
!127 = !DILocation(line: 418, column: 14, scope: !12)
!128 = !DILocation(line: 418, column: 3, scope: !12)
!129 = !DILocation(line: 422, column: 3, scope: !12)
!130 = !DILocation(line: 422, column: 9, scope: !12)
!131 = !DILocation(line: 422, column: 13, scope: !12)
!132 = !DILocation(line: 422, column: 19, scope: !12)
!133 = !DILocation(line: 423, column: 11, scope: !12)
!134 = !DILocation(line: 423, column: 3, scope: !12)
!135 = !DILocation(line: 424, column: 5, scope: !12)
!136 = !DILocation(line: 427, column: 9, scope: !12)
!137 = !DILocation(line: 427, column: 15, scope: !12)
!138 = !DILocation(line: 427, column: 19, scope: !12)
!139 = !DILocation(line: 427, column: 28, scope: !12)
!140 = !DILocation(line: 428, column: 9, scope: !12)
!141 = !DILocation(line: 433, column: 9, scope: !12)
!142 = !DILocation(line: 433, column: 15, scope: !12)
!143 = !DILocation(line: 433, column: 19, scope: !12)
!144 = !DILocation(line: 433, column: 28, scope: !12)
!145 = !DILocation(line: 434, column: 9, scope: !12)
!146 = !DILocation(line: 434, column: 15, scope: !12)
!147 = !DILocation(line: 434, column: 19, scope: !12)
!148 = !DILocation(line: 434, column: 29, scope: !12)
!149 = !DILocation(line: 435, column: 9, scope: !12)
!150 = !DILocation(line: 447, column: 7, scope: !12)
!151 = !DILocation(line: 447, column: 14, scope: !12)
!152 = !DILocation(line: 449, column: 28, scope: !12)
!153 = !DILocation(line: 449, column: 34, scope: !12)
!154 = !DILocation(line: 449, column: 38, scope: !12)
!155 = !DILocation(line: 449, column: 8, scope: !12)
!156 = !DILocation(line: 449, column: 15, scope: !12)
!157 = !DILocation(line: 450, column: 5, scope: !12)
!158 = !DILocation(line: 454, column: 39, scope: !12)
!159 = !DILocation(line: 454, column: 19, scope: !12)
!160 = !DILocation(line: 454, column: 3, scope: !12)
!161 = !DILocation(line: 456, column: 3, scope: !12)
!162 = !DILocation(line: 462, column: 3, scope: !12)
!163 = !DILocation(line: 462, column: 9, scope: !12)
!164 = !DILocation(line: 462, column: 13, scope: !12)
!165 = !DILocation(line: 462, column: 19, scope: !12)
!166 = !DILocation(line: 464, column: 43, scope: !12)
!167 = !DILocation(line: 464, column: 23, scope: !12)
!168 = !DILocation(line: 464, column: 3, scope: !12)
!169 = !DILocation(line: 465, column: 10, scope: !12)
!170 = !DILocation(line: 465, column: 3, scope: !12)
!171 = !DILocation(line: 466, column: 1, scope: !12)
!172 = distinct !DISubprogram(name: "pthread_start", scope: !13, file: !13, line: 120, type: !14, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!173 = !DILocation(line: 122, column: 64, scope: !172)
!174 = !DILocation(line: 122, column: 36, scope: !172)
!175 = !DILocation(line: 122, column: 29, scope: !172)
!176 = !DILocation(line: 129, column: 7, scope: !172)
!177 = !DILocation(line: 129, column: 13, scope: !172)
!178 = !DILocation(line: 129, column: 17, scope: !172)
!179 = !DILocation(line: 129, column: 34, scope: !172)
!180 = !DILocation(line: 129, column: 40, scope: !172)
!181 = !DILocation(line: 129, column: 44, scope: !172)
!182 = !DILocation(line: 129, column: 32, scope: !172)
!183 = !DILocation(line: 131, column: 7, scope: !172)
!184 = !DILocation(line: 132, column: 5, scope: !172)
!185 = !DILocation(line: 139, column: 3, scope: !172)
!186 = !DILocation(line: 0, scope: !172)
!187 = !DILocation(line: 142, column: 3, scope: !172)
!188 = !DILocation(line: 142, column: 9, scope: !172)
!189 = !DILocation(line: 142, column: 20, scope: !172)
!190 = !DILocation(line: 142, column: 26, scope: !172)
!191 = !DILocation(line: 142, column: 30, scope: !172)
!192 = !DILocation(line: 142, column: 36, scope: !172)
!193 = !DILocation(line: 142, column: 45, scope: !172)
!194 = !DILocation(line: 142, column: 51, scope: !172)
!195 = !DILocation(line: 149, column: 3, scope: !172)
!196 = distinct !DISubprogram(name: "pthread_tcb_setup", scope: !13, file: !13, line: 90, type: !14, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!197 = !DILocation(line: 98, column: 11, scope: !196)
!198 = !DILocation(line: 98, column: 17, scope: !196)
!199 = !DILocation(line: 98, column: 21, scope: !196)
!200 = !DILocation(line: 98, column: 27, scope: !196)
!201 = !DILocation(line: 98, column: 35, scope: !196)
!202 = !DILocation(line: 98, column: 3, scope: !196)
!203 = !DILocation(line: 105, column: 22, scope: !196)
!204 = !DILocation(line: 105, column: 3, scope: !196)
!205 = !DILocation(line: 105, column: 9, scope: !196)
!206 = !DILocation(line: 105, column: 20, scope: !196)
!207 = !DILocation(line: 106, column: 22, scope: !196)
!208 = !DILocation(line: 106, column: 3, scope: !196)
!209 = !DILocation(line: 106, column: 9, scope: !196)
!210 = !DILocation(line: 106, column: 20, scope: !196)
!211 = !DILocation(line: 107, column: 1, scope: !196)
