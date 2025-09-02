; ModuleID = '/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_open.c'
source_filename = "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_open.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-unknown"

%struct.file_operations = type { i32 (%struct.file*)*, i32 (%struct.file*)*, i32 (%struct.file*, i8*, i32)*, i32 (%struct.file*, i8*, i32)*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.mm_map_entry_s*)*, i32 (%struct.file*, i64)*, i32 (%struct.file*, %struct.pollfd*, i1)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.inode*)* }
%struct.file = type { i32, i32, i64, %struct.inode*, i8*, i64, i8, i8 }
%struct.inode = type { %struct.inode*, %struct.inode*, %struct.inode*, i16, i16, %union.inode_ops_u, i16, i8*, [1 x i8] }
%union.inode_ops_u = type { %struct.file_operations* }
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
%struct.__va_list = type { i8* }
%struct.mqueue_inode_s = type { %struct.mqueue_cmn_s, %struct.inode*, %struct.list_node, i16, i16, i8, i32, %struct.sigevent, %struct.sigwork_s, [4 x %struct.pollfd*] }
%struct.mqueue_cmn_s = type { %struct.dq_queue_s, %struct.dq_queue_s, i16, i16 }
%struct.list_node = type { %struct.list_node*, %struct.list_node* }
%struct.sigevent = type { i8, i8, %union.sigval, %union.anon.0 }
%union.sigval = type { i32 }
%union.anon.0 = type { %struct.anon }
%struct.anon = type { void ([1 x i32])*, %struct.pthread_attr_s* }
%struct.pthread_attr_s = type { i8, i8, i8, i8, i8*, i32 }
%struct.sigwork_s = type { %struct.work_s, %union.sigval, void ([1 x i32])* }
%struct.work_s = type { %union.anon.1, void (i8*)*, i8*, %struct.kwork_wqueue_s* }
%union.anon.1 = type { %struct.wdog_s }
%struct.wdog_s = type { %struct.wdlist_node, i32, void (i32)*, i32 }
%struct.wdlist_node = type { %struct.wdlist_node*, %struct.wdlist_node* }
%struct.kwork_wqueue_s = type opaque
%struct.mq_attr = type { i32, i32, i32, i32 }
%struct.inode_search_s = type { i8*, %struct.inode*, %struct.inode*, %struct.inode*, i8*, i8*, i8 }

@.str = private unnamed_addr constant [15 x i8] c"/var/mqueue/%s\00", align 1
@g_nxmq_fileops = internal constant %struct.file_operations { i32 (%struct.file*)* null, i32 (%struct.file*)* @nxmq_file_close, i32 (%struct.file*, i8*, i32)* null, i32 (%struct.file*, i8*, i32)* null, i64 (%struct.file*, i64, i32)* null, i32 (%struct.file*, i32, i32)* null, i32 (%struct.file*, %struct.mm_map_entry_s*)* null, i32 (%struct.file*, i64)* null, i32 (%struct.file*, %struct.pollfd*, i1)* @nxmq_file_poll, i32 (%struct.file*, %struct.uio*)* null, i32 (%struct.file*, %struct.uio*)* null, i32 (%struct.inode*)* null }, align 4

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @file_mq_open(%struct.file* noundef %0, i8* noundef %1, i32 noundef %2, ...) #0 !dbg !12 {
  %4 = alloca %struct.file*, align 4
  %5 = alloca i8*, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list, align 4
  %8 = alloca i32, align 4
  store %struct.file* %0, %struct.file** %4, align 4
  store i8* %1, i8** %5, align 4
  store i32 %2, i32* %6, align 4
  %9 = bitcast %struct.__va_list* %7 to i8*, !dbg !16
  call void @llvm.va_start(i8* %9), !dbg !16
  %10 = load %struct.file*, %struct.file** %4, align 4, !dbg !17
  %11 = load i8*, i8** %5, align 4, !dbg !18
  %12 = load i32, i32* %6, align 4, !dbg !19
  %13 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %7, i32 0, i32 0, !dbg !20
  %14 = bitcast i8** %13 to [1 x i32]*, !dbg !20
  %15 = load [1 x i32], [1 x i32]* %14, align 4, !dbg !20
  %16 = call arm_aapcs_vfpcc i32 @file_mq_vopen(%struct.file* noundef %10, i8* noundef %11, i32 noundef %12, i32 noundef 0, [1 x i32] %15, i32* noundef null) #3, !dbg !20
  store i32 %16, i32* %8, align 4, !dbg !21
  %17 = bitcast %struct.__va_list* %7 to i8*, !dbg !22
  call void @llvm.va_end(i8* %17), !dbg !22
  %18 = load i32, i32* %8, align 4, !dbg !23
  ret i32 %18, !dbg !24
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #1

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc i32 @file_mq_vopen(%struct.file* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3, [1 x i32] %4, i32* noundef %5) #0 !dbg !25 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.__va_list, align 4
  %9 = alloca %struct.file*, align 4
  %10 = alloca i8*, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32*, align 4
  %14 = alloca %struct.inode*, align 4
  %15 = alloca %struct.mqueue_inode_s*, align 4
  %16 = alloca %struct.mq_attr*, align 4
  %17 = alloca %struct.inode_search_s, align 4
  %18 = alloca [64 x i8], align 1
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i16, align 2
  %23 = alloca i16, align 2
  %24 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %8, i32 0, i32 0
  %25 = bitcast i8** %24 to [1 x i32]*
  store [1 x i32] %4, [1 x i32]* %25, align 4
  store %struct.file* %0, %struct.file** %9, align 4
  store i8* %1, i8** %10, align 4
  store i32 %2, i32* %11, align 4
  store i32 %3, i32* %12, align 4
  store i32* %5, i32** %13, align 4
  store %struct.mq_attr* null, %struct.mq_attr** %16, align 4, !dbg !26
  store i32 0, i32* %20, align 4, !dbg !27
  %26 = load %struct.file*, %struct.file** %9, align 4, !dbg !28
  %27 = icmp ne %struct.file* %26, null, !dbg !28
  br i1 %27, label %28, label %36, !dbg !29

28:                                               ; preds = %6
  %29 = load i8*, i8** %10, align 4, !dbg !30
  %30 = icmp ne i8* %29, null, !dbg !30
  br i1 %30, label %31, label %36, !dbg !31

31:                                               ; preds = %28
  %32 = load i8*, i8** %10, align 4, !dbg !32
  %33 = load i8, i8* %32, align 1, !dbg !33
  %34 = zext i8 %33 to i32, !dbg !33
  %35 = icmp eq i32 %34, 0, !dbg !34
  br i1 %35, label %36, label %37, !dbg !35

36:                                               ; preds = %31, %28, %6
  store i32 -22, i32* %21, align 4, !dbg !36
  br label %219, !dbg !37

37:                                               ; preds = %31
  %38 = load i8*, i8** %10, align 4, !dbg !38
  %39 = call arm_aapcs_vfpcc i32 @strlen(i8* noundef %38) #3, !dbg !39
  %40 = add i32 13, %39, !dbg !40
  %41 = icmp uge i32 %40, 64, !dbg !41
  br i1 %41, label %42, label %43, !dbg !42

42:                                               ; preds = %37
  store i32 -36, i32* %21, align 4, !dbg !43
  br label %219, !dbg !44

43:                                               ; preds = %37
  %44 = load i32, i32* %11, align 4, !dbg !45
  %45 = and i32 %44, 4, !dbg !46
  %46 = icmp ne i32 %45, 0, !dbg !47
  br i1 %46, label %47, label %73, !dbg !48

47:                                               ; preds = %43
  %48 = bitcast %struct.__va_list* %8 to i8**, !dbg !49
  %49 = load i8*, i8** %48, align 4, !dbg !49
  %50 = getelementptr inbounds i8, i8* %49, i32 4, !dbg !49
  store i8* %50, i8** %48, align 4, !dbg !49
  %51 = bitcast i8* %49 to i32*, !dbg !49
  %52 = load i32, i32* %51, align 4, !dbg !49
  store i32 %52, i32* %20, align 4, !dbg !50
  %53 = bitcast %struct.__va_list* %8 to i8**, !dbg !51
  %54 = load i8*, i8** %53, align 4, !dbg !51
  %55 = getelementptr inbounds i8, i8* %54, i32 4, !dbg !51
  store i8* %55, i8** %53, align 4, !dbg !51
  %56 = bitcast i8* %54 to %struct.mq_attr**, !dbg !51
  %57 = load %struct.mq_attr*, %struct.mq_attr** %56, align 4, !dbg !51
  store %struct.mq_attr* %57, %struct.mq_attr** %16, align 4, !dbg !52
  %58 = load %struct.mq_attr*, %struct.mq_attr** %16, align 4, !dbg !53
  %59 = icmp ne %struct.mq_attr* %58, null, !dbg !54
  br i1 %59, label %60, label %72, !dbg !53

60:                                               ; preds = %47
  %61 = load %struct.mq_attr*, %struct.mq_attr** %16, align 4, !dbg !55
  %62 = getelementptr inbounds %struct.mq_attr, %struct.mq_attr* %61, i32 0, i32 0, !dbg !56
  %63 = load i32, i32* %62, align 4, !dbg !56
  %64 = icmp sle i32 %63, 0, !dbg !57
  br i1 %64, label %70, label %65, !dbg !58

65:                                               ; preds = %60
  %66 = load %struct.mq_attr*, %struct.mq_attr** %16, align 4, !dbg !59
  %67 = getelementptr inbounds %struct.mq_attr, %struct.mq_attr* %66, i32 0, i32 1, !dbg !60
  %68 = load i32, i32* %67, align 4, !dbg !60
  %69 = icmp sle i32 %68, 0, !dbg !61
  br i1 %69, label %70, label %71, !dbg !55

70:                                               ; preds = %65, %60
  store i32 -22, i32* %21, align 4, !dbg !62
  br label %219, !dbg !63

71:                                               ; preds = %65
  br label %72, !dbg !64

72:                                               ; preds = %71, %47
  br label %73, !dbg !65

73:                                               ; preds = %72, %43
  %74 = load i32, i32* %12, align 4, !dbg !66
  %75 = xor i32 %74, -1, !dbg !67
  %76 = load i32, i32* %20, align 4, !dbg !68
  %77 = and i32 %76, %75, !dbg !68
  store i32 %77, i32* %20, align 4, !dbg !68
  br label %78, !dbg !69

78:                                               ; preds = %83, %73
  %79 = load i8*, i8** %10, align 4, !dbg !70
  %80 = load i8, i8* %79, align 1, !dbg !71
  %81 = zext i8 %80 to i32, !dbg !71
  %82 = icmp eq i32 %81, 47, !dbg !72
  br i1 %82, label %83, label %86, !dbg !69

83:                                               ; preds = %78
  %84 = load i8*, i8** %10, align 4, !dbg !73
  %85 = getelementptr inbounds i8, i8* %84, i32 1, !dbg !73
  store i8* %85, i8** %10, align 4, !dbg !73
  br label %78, !dbg !69, !llvm.loop !74

86:                                               ; preds = %78
  %87 = getelementptr inbounds [64 x i8], [64 x i8]* %18, i32 0, i32 0, !dbg !77
  %88 = load i8*, i8** %10, align 4, !dbg !78
  %89 = call arm_aapcs_vfpcc i32 (i8*, i32, i8*, ...) @snprintf(i8* noundef %87, i32 noundef 64, i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* noundef %88) #3, !dbg !79
  %90 = call arm_aapcs_vfpcc i32 @up_irq_save() #3, !dbg !80
  store i32 %90, i32* %19, align 4, !dbg !81
  br label %91, !dbg !82

91:                                               ; preds = %86
  %92 = getelementptr inbounds [64 x i8], [64 x i8]* %18, i32 0, i32 0, !dbg !82
  %93 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 0, !dbg !82
  store i8* %92, i8** %93, align 4, !dbg !82
  %94 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 1, !dbg !82
  store %struct.inode* null, %struct.inode** %94, align 4, !dbg !82
  %95 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 2, !dbg !82
  store %struct.inode* null, %struct.inode** %95, align 4, !dbg !82
  %96 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 3, !dbg !82
  store %struct.inode* null, %struct.inode** %96, align 4, !dbg !82
  %97 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 4, !dbg !82
  store i8* null, i8** %97, align 4, !dbg !82
  %98 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 5, !dbg !82
  store i8* null, i8** %98, align 4, !dbg !82
  %99 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 6, !dbg !82
  store i8 0, i8* %99, align 4, !dbg !82
  br label %100, !dbg !82

100:                                              ; preds = %91
  %101 = call arm_aapcs_vfpcc i32 @inode_find(%struct.inode_search_s* noundef %17) #3, !dbg !83
  store i32 %101, i32* %21, align 4, !dbg !84
  %102 = load i32, i32* %21, align 4, !dbg !85
  %103 = icmp sge i32 %102, 0, !dbg !86
  br i1 %103, label %104, label %134, !dbg !85

104:                                              ; preds = %100
  %105 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 1, !dbg !87
  %106 = load %struct.inode*, %struct.inode** %105, align 4, !dbg !87
  store %struct.inode* %106, %struct.inode** %14, align 4, !dbg !88
  %107 = load %struct.inode*, %struct.inode** %14, align 4, !dbg !89
  %108 = getelementptr inbounds %struct.inode, %struct.inode* %107, i32 0, i32 4, !dbg !89
  %109 = load i16, i16* %108, align 2, !dbg !89
  %110 = zext i16 %109 to i32, !dbg !89
  %111 = and i32 %110, 15, !dbg !89
  %112 = icmp eq i32 %111, 5, !dbg !89
  br i1 %112, label %114, label %113, !dbg !90

113:                                              ; preds = %104
  store i32 -6, i32* %21, align 4, !dbg !91
  br label %205, !dbg !92

114:                                              ; preds = %104
  %115 = load i32, i32* %11, align 4, !dbg !93
  %116 = and i32 %115, 12, !dbg !94
  %117 = icmp eq i32 %116, 12, !dbg !95
  br i1 %117, label %118, label %119, !dbg !96

118:                                              ; preds = %114
  store i32 -17, i32* %21, align 4, !dbg !97
  br label %205, !dbg !98

119:                                              ; preds = %114
  %120 = load %struct.file*, %struct.file** %9, align 4, !dbg !99
  %121 = bitcast %struct.file* %120 to i8*, !dbg !99
  %122 = call arm_aapcs_vfpcc i8* @memset(i8* noundef %121, i32 noundef 0, i32 noundef 40) #3, !dbg !100
  %123 = load i32, i32* %11, align 4, !dbg !101
  %124 = load %struct.file*, %struct.file** %9, align 4, !dbg !102
  %125 = getelementptr inbounds %struct.file, %struct.file* %124, i32 0, i32 0, !dbg !103
  store i32 %123, i32* %125, align 8, !dbg !104
  %126 = load %struct.inode*, %struct.inode** %14, align 4, !dbg !105
  %127 = load %struct.file*, %struct.file** %9, align 4, !dbg !106
  %128 = getelementptr inbounds %struct.file, %struct.file* %127, i32 0, i32 3, !dbg !107
  store %struct.inode* %126, %struct.inode** %128, align 8, !dbg !108
  %129 = load i32*, i32** %13, align 4, !dbg !109
  %130 = icmp ne i32* %129, null, !dbg !109
  br i1 %130, label %131, label %133, !dbg !109

131:                                              ; preds = %119
  %132 = load i32*, i32** %13, align 4, !dbg !110
  store i32 1, i32* %132, align 4, !dbg !111
  br label %133, !dbg !112

133:                                              ; preds = %131, %119
  br label %193, !dbg !113

134:                                              ; preds = %100
  %135 = load i32, i32* %11, align 4, !dbg !114
  %136 = and i32 %135, 4, !dbg !115
  %137 = icmp eq i32 %136, 0, !dbg !116
  br i1 %137, label %138, label %139, !dbg !117

138:                                              ; preds = %134
  store i32 -2, i32* %21, align 4, !dbg !118
  br label %207, !dbg !119

139:                                              ; preds = %134
  call arm_aapcs_vfpcc void @inode_lock() #3, !dbg !120
  %140 = getelementptr inbounds [64 x i8], [64 x i8]* %18, i32 0, i32 0, !dbg !121
  %141 = load i32, i32* %20, align 4, !dbg !122
  %142 = call arm_aapcs_vfpcc i32 @inode_reserve(i8* noundef %140, i32 noundef %141, %struct.inode** noundef %14) #3, !dbg !123
  store i32 %142, i32* %21, align 4, !dbg !124
  call arm_aapcs_vfpcc void @inode_unlock() #3, !dbg !125
  %143 = load i32, i32* %21, align 4, !dbg !126
  %144 = icmp slt i32 %143, 0, !dbg !127
  br i1 %144, label %145, label %146, !dbg !126

145:                                              ; preds = %139
  br label %207, !dbg !128

146:                                              ; preds = %139
  %147 = load %struct.mq_attr*, %struct.mq_attr** %16, align 4, !dbg !129
  %148 = call arm_aapcs_vfpcc i32 @nxmq_alloc_msgq(%struct.mq_attr* noundef %147, %struct.mqueue_inode_s** noundef %15) #3, !dbg !130
  store i32 %148, i32* %21, align 4, !dbg !131
  %149 = load i32, i32* %21, align 4, !dbg !132
  %150 = icmp slt i32 %149, 0, !dbg !133
  br i1 %150, label %151, label %152, !dbg !132

151:                                              ; preds = %146
  br label %205, !dbg !134

152:                                              ; preds = %146
  %153 = load %struct.file*, %struct.file** %9, align 4, !dbg !135
  %154 = bitcast %struct.file* %153 to i8*, !dbg !135
  %155 = call arm_aapcs_vfpcc i8* @memset(i8* noundef %154, i32 noundef 0, i32 noundef 40) #3, !dbg !136
  %156 = load i32, i32* %11, align 4, !dbg !137
  %157 = load %struct.file*, %struct.file** %9, align 4, !dbg !138
  %158 = getelementptr inbounds %struct.file, %struct.file* %157, i32 0, i32 0, !dbg !139
  store i32 %156, i32* %158, align 8, !dbg !140
  %159 = load %struct.inode*, %struct.inode** %14, align 4, !dbg !141
  %160 = load %struct.file*, %struct.file** %9, align 4, !dbg !142
  %161 = getelementptr inbounds %struct.file, %struct.file* %160, i32 0, i32 3, !dbg !143
  store %struct.inode* %159, %struct.inode** %161, align 8, !dbg !144
  br label %162, !dbg !145

162:                                              ; preds = %152
  %163 = load %struct.inode*, %struct.inode** %14, align 4, !dbg !145
  %164 = getelementptr inbounds %struct.inode, %struct.inode* %163, i32 0, i32 4, !dbg !145
  %165 = load i16, i16* %164, align 2, !dbg !145
  %166 = zext i16 %165 to i32, !dbg !145
  %167 = and i32 %166, -16, !dbg !145
  %168 = or i32 %167, 5, !dbg !145
  %169 = trunc i32 %168 to i16, !dbg !145
  %170 = load %struct.inode*, %struct.inode** %14, align 4, !dbg !145
  %171 = getelementptr inbounds %struct.inode, %struct.inode* %170, i32 0, i32 4, !dbg !145
  store i16 %169, i16* %171, align 2, !dbg !145
  br label %172, !dbg !145

172:                                              ; preds = %162
  %173 = load %struct.inode*, %struct.inode** %14, align 4, !dbg !146
  %174 = getelementptr inbounds %struct.inode, %struct.inode* %173, i32 0, i32 5, !dbg !147
  %175 = bitcast %union.inode_ops_u* %174 to %struct.file_operations**, !dbg !148
  store %struct.file_operations* @g_nxmq_fileops, %struct.file_operations** %175, align 4, !dbg !149
  %176 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %15, align 4, !dbg !150
  %177 = bitcast %struct.mqueue_inode_s* %176 to i8*, !dbg !150
  %178 = load %struct.inode*, %struct.inode** %14, align 4, !dbg !151
  %179 = getelementptr inbounds %struct.inode, %struct.inode* %178, i32 0, i32 7, !dbg !152
  store i8* %177, i8** %179, align 4, !dbg !153
  %180 = load %struct.inode*, %struct.inode** %14, align 4, !dbg !154
  %181 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %15, align 4, !dbg !155
  %182 = getelementptr inbounds %struct.mqueue_inode_s, %struct.mqueue_inode_s* %181, i32 0, i32 1, !dbg !156
  store %struct.inode* %180, %struct.inode** %182, align 4, !dbg !157
  %183 = load %struct.inode*, %struct.inode** %14, align 4, !dbg !158
  %184 = getelementptr inbounds %struct.inode, %struct.inode* %183, i32 0, i32 3, !dbg !158
  store i16 1, i16* %22, align 2, !dbg !158
  %185 = load i16, i16* %22, align 2, !dbg !158
  %186 = atomicrmw add i16* %184, i16 %185 seq_cst, align 2, !dbg !158
  store i16 %186, i16* %23, align 2, !dbg !158
  %187 = load i16, i16* %23, align 2, !dbg !158
  %188 = load i32*, i32** %13, align 4, !dbg !159
  %189 = icmp ne i32* %188, null, !dbg !159
  br i1 %189, label %190, label %192, !dbg !159

190:                                              ; preds = %172
  %191 = load i32*, i32** %13, align 4, !dbg !160
  store i32 0, i32* %191, align 4, !dbg !161
  br label %192, !dbg !162

192:                                              ; preds = %190, %172
  br label %193

193:                                              ; preds = %192, %133
  br label %194, !dbg !163

194:                                              ; preds = %193
  %195 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 5, !dbg !163
  %196 = load i8*, i8** %195, align 4, !dbg !163
  %197 = icmp ne i8* %196, null, !dbg !163
  br i1 %197, label %198, label %202, !dbg !163

198:                                              ; preds = %194
  %199 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 5, !dbg !163
  %200 = load i8*, i8** %199, align 4, !dbg !163
  call arm_aapcs_vfpcc void @free(i8* noundef %200) #3, !dbg !163
  %201 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 5, !dbg !163
  store i8* null, i8** %201, align 4, !dbg !163
  br label %202, !dbg !163

202:                                              ; preds = %198, %194
  br label %203, !dbg !163

203:                                              ; preds = %202
  %204 = load i32, i32* %19, align 4, !dbg !164
  call arm_aapcs_vfpcc void @up_irq_restore(i32 noundef %204) #3, !dbg !164
  store i32 0, i32* %7, align 4, !dbg !165
  br label %221, !dbg !165

205:                                              ; preds = %151, %118, %113
  %206 = load %struct.inode*, %struct.inode** %14, align 4, !dbg !166
  call arm_aapcs_vfpcc void @inode_release(%struct.inode* noundef %206) #3, !dbg !167
  br label %207, !dbg !167

207:                                              ; preds = %205, %145, %138
  br label %208, !dbg !168

208:                                              ; preds = %207
  %209 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 5, !dbg !168
  %210 = load i8*, i8** %209, align 4, !dbg !168
  %211 = icmp ne i8* %210, null, !dbg !168
  br i1 %211, label %212, label %216, !dbg !168

212:                                              ; preds = %208
  %213 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 5, !dbg !168
  %214 = load i8*, i8** %213, align 4, !dbg !168
  call arm_aapcs_vfpcc void @free(i8* noundef %214) #3, !dbg !168
  %215 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %17, i32 0, i32 5, !dbg !168
  store i8* null, i8** %215, align 4, !dbg !168
  br label %216, !dbg !168

216:                                              ; preds = %212, %208
  br label %217, !dbg !168

217:                                              ; preds = %216
  %218 = load i32, i32* %19, align 4, !dbg !169
  call arm_aapcs_vfpcc void @up_irq_restore(i32 noundef %218) #3, !dbg !169
  br label %219, !dbg !169

219:                                              ; preds = %217, %70, %42, %36
  %220 = load i32, i32* %21, align 4, !dbg !170
  store i32 %220, i32* %7, align 4, !dbg !171
  br label %221, !dbg !171

221:                                              ; preds = %219, %203
  %222 = load i32, i32* %7, align 4, !dbg !172
  ret i32 %222, !dbg !172
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #1

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @nxmq_open(i8* noundef %0, i32 noundef %1, ...) #0 !dbg !173 {
  %3 = alloca i8*, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.__va_list, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 4
  store i32 %1, i32* %4, align 4
  %7 = bitcast %struct.__va_list* %5 to i8*, !dbg !174
  call void @llvm.va_start(i8* %7), !dbg !174
  %8 = load i8*, i8** %3, align 4, !dbg !175
  %9 = load i32, i32* %4, align 4, !dbg !176
  %10 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %5, i32 0, i32 0, !dbg !177
  %11 = bitcast i8** %10 to [1 x i32]*, !dbg !177
  %12 = load [1 x i32], [1 x i32]* %11, align 4, !dbg !177
  %13 = call arm_aapcs_vfpcc i32 @nxmq_vopen(i8* noundef %8, i32 noundef %9, [1 x i32] %12) #3, !dbg !177
  store i32 %13, i32* %6, align 4, !dbg !178
  %14 = bitcast %struct.__va_list* %5 to i8*, !dbg !179
  call void @llvm.va_end(i8* %14), !dbg !179
  %15 = load i32, i32* %6, align 4, !dbg !180
  ret i32 %15, !dbg !181
}

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc i32 @nxmq_vopen(i8* noundef %0, i32 noundef %1, [1 x i32] %2) #0 !dbg !182 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.__va_list, align 4
  %6 = alloca i8*, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.file, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %5, i32 0, i32 0
  %12 = bitcast i8** %11 to [1 x i32]*
  store [1 x i32] %2, [1 x i32]* %12, align 4
  store i8* %0, i8** %6, align 4
  store i32 %1, i32* %7, align 4
  %13 = load i8*, i8** %6, align 4, !dbg !183
  %14 = load i32, i32* %7, align 4, !dbg !184
  %15 = call arm_aapcs_vfpcc i32 @getumask() #3, !dbg !185
  %16 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %5, i32 0, i32 0, !dbg !186
  %17 = bitcast i8** %16 to [1 x i32]*, !dbg !186
  %18 = load [1 x i32], [1 x i32]* %17, align 4, !dbg !186
  %19 = call arm_aapcs_vfpcc i32 @file_mq_vopen(%struct.file* noundef %8, i8* noundef %13, i32 noundef %14, i32 noundef %15, [1 x i32] %18, i32* noundef %9) #3, !dbg !186
  store i32 %19, i32* %10, align 4, !dbg !187
  %20 = load i32, i32* %10, align 4, !dbg !188
  %21 = icmp slt i32 %20, 0, !dbg !189
  br i1 %21, label %22, label %24, !dbg !188

22:                                               ; preds = %3
  %23 = load i32, i32* %10, align 4, !dbg !190
  store i32 %23, i32* %4, align 4, !dbg !191
  br label %46, !dbg !191

24:                                               ; preds = %3
  %25 = getelementptr inbounds %struct.file, %struct.file* %8, i32 0, i32 3, !dbg !192
  %26 = load %struct.inode*, %struct.inode** %25, align 8, !dbg !192
  %27 = getelementptr inbounds %struct.file, %struct.file* %8, i32 0, i32 0, !dbg !193
  %28 = load i32, i32* %27, align 8, !dbg !193
  %29 = getelementptr inbounds %struct.file, %struct.file* %8, i32 0, i32 2, !dbg !194
  %30 = load i64, i64* %29, align 8, !dbg !194
  %31 = getelementptr inbounds %struct.file, %struct.file* %8, i32 0, i32 4, !dbg !195
  %32 = load i8*, i8** %31, align 4, !dbg !195
  %33 = call arm_aapcs_vfpcc i32 @file_allocate(%struct.inode* noundef %26, i32 noundef %28, i64 noundef %30, i8* noundef %32, i32 noundef 0, i1 noundef zeroext false) #3, !dbg !196
  store i32 %33, i32* %10, align 4, !dbg !197
  %34 = load i32, i32* %10, align 4, !dbg !198
  %35 = icmp slt i32 %34, 0, !dbg !199
  br i1 %35, label %36, label %44, !dbg !198

36:                                               ; preds = %24
  %37 = call arm_aapcs_vfpcc i32 @file_mq_close(%struct.file* noundef %8) #3, !dbg !200
  %38 = load i32, i32* %9, align 4, !dbg !201
  %39 = icmp ne i32 %38, 0, !dbg !201
  br i1 %39, label %40, label %43, !dbg !201

40:                                               ; preds = %36
  %41 = load i8*, i8** %6, align 4, !dbg !202
  %42 = call arm_aapcs_vfpcc i32 @file_mq_unlink(i8* noundef %41) #3, !dbg !203
  br label %43, !dbg !204

43:                                               ; preds = %40, %36
  br label %44, !dbg !205

44:                                               ; preds = %43, %24
  %45 = load i32, i32* %10, align 4, !dbg !206
  store i32 %45, i32* %4, align 4, !dbg !207
  br label %46, !dbg !207

46:                                               ; preds = %44, %22
  %47 = load i32, i32* %4, align 4, !dbg !208
  ret i32 %47, !dbg !208
}

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @mq_open(i8* noundef %0, i32 noundef %1, ...) #0 !dbg !209 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.__va_list, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %4, align 4
  store i32 %1, i32* %5, align 4
  %8 = bitcast %struct.__va_list* %6 to i8*, !dbg !210
  call void @llvm.va_start(i8* %8), !dbg !210
  %9 = load i8*, i8** %4, align 4, !dbg !211
  %10 = load i32, i32* %5, align 4, !dbg !212
  %11 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %6, i32 0, i32 0, !dbg !213
  %12 = bitcast i8** %11 to [1 x i32]*, !dbg !213
  %13 = load [1 x i32], [1 x i32]* %12, align 4, !dbg !213
  %14 = call arm_aapcs_vfpcc i32 @nxmq_vopen(i8* noundef %9, i32 noundef %10, [1 x i32] %13) #3, !dbg !213
  store i32 %14, i32* %7, align 4, !dbg !214
  %15 = bitcast %struct.__va_list* %6 to i8*, !dbg !215
  call void @llvm.va_end(i8* %15), !dbg !215
  %16 = load i32, i32* %7, align 4, !dbg !216
  %17 = icmp slt i32 %16, 0, !dbg !217
  br i1 %17, label %18, label %24, !dbg !216

18:                                               ; preds = %2
  br label %19, !dbg !218

19:                                               ; preds = %18
  %20 = load i32, i32* %7, align 4, !dbg !218
  %21 = sub nsw i32 0, %20, !dbg !218
  %22 = call arm_aapcs_vfpcc i32* @__errno() #3, !dbg !218
  store i32 %21, i32* %22, align 4, !dbg !218
  br label %23, !dbg !218

23:                                               ; preds = %19
  store i32 -1, i32* %3, align 4, !dbg !219
  br label %26, !dbg !219

24:                                               ; preds = %2
  %25 = load i32, i32* %7, align 4, !dbg !220
  store i32 %25, i32* %3, align 4, !dbg !221
  br label %26, !dbg !221

26:                                               ; preds = %24, %23
  %27 = load i32, i32* %3, align 4, !dbg !222
  ret i32 %27, !dbg !222
}

declare dso_local arm_aapcs_vfpcc i32* @__errno() #2

declare dso_local arm_aapcs_vfpcc i32 @strlen(i8* noundef) #2

declare dso_local arm_aapcs_vfpcc i32 @snprintf(i8* noundef, i32 noundef, i8* noundef, ...) #2

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc i32 @up_irq_save() #0 !dbg !223 {
  %1 = alloca i32, align 4
  %2 = call i32 asm sideeffect "\09mrs    $0, cpsr\0A\09cpsid  i\0A", "=r,~{memory}"() #4, !dbg !225, !srcloc !226
  store i32 %2, i32* %1, align 4, !dbg !225
  %3 = load i32, i32* %1, align 4, !dbg !227
  ret i32 %3, !dbg !228
}

declare dso_local arm_aapcs_vfpcc i32 @inode_find(%struct.inode_search_s* noundef) #2

declare dso_local arm_aapcs_vfpcc i8* @memset(i8* noundef, i32 noundef, i32 noundef) #2

declare dso_local arm_aapcs_vfpcc void @inode_lock() #2

declare dso_local arm_aapcs_vfpcc i32 @inode_reserve(i8* noundef, i32 noundef, %struct.inode** noundef) #2

declare dso_local arm_aapcs_vfpcc void @inode_unlock() #2

declare dso_local arm_aapcs_vfpcc i32 @nxmq_alloc_msgq(%struct.mq_attr* noundef, %struct.mqueue_inode_s** noundef) #2

declare dso_local arm_aapcs_vfpcc void @free(i8* noundef) #2

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc void @up_irq_restore(i32 noundef %0) #0 !dbg !229 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4, !dbg !230
  call void asm sideeffect "msr    cpsr_c, $0", "r,~{memory}"(i32 %3) #4, !dbg !231, !srcloc !232
  ret void, !dbg !233
}

declare dso_local arm_aapcs_vfpcc void @inode_release(%struct.inode* noundef) #2

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc i32 @nxmq_file_close(%struct.file* noundef %0) #0 !dbg !234 {
  %2 = alloca %struct.file*, align 4
  %3 = alloca %struct.inode*, align 4
  %4 = alloca i16, align 2
  %5 = alloca %struct.mqueue_inode_s*, align 4
  store %struct.file* %0, %struct.file** %2, align 4
  %6 = load %struct.file*, %struct.file** %2, align 4, !dbg !235
  %7 = getelementptr inbounds %struct.file, %struct.file* %6, i32 0, i32 3, !dbg !236
  %8 = load %struct.inode*, %struct.inode** %7, align 8, !dbg !236
  store %struct.inode* %8, %struct.inode** %3, align 4, !dbg !237
  %9 = load %struct.inode*, %struct.inode** %3, align 4, !dbg !238
  %10 = getelementptr inbounds %struct.inode, %struct.inode* %9, i32 0, i32 3, !dbg !238
  %11 = load atomic i16, i16* %10 seq_cst, align 4, !dbg !238
  store i16 %11, i16* %4, align 2, !dbg !238
  %12 = load i16, i16* %4, align 2, !dbg !238
  %13 = sext i16 %12 to i32, !dbg !238
  %14 = icmp sle i32 %13, 0, !dbg !239
  br i1 %14, label %15, label %27, !dbg !238

15:                                               ; preds = %1
  %16 = load %struct.inode*, %struct.inode** %3, align 4, !dbg !240
  %17 = getelementptr inbounds %struct.inode, %struct.inode* %16, i32 0, i32 7, !dbg !241
  %18 = load i8*, i8** %17, align 4, !dbg !241
  %19 = bitcast i8* %18 to %struct.mqueue_inode_s*, !dbg !240
  store %struct.mqueue_inode_s* %19, %struct.mqueue_inode_s** %5, align 4, !dbg !242
  %20 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %5, align 4, !dbg !243
  %21 = icmp ne %struct.mqueue_inode_s* %20, null, !dbg !243
  br i1 %21, label %22, label %26, !dbg !243

22:                                               ; preds = %15
  %23 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %5, align 4, !dbg !244
  call arm_aapcs_vfpcc void @nxmq_free_msgq(%struct.mqueue_inode_s* noundef %23) #3, !dbg !245
  %24 = load %struct.inode*, %struct.inode** %3, align 4, !dbg !246
  %25 = getelementptr inbounds %struct.inode, %struct.inode* %24, i32 0, i32 7, !dbg !247
  store i8* null, i8** %25, align 4, !dbg !248
  br label %26, !dbg !249

26:                                               ; preds = %22, %15
  br label %27, !dbg !250

27:                                               ; preds = %26, %1
  ret i32 0, !dbg !251
}

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc i32 @nxmq_file_poll(%struct.file* noundef %0, %struct.pollfd* noundef %1, i1 noundef zeroext %2) #0 !dbg !252 {
  %4 = alloca %struct.file*, align 4
  %5 = alloca %struct.pollfd*, align 4
  %6 = alloca i8, align 1
  %7 = alloca %struct.inode*, align 4
  %8 = alloca %struct.mqueue_inode_s*, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.file* %0, %struct.file** %4, align 4
  store %struct.pollfd* %1, %struct.pollfd** %5, align 4
  %13 = zext i1 %2 to i8
  store i8 %13, i8* %6, align 1
  %14 = load %struct.file*, %struct.file** %4, align 4, !dbg !253
  %15 = getelementptr inbounds %struct.file, %struct.file* %14, i32 0, i32 3, !dbg !254
  %16 = load %struct.inode*, %struct.inode** %15, align 8, !dbg !254
  store %struct.inode* %16, %struct.inode** %7, align 4, !dbg !255
  %17 = load %struct.inode*, %struct.inode** %7, align 4, !dbg !256
  %18 = getelementptr inbounds %struct.inode, %struct.inode* %17, i32 0, i32 7, !dbg !257
  %19 = load i8*, i8** %18, align 4, !dbg !257
  %20 = bitcast i8* %19 to %struct.mqueue_inode_s*, !dbg !256
  store %struct.mqueue_inode_s* %20, %struct.mqueue_inode_s** %8, align 4, !dbg !258
  store i32 0, i32* %9, align 4, !dbg !259
  store i32 0, i32* %11, align 4, !dbg !260
  %21 = call arm_aapcs_vfpcc i32 @up_irq_save() #3, !dbg !261
  store i32 %21, i32* %10, align 4, !dbg !262
  %22 = load i8, i8* %6, align 1, !dbg !263
  %23 = trunc i8 %22 to i1, !dbg !263
  br i1 %23, label %24, label %82, !dbg !263

24:                                               ; preds = %3
  store i32 0, i32* %12, align 4, !dbg !264
  br label %25, !dbg !265

25:                                               ; preds = %49, %24
  %26 = load i32, i32* %12, align 4, !dbg !266
  %27 = icmp slt i32 %26, 4, !dbg !267
  br i1 %27, label %28, label %52, !dbg !268

28:                                               ; preds = %25
  %29 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %8, align 4, !dbg !269
  %30 = getelementptr inbounds %struct.mqueue_inode_s, %struct.mqueue_inode_s* %29, i32 0, i32 9, !dbg !270
  %31 = load i32, i32* %12, align 4, !dbg !271
  %32 = getelementptr inbounds [4 x %struct.pollfd*], [4 x %struct.pollfd*]* %30, i32 0, i32 %31, !dbg !269
  %33 = load %struct.pollfd*, %struct.pollfd** %32, align 4, !dbg !269
  %34 = icmp eq %struct.pollfd* %33, null, !dbg !272
  br i1 %34, label %35, label %48, !dbg !269

35:                                               ; preds = %28
  %36 = load %struct.pollfd*, %struct.pollfd** %5, align 4, !dbg !273
  %37 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %8, align 4, !dbg !274
  %38 = getelementptr inbounds %struct.mqueue_inode_s, %struct.mqueue_inode_s* %37, i32 0, i32 9, !dbg !275
  %39 = load i32, i32* %12, align 4, !dbg !276
  %40 = getelementptr inbounds [4 x %struct.pollfd*], [4 x %struct.pollfd*]* %38, i32 0, i32 %39, !dbg !274
  store %struct.pollfd* %36, %struct.pollfd** %40, align 4, !dbg !277
  %41 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %8, align 4, !dbg !278
  %42 = getelementptr inbounds %struct.mqueue_inode_s, %struct.mqueue_inode_s* %41, i32 0, i32 9, !dbg !279
  %43 = load i32, i32* %12, align 4, !dbg !280
  %44 = getelementptr inbounds [4 x %struct.pollfd*], [4 x %struct.pollfd*]* %42, i32 0, i32 %43, !dbg !278
  %45 = bitcast %struct.pollfd** %44 to i8*, !dbg !281
  %46 = load %struct.pollfd*, %struct.pollfd** %5, align 4, !dbg !282
  %47 = getelementptr inbounds %struct.pollfd, %struct.pollfd* %46, i32 0, i32 5, !dbg !283
  store i8* %45, i8** %47, align 4, !dbg !284
  br label %52, !dbg !285

48:                                               ; preds = %28
  br label %49, !dbg !286

49:                                               ; preds = %48
  %50 = load i32, i32* %12, align 4, !dbg !287
  %51 = add nsw i32 %50, 1, !dbg !287
  store i32 %51, i32* %12, align 4, !dbg !287
  br label %25, !dbg !268, !llvm.loop !288

52:                                               ; preds = %35, %25
  %53 = load i32, i32* %12, align 4, !dbg !289
  %54 = icmp sge i32 %53, 4, !dbg !290
  br i1 %54, label %55, label %58, !dbg !289

55:                                               ; preds = %52
  %56 = load %struct.pollfd*, %struct.pollfd** %5, align 4, !dbg !291
  %57 = getelementptr inbounds %struct.pollfd, %struct.pollfd* %56, i32 0, i32 5, !dbg !292
  store i8* null, i8** %57, align 4, !dbg !293
  store i32 -16, i32* %11, align 4, !dbg !294
  br label %113, !dbg !295

58:                                               ; preds = %52
  %59 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %8, align 4, !dbg !296
  %60 = getelementptr inbounds %struct.mqueue_inode_s, %struct.mqueue_inode_s* %59, i32 0, i32 4, !dbg !297
  %61 = load i16, i16* %60, align 2, !dbg !297
  %62 = sext i16 %61 to i32, !dbg !296
  %63 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %8, align 4, !dbg !298
  %64 = getelementptr inbounds %struct.mqueue_inode_s, %struct.mqueue_inode_s* %63, i32 0, i32 3, !dbg !299
  %65 = load i16, i16* %64, align 4, !dbg !299
  %66 = sext i16 %65 to i32, !dbg !298
  %67 = icmp slt i32 %62, %66, !dbg !300
  br i1 %67, label %68, label %71, !dbg !296

68:                                               ; preds = %58
  %69 = load i32, i32* %9, align 4, !dbg !301
  %70 = or i32 %69, 4, !dbg !301
  store i32 %70, i32* %9, align 4, !dbg !301
  br label %71, !dbg !302

71:                                               ; preds = %68, %58
  %72 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %8, align 4, !dbg !303
  %73 = getelementptr inbounds %struct.mqueue_inode_s, %struct.mqueue_inode_s* %72, i32 0, i32 4, !dbg !304
  %74 = load i16, i16* %73, align 2, !dbg !304
  %75 = sext i16 %74 to i32, !dbg !303
  %76 = icmp sgt i32 %75, 0, !dbg !305
  br i1 %76, label %77, label %80, !dbg !303

77:                                               ; preds = %71
  %78 = load i32, i32* %9, align 4, !dbg !306
  %79 = or i32 %78, 1, !dbg !306
  store i32 %79, i32* %9, align 4, !dbg !306
  br label %80, !dbg !307

80:                                               ; preds = %77, %71
  %81 = load i32, i32* %9, align 4, !dbg !308
  call arm_aapcs_vfpcc void @poll_notify(%struct.pollfd** noundef %5, i32 noundef 1, i32 noundef %81) #3, !dbg !309
  br label %112, !dbg !310

82:                                               ; preds = %3
  %83 = load %struct.pollfd*, %struct.pollfd** %5, align 4, !dbg !311
  %84 = getelementptr inbounds %struct.pollfd, %struct.pollfd* %83, i32 0, i32 5, !dbg !312
  %85 = load i8*, i8** %84, align 4, !dbg !312
  %86 = icmp ne i8* %85, null, !dbg !313
  br i1 %86, label %87, label %111, !dbg !311

87:                                               ; preds = %82
  store i32 0, i32* %12, align 4, !dbg !314
  br label %88, !dbg !315

88:                                               ; preds = %107, %87
  %89 = load i32, i32* %12, align 4, !dbg !316
  %90 = icmp slt i32 %89, 4, !dbg !317
  br i1 %90, label %91, label %110, !dbg !318

91:                                               ; preds = %88
  %92 = load %struct.pollfd*, %struct.pollfd** %5, align 4, !dbg !319
  %93 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %8, align 4, !dbg !320
  %94 = getelementptr inbounds %struct.mqueue_inode_s, %struct.mqueue_inode_s* %93, i32 0, i32 9, !dbg !321
  %95 = load i32, i32* %12, align 4, !dbg !322
  %96 = getelementptr inbounds [4 x %struct.pollfd*], [4 x %struct.pollfd*]* %94, i32 0, i32 %95, !dbg !320
  %97 = load %struct.pollfd*, %struct.pollfd** %96, align 4, !dbg !320
  %98 = icmp eq %struct.pollfd* %92, %97, !dbg !323
  br i1 %98, label %99, label %106, !dbg !319

99:                                               ; preds = %91
  %100 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %8, align 4, !dbg !324
  %101 = getelementptr inbounds %struct.mqueue_inode_s, %struct.mqueue_inode_s* %100, i32 0, i32 9, !dbg !325
  %102 = load i32, i32* %12, align 4, !dbg !326
  %103 = getelementptr inbounds [4 x %struct.pollfd*], [4 x %struct.pollfd*]* %101, i32 0, i32 %102, !dbg !324
  store %struct.pollfd* null, %struct.pollfd** %103, align 4, !dbg !327
  %104 = load %struct.pollfd*, %struct.pollfd** %5, align 4, !dbg !328
  %105 = getelementptr inbounds %struct.pollfd, %struct.pollfd* %104, i32 0, i32 5, !dbg !329
  store i8* null, i8** %105, align 4, !dbg !330
  br label %110, !dbg !331

106:                                              ; preds = %91
  br label %107, !dbg !332

107:                                              ; preds = %106
  %108 = load i32, i32* %12, align 4, !dbg !333
  %109 = add nsw i32 %108, 1, !dbg !333
  store i32 %109, i32* %12, align 4, !dbg !333
  br label %88, !dbg !318, !llvm.loop !334

110:                                              ; preds = %99, %88
  br label %111, !dbg !335

111:                                              ; preds = %110, %82
  br label %112

112:                                              ; preds = %111, %80
  br label %113, !dbg !263

113:                                              ; preds = %112, %55
  %114 = load i32, i32* %10, align 4, !dbg !336
  call arm_aapcs_vfpcc void @up_irq_restore(i32 noundef %114) #3, !dbg !336
  %115 = load i32, i32* %11, align 4, !dbg !337
  ret i32 %115, !dbg !338
}

declare dso_local arm_aapcs_vfpcc void @nxmq_free_msgq(%struct.mqueue_inode_s* noundef) #2

declare dso_local arm_aapcs_vfpcc void @poll_notify(%struct.pollfd** noundef, i32 noundef, i32 noundef) #2

declare dso_local arm_aapcs_vfpcc i32 @getumask() #2

declare dso_local arm_aapcs_vfpcc i32 @file_allocate(%struct.inode* noundef, i32 noundef, i64 noundef, i8* noundef, i32 noundef, i1 noundef zeroext) #2

declare dso_local arm_aapcs_vfpcc i32 @file_mq_close(%struct.file* noundef) #2

declare dso_local arm_aapcs_vfpcc i32 @file_mq_unlink(i8* noundef) #2

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #3 = { nobuiltin "no-builtins" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_open.c", directory: "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/mq_open/Compile", checksumkind: CSK_MD5, checksum: "748a71f31b83cda6834f97e750d33b7e")
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
!12 = distinct !DISubprogram(name: "file_mq_open", scope: !13, file: !13, line: 413, type: !14, scopeLine: 415, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_open.c", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "748a71f31b83cda6834f97e750d33b7e")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 419, column: 3, scope: !12)
!17 = !DILocation(line: 420, column: 23, scope: !12)
!18 = !DILocation(line: 420, column: 27, scope: !12)
!19 = !DILocation(line: 420, column: 36, scope: !12)
!20 = !DILocation(line: 420, column: 9, scope: !12)
!21 = !DILocation(line: 420, column: 7, scope: !12)
!22 = !DILocation(line: 421, column: 3, scope: !12)
!23 = !DILocation(line: 423, column: 10, scope: !12)
!24 = !DILocation(line: 423, column: 3, scope: !12)
!25 = distinct !DISubprogram(name: "file_mq_vopen", scope: !13, file: !13, line: 160, type: !14, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!26 = !DILocation(line: 166, column: 23, scope: !25)
!27 = !DILocation(line: 170, column: 10, scope: !25)
!28 = !DILocation(line: 175, column: 8, scope: !25)
!29 = !DILocation(line: 175, column: 11, scope: !25)
!30 = !DILocation(line: 175, column: 15, scope: !25)
!31 = !DILocation(line: 175, column: 23, scope: !25)
!32 = !DILocation(line: 175, column: 27, scope: !25)
!33 = !DILocation(line: 175, column: 26, scope: !25)
!34 = !DILocation(line: 175, column: 35, scope: !25)
!35 = !DILocation(line: 175, column: 7, scope: !25)
!36 = !DILocation(line: 177, column: 11, scope: !25)
!37 = !DILocation(line: 178, column: 7, scope: !25)
!38 = !DILocation(line: 181, column: 54, scope: !25)
!39 = !DILocation(line: 181, column: 47, scope: !25)
!40 = !DILocation(line: 181, column: 45, scope: !25)
!41 = !DILocation(line: 182, column: 7, scope: !25)
!42 = !DILocation(line: 181, column: 7, scope: !25)
!43 = !DILocation(line: 184, column: 11, scope: !25)
!44 = !DILocation(line: 185, column: 7, scope: !25)
!45 = !DILocation(line: 190, column: 8, scope: !25)
!46 = !DILocation(line: 190, column: 15, scope: !25)
!47 = !DILocation(line: 190, column: 26, scope: !25)
!48 = !DILocation(line: 190, column: 7, scope: !25)
!49 = !DILocation(line: 196, column: 14, scope: !25)
!50 = !DILocation(line: 196, column: 12, scope: !25)
!51 = !DILocation(line: 197, column: 14, scope: !25)
!52 = !DILocation(line: 197, column: 12, scope: !25)
!53 = !DILocation(line: 198, column: 11, scope: !25)
!54 = !DILocation(line: 198, column: 16, scope: !25)
!55 = !DILocation(line: 200, column: 15, scope: !25)
!56 = !DILocation(line: 200, column: 21, scope: !25)
!57 = !DILocation(line: 200, column: 31, scope: !25)
!58 = !DILocation(line: 200, column: 36, scope: !25)
!59 = !DILocation(line: 200, column: 39, scope: !25)
!60 = !DILocation(line: 200, column: 45, scope: !25)
!61 = !DILocation(line: 200, column: 56, scope: !25)
!62 = !DILocation(line: 202, column: 19, scope: !25)
!63 = !DILocation(line: 203, column: 15, scope: !25)
!64 = !DILocation(line: 205, column: 9, scope: !25)
!65 = !DILocation(line: 206, column: 5, scope: !25)
!66 = !DILocation(line: 208, column: 12, scope: !25)
!67 = !DILocation(line: 208, column: 11, scope: !25)
!68 = !DILocation(line: 208, column: 8, scope: !25)
!69 = !DILocation(line: 214, column: 3, scope: !25)
!70 = !DILocation(line: 214, column: 11, scope: !25)
!71 = !DILocation(line: 214, column: 10, scope: !25)
!72 = !DILocation(line: 214, column: 19, scope: !25)
!73 = !DILocation(line: 216, column: 14, scope: !25)
!74 = distinct !{!74, !69, !75, !76}
!75 = !DILocation(line: 217, column: 5, scope: !25)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 221, column: 12, scope: !25)
!78 = !DILocation(line: 222, column: 45, scope: !25)
!79 = !DILocation(line: 221, column: 3, scope: !25)
!80 = !DILocation(line: 231, column: 11, scope: !25)
!81 = !DILocation(line: 231, column: 9, scope: !25)
!82 = !DILocation(line: 238, column: 3, scope: !25)
!83 = !DILocation(line: 240, column: 9, scope: !25)
!84 = !DILocation(line: 240, column: 7, scope: !25)
!85 = !DILocation(line: 241, column: 7, scope: !25)
!86 = !DILocation(line: 241, column: 11, scope: !25)
!87 = !DILocation(line: 245, column: 20, scope: !25)
!88 = !DILocation(line: 245, column: 13, scope: !25)
!89 = !DILocation(line: 249, column: 12, scope: !25)
!90 = !DILocation(line: 249, column: 11, scope: !25)
!91 = !DILocation(line: 251, column: 15, scope: !25)
!92 = !DILocation(line: 252, column: 11, scope: !25)
!93 = !DILocation(line: 259, column: 12, scope: !25)
!94 = !DILocation(line: 259, column: 19, scope: !25)
!95 = !DILocation(line: 259, column: 41, scope: !25)
!96 = !DILocation(line: 259, column: 11, scope: !25)
!97 = !DILocation(line: 261, column: 15, scope: !25)
!98 = !DILocation(line: 262, column: 11, scope: !25)
!99 = !DILocation(line: 267, column: 14, scope: !25)
!100 = !DILocation(line: 267, column: 7, scope: !25)
!101 = !DILocation(line: 268, column: 22, scope: !25)
!102 = !DILocation(line: 268, column: 7, scope: !25)
!103 = !DILocation(line: 268, column: 11, scope: !25)
!104 = !DILocation(line: 268, column: 20, scope: !25)
!105 = !DILocation(line: 269, column: 22, scope: !25)
!106 = !DILocation(line: 269, column: 7, scope: !25)
!107 = !DILocation(line: 269, column: 11, scope: !25)
!108 = !DILocation(line: 269, column: 20, scope: !25)
!109 = !DILocation(line: 271, column: 11, scope: !25)
!110 = !DILocation(line: 273, column: 12, scope: !25)
!111 = !DILocation(line: 273, column: 20, scope: !25)
!112 = !DILocation(line: 274, column: 9, scope: !25)
!113 = !DILocation(line: 275, column: 5, scope: !25)
!114 = !DILocation(line: 280, column: 12, scope: !25)
!115 = !DILocation(line: 280, column: 19, scope: !25)
!116 = !DILocation(line: 280, column: 30, scope: !25)
!117 = !DILocation(line: 280, column: 11, scope: !25)
!118 = !DILocation(line: 284, column: 15, scope: !25)
!119 = !DILocation(line: 285, column: 11, scope: !25)
!120 = !DILocation(line: 290, column: 7, scope: !25)
!121 = !DILocation(line: 291, column: 27, scope: !25)
!122 = !DILocation(line: 291, column: 37, scope: !25)
!123 = !DILocation(line: 291, column: 13, scope: !25)
!124 = !DILocation(line: 291, column: 11, scope: !25)
!125 = !DILocation(line: 292, column: 7, scope: !25)
!126 = !DILocation(line: 294, column: 11, scope: !25)
!127 = !DILocation(line: 294, column: 15, scope: !25)
!128 = !DILocation(line: 296, column: 11, scope: !25)
!129 = !DILocation(line: 303, column: 29, scope: !25)
!130 = !DILocation(line: 303, column: 13, scope: !25)
!131 = !DILocation(line: 303, column: 11, scope: !25)
!132 = !DILocation(line: 304, column: 11, scope: !25)
!133 = !DILocation(line: 304, column: 15, scope: !25)
!134 = !DILocation(line: 306, column: 11, scope: !25)
!135 = !DILocation(line: 311, column: 14, scope: !25)
!136 = !DILocation(line: 311, column: 7, scope: !25)
!137 = !DILocation(line: 312, column: 22, scope: !25)
!138 = !DILocation(line: 312, column: 7, scope: !25)
!139 = !DILocation(line: 312, column: 11, scope: !25)
!140 = !DILocation(line: 312, column: 20, scope: !25)
!141 = !DILocation(line: 313, column: 22, scope: !25)
!142 = !DILocation(line: 313, column: 7, scope: !25)
!143 = !DILocation(line: 313, column: 11, scope: !25)
!144 = !DILocation(line: 313, column: 20, scope: !25)
!145 = !DILocation(line: 315, column: 7, scope: !25)
!146 = !DILocation(line: 316, column: 7, scope: !25)
!147 = !DILocation(line: 316, column: 14, scope: !25)
!148 = !DILocation(line: 316, column: 16, scope: !25)
!149 = !DILocation(line: 316, column: 25, scope: !25)
!150 = !DILocation(line: 317, column: 27, scope: !25)
!151 = !DILocation(line: 317, column: 7, scope: !25)
!152 = !DILocation(line: 317, column: 14, scope: !25)
!153 = !DILocation(line: 317, column: 25, scope: !25)
!154 = !DILocation(line: 318, column: 27, scope: !25)
!155 = !DILocation(line: 318, column: 7, scope: !25)
!156 = !DILocation(line: 318, column: 13, scope: !25)
!157 = !DILocation(line: 318, column: 25, scope: !25)
!158 = !DILocation(line: 322, column: 7, scope: !25)
!159 = !DILocation(line: 324, column: 11, scope: !25)
!160 = !DILocation(line: 326, column: 12, scope: !25)
!161 = !DILocation(line: 326, column: 20, scope: !25)
!162 = !DILocation(line: 327, column: 9, scope: !25)
!163 = !DILocation(line: 330, column: 3, scope: !25)
!164 = !DILocation(line: 331, column: 3, scope: !25)
!165 = !DILocation(line: 335, column: 3, scope: !25)
!166 = !DILocation(line: 338, column: 17, scope: !25)
!167 = !DILocation(line: 338, column: 3, scope: !25)
!168 = !DILocation(line: 341, column: 3, scope: !25)
!169 = !DILocation(line: 342, column: 3, scope: !25)
!170 = !DILocation(line: 345, column: 10, scope: !25)
!171 = !DILocation(line: 345, column: 3, scope: !25)
!172 = !DILocation(line: 346, column: 1, scope: !25)
!173 = distinct !DISubprogram(name: "nxmq_open", scope: !13, file: !13, line: 460, type: !14, scopeLine: 461, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!174 = !DILocation(line: 465, column: 3, scope: !173)
!175 = !DILocation(line: 466, column: 20, scope: !173)
!176 = !DILocation(line: 466, column: 29, scope: !173)
!177 = !DILocation(line: 466, column: 9, scope: !173)
!178 = !DILocation(line: 466, column: 7, scope: !173)
!179 = !DILocation(line: 467, column: 3, scope: !173)
!180 = !DILocation(line: 469, column: 10, scope: !173)
!181 = !DILocation(line: 469, column: 3, scope: !173)
!182 = distinct !DISubprogram(name: "nxmq_vopen", scope: !13, file: !13, line: 348, type: !14, scopeLine: 349, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!183 = !DILocation(line: 354, column: 28, scope: !182)
!184 = !DILocation(line: 354, column: 37, scope: !182)
!185 = !DILocation(line: 354, column: 45, scope: !182)
!186 = !DILocation(line: 354, column: 9, scope: !182)
!187 = !DILocation(line: 354, column: 7, scope: !182)
!188 = !DILocation(line: 355, column: 7, scope: !182)
!189 = !DILocation(line: 355, column: 11, scope: !182)
!190 = !DILocation(line: 357, column: 14, scope: !182)
!191 = !DILocation(line: 357, column: 7, scope: !182)
!192 = !DILocation(line: 360, column: 26, scope: !182)
!193 = !DILocation(line: 360, column: 38, scope: !182)
!194 = !DILocation(line: 361, column: 26, scope: !182)
!195 = !DILocation(line: 361, column: 36, scope: !182)
!196 = !DILocation(line: 360, column: 9, scope: !182)
!197 = !DILocation(line: 360, column: 7, scope: !182)
!198 = !DILocation(line: 362, column: 7, scope: !182)
!199 = !DILocation(line: 362, column: 11, scope: !182)
!200 = !DILocation(line: 364, column: 7, scope: !182)
!201 = !DILocation(line: 365, column: 11, scope: !182)
!202 = !DILocation(line: 367, column: 26, scope: !182)
!203 = !DILocation(line: 367, column: 11, scope: !182)
!204 = !DILocation(line: 368, column: 9, scope: !182)
!205 = !DILocation(line: 369, column: 5, scope: !182)
!206 = !DILocation(line: 371, column: 10, scope: !182)
!207 = !DILocation(line: 371, column: 3, scope: !182)
!208 = !DILocation(line: 372, column: 1, scope: !182)
!209 = distinct !DISubprogram(name: "mq_open", scope: !13, file: !13, line: 501, type: !14, scopeLine: 502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!210 = !DILocation(line: 506, column: 3, scope: !209)
!211 = !DILocation(line: 507, column: 20, scope: !209)
!212 = !DILocation(line: 507, column: 29, scope: !209)
!213 = !DILocation(line: 507, column: 9, scope: !209)
!214 = !DILocation(line: 507, column: 7, scope: !209)
!215 = !DILocation(line: 508, column: 3, scope: !209)
!216 = !DILocation(line: 509, column: 7, scope: !209)
!217 = !DILocation(line: 509, column: 11, scope: !209)
!218 = !DILocation(line: 511, column: 7, scope: !209)
!219 = !DILocation(line: 512, column: 7, scope: !209)
!220 = !DILocation(line: 515, column: 10, scope: !209)
!221 = !DILocation(line: 515, column: 3, scope: !209)
!222 = !DILocation(line: 516, column: 1, scope: !209)
!223 = distinct !DISubprogram(name: "up_irq_save", scope: !224, file: !224, line: 361, type: !14, scopeLine: 362, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!224 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/include/arch/armv7-a/irq.h", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "f164bb56e8d3e6e7ccbccd5294d765f4")
!225 = !DILocation(line: 365, column: 3, scope: !223)
!226 = !{i64 663226, i64 663318}
!227 = !DILocation(line: 378, column: 10, scope: !223)
!228 = !DILocation(line: 378, column: 3, scope: !223)
!229 = distinct !DISubprogram(name: "up_irq_restore", scope: !224, file: !224, line: 425, type: !14, scopeLine: 426, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!230 = !DILocation(line: 431, column: 14, scope: !229)
!231 = !DILocation(line: 427, column: 3, scope: !229)
!232 = !{i64 664243}
!233 = !DILocation(line: 434, column: 1, scope: !229)
!234 = distinct !DISubprogram(name: "nxmq_file_close", scope: !13, file: !13, line: 75, type: !14, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!235 = !DILocation(line: 77, column: 29, scope: !234)
!236 = !DILocation(line: 77, column: 36, scope: !234)
!237 = !DILocation(line: 77, column: 21, scope: !234)
!238 = !DILocation(line: 79, column: 7, scope: !234)
!239 = !DILocation(line: 79, column: 36, scope: !234)
!240 = !DILocation(line: 81, column: 41, scope: !234)
!241 = !DILocation(line: 81, column: 48, scope: !234)
!242 = !DILocation(line: 81, column: 34, scope: !234)
!243 = !DILocation(line: 83, column: 11, scope: !234)
!244 = !DILocation(line: 85, column: 26, scope: !234)
!245 = !DILocation(line: 85, column: 11, scope: !234)
!246 = !DILocation(line: 86, column: 11, scope: !234)
!247 = !DILocation(line: 86, column: 18, scope: !234)
!248 = !DILocation(line: 86, column: 28, scope: !234)
!249 = !DILocation(line: 87, column: 9, scope: !234)
!250 = !DILocation(line: 88, column: 5, scope: !234)
!251 = !DILocation(line: 90, column: 3, scope: !234)
!252 = distinct !DISubprogram(name: "nxmq_file_poll", scope: !13, file: !13, line: 93, type: !14, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!253 = !DILocation(line: 96, column: 29, scope: !252)
!254 = !DILocation(line: 96, column: 36, scope: !252)
!255 = !DILocation(line: 96, column: 21, scope: !252)
!256 = !DILocation(line: 97, column: 37, scope: !252)
!257 = !DILocation(line: 97, column: 44, scope: !252)
!258 = !DILocation(line: 97, column: 30, scope: !252)
!259 = !DILocation(line: 98, column: 15, scope: !252)
!260 = !DILocation(line: 100, column: 7, scope: !252)
!261 = !DILocation(line: 103, column: 11, scope: !252)
!262 = !DILocation(line: 103, column: 9, scope: !252)
!263 = !DILocation(line: 105, column: 7, scope: !252)
!264 = !DILocation(line: 107, column: 14, scope: !252)
!265 = !DILocation(line: 107, column: 12, scope: !252)
!266 = !DILocation(line: 107, column: 19, scope: !252)
!267 = !DILocation(line: 107, column: 21, scope: !252)
!268 = !DILocation(line: 107, column: 7, scope: !252)
!269 = !DILocation(line: 111, column: 15, scope: !252)
!270 = !DILocation(line: 111, column: 21, scope: !252)
!271 = !DILocation(line: 111, column: 25, scope: !252)
!272 = !DILocation(line: 111, column: 28, scope: !252)
!273 = !DILocation(line: 115, column: 30, scope: !252)
!274 = !DILocation(line: 115, column: 15, scope: !252)
!275 = !DILocation(line: 115, column: 21, scope: !252)
!276 = !DILocation(line: 115, column: 25, scope: !252)
!277 = !DILocation(line: 115, column: 28, scope: !252)
!278 = !DILocation(line: 116, column: 31, scope: !252)
!279 = !DILocation(line: 116, column: 37, scope: !252)
!280 = !DILocation(line: 116, column: 41, scope: !252)
!281 = !DILocation(line: 116, column: 30, scope: !252)
!282 = !DILocation(line: 116, column: 15, scope: !252)
!283 = !DILocation(line: 116, column: 20, scope: !252)
!284 = !DILocation(line: 116, column: 28, scope: !252)
!285 = !DILocation(line: 117, column: 15, scope: !252)
!286 = !DILocation(line: 119, column: 9, scope: !252)
!287 = !DILocation(line: 107, column: 55, scope: !252)
!288 = distinct !{!288, !268, !286, !76}
!289 = !DILocation(line: 121, column: 11, scope: !252)
!290 = !DILocation(line: 121, column: 13, scope: !252)
!291 = !DILocation(line: 123, column: 11, scope: !252)
!292 = !DILocation(line: 123, column: 16, scope: !252)
!293 = !DILocation(line: 123, column: 21, scope: !252)
!294 = !DILocation(line: 124, column: 21, scope: !252)
!295 = !DILocation(line: 125, column: 11, scope: !252)
!296 = !DILocation(line: 130, column: 11, scope: !252)
!297 = !DILocation(line: 130, column: 17, scope: !252)
!298 = !DILocation(line: 130, column: 25, scope: !252)
!299 = !DILocation(line: 130, column: 31, scope: !252)
!300 = !DILocation(line: 130, column: 23, scope: !252)
!301 = !DILocation(line: 132, column: 20, scope: !252)
!302 = !DILocation(line: 133, column: 9, scope: !252)
!303 = !DILocation(line: 135, column: 11, scope: !252)
!304 = !DILocation(line: 135, column: 17, scope: !252)
!305 = !DILocation(line: 135, column: 23, scope: !252)
!306 = !DILocation(line: 137, column: 20, scope: !252)
!307 = !DILocation(line: 138, column: 9, scope: !252)
!308 = !DILocation(line: 140, column: 28, scope: !252)
!309 = !DILocation(line: 140, column: 7, scope: !252)
!310 = !DILocation(line: 141, column: 5, scope: !252)
!311 = !DILocation(line: 142, column: 12, scope: !252)
!312 = !DILocation(line: 142, column: 17, scope: !252)
!313 = !DILocation(line: 142, column: 22, scope: !252)
!314 = !DILocation(line: 144, column: 14, scope: !252)
!315 = !DILocation(line: 144, column: 12, scope: !252)
!316 = !DILocation(line: 144, column: 19, scope: !252)
!317 = !DILocation(line: 144, column: 21, scope: !252)
!318 = !DILocation(line: 144, column: 7, scope: !252)
!319 = !DILocation(line: 146, column: 15, scope: !252)
!320 = !DILocation(line: 146, column: 22, scope: !252)
!321 = !DILocation(line: 146, column: 28, scope: !252)
!322 = !DILocation(line: 146, column: 32, scope: !252)
!323 = !DILocation(line: 146, column: 19, scope: !252)
!324 = !DILocation(line: 148, column: 15, scope: !252)
!325 = !DILocation(line: 148, column: 21, scope: !252)
!326 = !DILocation(line: 148, column: 25, scope: !252)
!327 = !DILocation(line: 148, column: 28, scope: !252)
!328 = !DILocation(line: 149, column: 15, scope: !252)
!329 = !DILocation(line: 149, column: 20, scope: !252)
!330 = !DILocation(line: 149, column: 25, scope: !252)
!331 = !DILocation(line: 150, column: 15, scope: !252)
!332 = !DILocation(line: 152, column: 9, scope: !252)
!333 = !DILocation(line: 144, column: 55, scope: !252)
!334 = distinct !{!334, !318, !332, !76}
!335 = !DILocation(line: 153, column: 5, scope: !252)
!336 = !DILocation(line: 156, column: 3, scope: !252)
!337 = !DILocation(line: 157, column: 10, scope: !252)
!338 = !DILocation(line: 157, column: 3, scope: !252)
