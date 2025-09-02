; ModuleID = '/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_open.c'
source_filename = "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_open.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-unknown"

%struct.dq_queue_s = type { %struct.dq_entry_s*, %struct.dq_entry_s* }
%struct.dq_entry_s = type { %struct.dq_entry_s*, %struct.dq_entry_s* }
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
%struct.pollfd = type opaque
%struct.uio = type { %struct.iovec*, i32 }
%struct.iovec = type { i8*, i32 }
%struct.__va_list = type { i8* }
%struct.inode_search_s = type { i8*, %struct.inode*, %struct.inode*, %struct.inode*, i8*, i8*, i8 }
%struct.mountpt_operations = type { i32 (%struct.file*, i8*, i32, i32)*, i32 (%struct.file*)*, i32 (%struct.file*, i8*, i32)*, i32 (%struct.file*, i8*, i32)*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.mm_map_entry_s*)*, i32 (%struct.file*, i64)*, i32 (%struct.file*, %struct.pollfd*, i1)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*)*, i32 (%struct.file*, %struct.file*)*, i32 (%struct.file*, %struct.stat*)*, i32 (%struct.file*, %struct.stat*, i32)*, i32 (%struct.inode*, i8*, %struct.fs_dirent_s**)*, i32 (%struct.inode*, %struct.fs_dirent_s*)*, i32 (%struct.inode*, %struct.fs_dirent_s*, %struct.dirent*)*, i32 (%struct.inode*, %struct.fs_dirent_s*)*, i32 (%struct.inode*, i8*, i8**)*, i32 (i8*, %struct.inode**, i32)*, i32 (%struct.inode*, %struct.statfs*)*, i32 (%struct.inode*, i8*)*, i32 (%struct.inode*, i8*, i32)*, i32 (%struct.inode*, i8*)*, i32 (%struct.inode*, i8*, i8*)*, i32 (%struct.inode*, i8*, %struct.stat*)*, i32 (%struct.inode*, i8*, %struct.stat*, i32)*, i32 (%struct.inode*)* }
%struct.stat = type { i32, i16, i32, i16, i32, i32, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i16, i64 }
%struct.timespec = type { i32, i32 }
%struct.fs_dirent_s = type { %struct.inode*, i8* }
%struct.dirent = type { i8, [33 x i8] }
%struct.statfs = type opaque
%struct.tcb_s = type { %struct.tcb_s*, %struct.tcb_s*, %struct.task_group_s*, %struct.sq_entry_s, %struct.sq_queue_s, %struct.sq_entry_s, %struct.sem_s, i8*, i32, i8, i8, void ()*, %union.entry_u, i8, i32, i16, i16, i32, %struct.wdog_s, i32, i8*, i8*, i8*, %struct.sigset_s, %struct.sigset_s, %struct.sq_queue_s, %struct.sq_queue_s, %struct.siginfo*, %struct.pthread_mutex_s*, %struct.xcptcontext, void (%struct.tcb_s*)*, [32 x i8] }
%union.entry_u = type { i8* (i8*)* }
%struct.wdog_s = type { %struct.wdlist_node, i32, void (i32)*, i32 }
%struct.wdlist_node = type { %struct.wdlist_node*, %struct.wdlist_node* }
%struct.siginfo = type { i8, i8, i8, %union.sigval, i32, i32, i8* }
%union.sigval = type { i32 }
%struct.pthread_mutex_s = type { %struct.pthread_mutex_s*, i8, i8, %struct.rmutex_s }
%struct.xcptcontext = type { i32*, i32* }

@g_readytorun = external dso_local global %struct.dq_queue_s, align 4
@.str = private unnamed_addr constant [74 x i8] c"/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_open.c\00", align 1

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @file_open(%struct.file* noundef %0, i8* noundef %1, i32 noundef %2, ...) #0 !dbg !12 {
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
  %16 = call arm_aapcs_vfpcc i32 @file_vopen(%struct.file* noundef %10, i8* noundef %11, i32 noundef %12, i32 noundef 0, [1 x i32] %15) #4, !dbg !20
  store i32 %16, i32* %8, align 4, !dbg !21
  %17 = bitcast %struct.__va_list* %7 to i8*, !dbg !22
  call void @llvm.va_end(i8* %17), !dbg !22
  %18 = load i32, i32* %8, align 4, !dbg !23
  %19 = icmp sge i32 %18, 0, !dbg !24
  br i1 %19, label %20, label %21, !dbg !23

20:                                               ; preds = %3
  br label %21, !dbg !25

21:                                               ; preds = %20, %3
  %22 = load i32, i32* %8, align 4, !dbg !26
  ret i32 %22, !dbg !27
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #1

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc i32 @file_vopen(%struct.file* noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3, [1 x i32] %4) #0 !dbg !28 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list, align 4
  %8 = alloca %struct.file*, align 4
  %9 = alloca i8*, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.inode_search_s, align 4
  %13 = alloca %struct.inode*, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %7, i32 0, i32 0
  %17 = bitcast i8** %16 to [1 x i32]*
  store [1 x i32] %4, [1 x i32]* %17, align 4
  store %struct.file* %0, %struct.file** %8, align 4
  store i8* %1, i8** %9, align 4
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store i32 438, i32* %14, align 4, !dbg !29
  %18 = load i8*, i8** %9, align 4, !dbg !30
  %19 = icmp eq i8* %18, null, !dbg !31
  br i1 %19, label %20, label %21, !dbg !30

20:                                               ; preds = %5
  store i32 -22, i32* %6, align 4, !dbg !32
  br label %213, !dbg !32

21:                                               ; preds = %5
  %22 = load i32, i32* %10, align 4, !dbg !33
  %23 = and i32 %22, 4, !dbg !34
  %24 = icmp ne i32 %23, 0, !dbg !35
  br i1 %24, label %25, label %31, !dbg !36

25:                                               ; preds = %21
  %26 = bitcast %struct.__va_list* %7 to i8**, !dbg !37
  %27 = load i8*, i8** %26, align 4, !dbg !37
  %28 = getelementptr inbounds i8, i8* %27, i32 4, !dbg !37
  store i8* %28, i8** %26, align 4, !dbg !37
  %29 = bitcast i8* %27 to i32*, !dbg !37
  %30 = load i32, i32* %29, align 4, !dbg !37
  store i32 %30, i32* %14, align 4, !dbg !38
  br label %31, !dbg !39

31:                                               ; preds = %25, %21
  %32 = load i32, i32* %11, align 4, !dbg !40
  %33 = xor i32 %32, -1, !dbg !41
  %34 = load i32, i32* %14, align 4, !dbg !42
  %35 = and i32 %34, %33, !dbg !42
  store i32 %35, i32* %14, align 4, !dbg !42
  br label %36, !dbg !43

36:                                               ; preds = %31
  %37 = load i8*, i8** %9, align 4, !dbg !43
  %38 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 0, !dbg !43
  store i8* %37, i8** %38, align 4, !dbg !43
  %39 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 1, !dbg !43
  store %struct.inode* null, %struct.inode** %39, align 4, !dbg !43
  %40 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 2, !dbg !43
  store %struct.inode* null, %struct.inode** %40, align 4, !dbg !43
  %41 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 3, !dbg !43
  store %struct.inode* null, %struct.inode** %41, align 4, !dbg !43
  %42 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 4, !dbg !43
  store i8* null, i8** %42, align 4, !dbg !43
  %43 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 5, !dbg !43
  store i8* null, i8** %43, align 4, !dbg !43
  %44 = load i32, i32* %10, align 4, !dbg !43
  %45 = and i32 %44, 4096, !dbg !43
  %46 = icmp ne i32 %45, 0, !dbg !43
  %47 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 6, !dbg !43
  %48 = zext i1 %46 to i8, !dbg !43
  store i8 %48, i8* %47, align 4, !dbg !43
  br label %49, !dbg !43

49:                                               ; preds = %36
  %50 = call arm_aapcs_vfpcc i32 @inode_find(%struct.inode_search_s* noundef %12) #4, !dbg !44
  store i32 %50, i32* %15, align 4, !dbg !45
  %51 = load i32, i32* %15, align 4, !dbg !46
  %52 = icmp slt i32 %51, 0, !dbg !47
  br i1 %52, label %53, label %58, !dbg !46

53:                                               ; preds = %49
  %54 = load i32, i32* %15, align 4, !dbg !48
  %55 = icmp slt i32 %54, 0, !dbg !49
  br i1 %55, label %56, label %57, !dbg !48

56:                                               ; preds = %53
  br label %201, !dbg !50

57:                                               ; preds = %53
  br label %58, !dbg !51

58:                                               ; preds = %57, %49
  %59 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 1, !dbg !52
  %60 = load %struct.inode*, %struct.inode** %59, align 4, !dbg !52
  store %struct.inode* %60, %struct.inode** %13, align 4, !dbg !53
  %61 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !54
  %62 = icmp ne %struct.inode* %61, null, !dbg !54
  %63 = xor i1 %62, true, !dbg !54
  %64 = xor i1 %63, true, !dbg !54
  %65 = xor i1 %64, true, !dbg !54
  br i1 %65, label %66, label %68, !dbg !54

66:                                               ; preds = %58
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @.str, i32 0, i32 0), i32 noundef 177, i8* noundef null) #5, !dbg !54
  unreachable, !dbg !54

67:                                               ; No predecessors!
  br label %69, !dbg !54

68:                                               ; preds = %58
  br label %69, !dbg !54

69:                                               ; preds = %68, %67
  %70 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 6, !dbg !55
  %71 = load i8, i8* %70, align 4, !dbg !55
  %72 = trunc i8 %71 to i1, !dbg !55
  br i1 %72, label %73, label %81, !dbg !56

73:                                               ; preds = %69
  %74 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !57
  %75 = getelementptr inbounds %struct.inode, %struct.inode* %74, i32 0, i32 4, !dbg !57
  %76 = load i16, i16* %75, align 2, !dbg !57
  %77 = zext i16 %76 to i32, !dbg !57
  %78 = and i32 %77, 15, !dbg !57
  %79 = icmp eq i32 %78, 8, !dbg !57
  br i1 %79, label %80, label %81, !dbg !58

80:                                               ; preds = %73
  store i32 -40, i32* %6, align 4, !dbg !59
  br label %213, !dbg !59

81:                                               ; preds = %73, %69
  %82 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !60
  %83 = load i32, i32* %10, align 4, !dbg !61
  %84 = call arm_aapcs_vfpcc i32 @inode_checkflags(%struct.inode* noundef %82, i32 noundef %83) #4, !dbg !62
  store i32 %84, i32* %15, align 4, !dbg !63
  %85 = load i32, i32* %15, align 4, !dbg !64
  %86 = icmp slt i32 %85, 0, !dbg !65
  br i1 %86, label %87, label %88, !dbg !64

87:                                               ; preds = %81
  br label %197, !dbg !66

88:                                               ; preds = %81
  %89 = load %struct.file*, %struct.file** %8, align 4, !dbg !67
  %90 = bitcast %struct.file* %89 to i8*, !dbg !67
  %91 = call arm_aapcs_vfpcc i8* @memset(i8* noundef %90, i32 noundef 0, i32 noundef 40) #4, !dbg !68
  %92 = load i32, i32* %10, align 4, !dbg !69
  %93 = load %struct.file*, %struct.file** %8, align 4, !dbg !70
  %94 = getelementptr inbounds %struct.file, %struct.file* %93, i32 0, i32 0, !dbg !71
  store i32 %92, i32* %94, align 8, !dbg !72
  %95 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !73
  %96 = load %struct.file*, %struct.file** %8, align 4, !dbg !74
  %97 = getelementptr inbounds %struct.file, %struct.file* %96, i32 0, i32 3, !dbg !75
  store %struct.inode* %95, %struct.inode** %97, align 8, !dbg !76
  %98 = load i32, i32* %10, align 4, !dbg !77
  %99 = and i32 %98, 2048, !dbg !78
  %100 = icmp ne i32 %99, 0, !dbg !78
  br i1 %100, label %101, label %106, !dbg !77

101:                                              ; preds = %88
  %102 = load %struct.file*, %struct.file** %8, align 4, !dbg !79
  %103 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 4, !dbg !80
  %104 = load i8*, i8** %103, align 4, !dbg !80
  %105 = call arm_aapcs_vfpcc i32 @dir_allocate(%struct.file* noundef %102, i8* noundef %104) #4, !dbg !81
  store i32 %105, i32* %15, align 4, !dbg !82
  br label %170, !dbg !83

106:                                              ; preds = %88
  %107 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !84
  %108 = getelementptr inbounds %struct.inode, %struct.inode* %107, i32 0, i32 4, !dbg !84
  %109 = load i16, i16* %108, align 2, !dbg !84
  %110 = zext i16 %109 to i32, !dbg !84
  %111 = and i32 %110, 15, !dbg !84
  %112 = icmp eq i32 %111, 3, !dbg !84
  br i1 %112, label %113, label %135, !dbg !84

113:                                              ; preds = %106
  %114 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !85
  %115 = getelementptr inbounds %struct.inode, %struct.inode* %114, i32 0, i32 5, !dbg !86
  %116 = bitcast %union.inode_ops_u* %115 to %struct.mountpt_operations**, !dbg !87
  %117 = load %struct.mountpt_operations*, %struct.mountpt_operations** %116, align 4, !dbg !87
  %118 = getelementptr inbounds %struct.mountpt_operations, %struct.mountpt_operations* %117, i32 0, i32 0, !dbg !88
  %119 = load i32 (%struct.file*, i8*, i32, i32)*, i32 (%struct.file*, i8*, i32, i32)** %118, align 4, !dbg !88
  %120 = icmp ne i32 (%struct.file*, i8*, i32, i32)* %119, null, !dbg !89
  br i1 %120, label %121, label %134, !dbg !85

121:                                              ; preds = %113
  %122 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !90
  %123 = getelementptr inbounds %struct.inode, %struct.inode* %122, i32 0, i32 5, !dbg !91
  %124 = bitcast %union.inode_ops_u* %123 to %struct.mountpt_operations**, !dbg !92
  %125 = load %struct.mountpt_operations*, %struct.mountpt_operations** %124, align 4, !dbg !92
  %126 = getelementptr inbounds %struct.mountpt_operations, %struct.mountpt_operations* %125, i32 0, i32 0, !dbg !93
  %127 = load i32 (%struct.file*, i8*, i32, i32)*, i32 (%struct.file*, i8*, i32, i32)** %126, align 4, !dbg !93
  %128 = load %struct.file*, %struct.file** %8, align 4, !dbg !94
  %129 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 4, !dbg !95
  %130 = load i8*, i8** %129, align 4, !dbg !95
  %131 = load i32, i32* %10, align 4, !dbg !96
  %132 = load i32, i32* %14, align 4, !dbg !97
  %133 = call arm_aapcs_vfpcc i32 %127(%struct.file* noundef %128, i8* noundef %130, i32 noundef %131, i32 noundef %132) #4, !dbg !90
  store i32 %133, i32* %15, align 4, !dbg !98
  br label %134, !dbg !99

134:                                              ; preds = %121, %113
  br label %169, !dbg !100

135:                                              ; preds = %106
  %136 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !101
  %137 = getelementptr inbounds %struct.inode, %struct.inode* %136, i32 0, i32 4, !dbg !101
  %138 = load i16, i16* %137, align 2, !dbg !101
  %139 = zext i16 %138 to i32, !dbg !101
  %140 = and i32 %139, 15, !dbg !101
  %141 = icmp eq i32 %140, 1, !dbg !101
  br i1 %141, label %149, label %142, !dbg !102

142:                                              ; preds = %135
  %143 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !103
  %144 = getelementptr inbounds %struct.inode, %struct.inode* %143, i32 0, i32 4, !dbg !103
  %145 = load i16, i16* %144, align 2, !dbg !103
  %146 = zext i16 %145 to i32, !dbg !103
  %147 = and i32 %146, 15, !dbg !103
  %148 = icmp eq i32 %147, 10, !dbg !103
  br i1 %148, label %149, label %167, !dbg !101

149:                                              ; preds = %142, %135
  %150 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !104
  %151 = getelementptr inbounds %struct.inode, %struct.inode* %150, i32 0, i32 5, !dbg !105
  %152 = bitcast %union.inode_ops_u* %151 to %struct.file_operations**, !dbg !106
  %153 = load %struct.file_operations*, %struct.file_operations** %152, align 4, !dbg !106
  %154 = getelementptr inbounds %struct.file_operations, %struct.file_operations* %153, i32 0, i32 0, !dbg !107
  %155 = load i32 (%struct.file*)*, i32 (%struct.file*)** %154, align 4, !dbg !107
  %156 = icmp ne i32 (%struct.file*)* %155, null, !dbg !108
  br i1 %156, label %157, label %166, !dbg !104

157:                                              ; preds = %149
  %158 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !109
  %159 = getelementptr inbounds %struct.inode, %struct.inode* %158, i32 0, i32 5, !dbg !110
  %160 = bitcast %union.inode_ops_u* %159 to %struct.file_operations**, !dbg !111
  %161 = load %struct.file_operations*, %struct.file_operations** %160, align 4, !dbg !111
  %162 = getelementptr inbounds %struct.file_operations, %struct.file_operations* %161, i32 0, i32 0, !dbg !112
  %163 = load i32 (%struct.file*)*, i32 (%struct.file*)** %162, align 4, !dbg !112
  %164 = load %struct.file*, %struct.file** %8, align 4, !dbg !113
  %165 = call arm_aapcs_vfpcc i32 %163(%struct.file* noundef %164) #4, !dbg !109
  store i32 %165, i32* %15, align 4, !dbg !114
  br label %166, !dbg !115

166:                                              ; preds = %157, %149
  br label %168, !dbg !116

167:                                              ; preds = %142
  store i32 -6, i32* %15, align 4, !dbg !117
  br label %168

168:                                              ; preds = %167, %166
  br label %169

169:                                              ; preds = %168, %134
  br label %170

170:                                              ; preds = %169, %101
  %171 = load i32, i32* %15, align 4, !dbg !118
  %172 = icmp eq i32 %171, -21, !dbg !119
  br i1 %172, label %173, label %182, !dbg !120

173:                                              ; preds = %170
  %174 = load i32, i32* %10, align 4, !dbg !121
  %175 = and i32 %174, 2, !dbg !122
  %176 = icmp eq i32 %175, 0, !dbg !123
  br i1 %176, label %177, label %182, !dbg !118

177:                                              ; preds = %173
  %178 = load %struct.file*, %struct.file** %8, align 4, !dbg !124
  %179 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 4, !dbg !125
  %180 = load i8*, i8** %179, align 4, !dbg !125
  %181 = call arm_aapcs_vfpcc i32 @dir_allocate(%struct.file* noundef %178, i8* noundef %180) #4, !dbg !126
  store i32 %181, i32* %15, align 4, !dbg !127
  br label %182, !dbg !128

182:                                              ; preds = %177, %173, %170
  %183 = load i32, i32* %15, align 4, !dbg !129
  %184 = icmp slt i32 %183, 0, !dbg !130
  br i1 %184, label %185, label %186, !dbg !129

185:                                              ; preds = %182
  br label %197, !dbg !131

186:                                              ; preds = %182
  br label %187, !dbg !132

187:                                              ; preds = %186
  %188 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 5, !dbg !132
  %189 = load i8*, i8** %188, align 4, !dbg !132
  %190 = icmp ne i8* %189, null, !dbg !132
  br i1 %190, label %191, label %195, !dbg !132

191:                                              ; preds = %187
  %192 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 5, !dbg !132
  %193 = load i8*, i8** %192, align 4, !dbg !132
  call arm_aapcs_vfpcc void @free(i8* noundef %193) #4, !dbg !132
  %194 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 5, !dbg !132
  store i8* null, i8** %194, align 4, !dbg !132
  br label %195, !dbg !132

195:                                              ; preds = %191, %187
  br label %196, !dbg !132

196:                                              ; preds = %195
  store i32 0, i32* %6, align 4, !dbg !133
  br label %213, !dbg !133

197:                                              ; preds = %185, %87
  %198 = load %struct.file*, %struct.file** %8, align 4, !dbg !134
  %199 = getelementptr inbounds %struct.file, %struct.file* %198, i32 0, i32 3, !dbg !135
  store %struct.inode* null, %struct.inode** %199, align 8, !dbg !136
  %200 = load %struct.inode*, %struct.inode** %13, align 4, !dbg !137
  call arm_aapcs_vfpcc void @inode_release(%struct.inode* noundef %200) #4, !dbg !138
  br label %201, !dbg !138

201:                                              ; preds = %197, %56
  br label %202, !dbg !139

202:                                              ; preds = %201
  %203 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 5, !dbg !139
  %204 = load i8*, i8** %203, align 4, !dbg !139
  %205 = icmp ne i8* %204, null, !dbg !139
  br i1 %205, label %206, label %210, !dbg !139

206:                                              ; preds = %202
  %207 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 5, !dbg !139
  %208 = load i8*, i8** %207, align 4, !dbg !139
  call arm_aapcs_vfpcc void @free(i8* noundef %208) #4, !dbg !139
  %209 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %12, i32 0, i32 5, !dbg !139
  store i8* null, i8** %209, align 4, !dbg !139
  br label %210, !dbg !139

210:                                              ; preds = %206, %202
  br label %211, !dbg !139

211:                                              ; preds = %210
  %212 = load i32, i32* %15, align 4, !dbg !140
  store i32 %212, i32* %6, align 4, !dbg !141
  br label %213, !dbg !141

213:                                              ; preds = %211, %196, %80, %20
  %214 = load i32, i32* %6, align 4, !dbg !142
  ret i32 %214, !dbg !142
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #1

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @nx_open_from_tcb(%struct.tcb_s* noundef %0, i8* noundef %1, i32 noundef %2, ...) #0 !dbg !143 {
  %4 = alloca %struct.tcb_s*, align 4
  %5 = alloca i8*, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list, align 4
  %8 = alloca i32, align 4
  store %struct.tcb_s* %0, %struct.tcb_s** %4, align 4
  store i8* %1, i8** %5, align 4
  store i32 %2, i32* %6, align 4
  %9 = bitcast %struct.__va_list* %7 to i8*, !dbg !144
  call void @llvm.va_start(i8* %9), !dbg !144
  %10 = load %struct.tcb_s*, %struct.tcb_s** %4, align 4, !dbg !145
  %11 = load i8*, i8** %5, align 4, !dbg !146
  %12 = load i32, i32* %6, align 4, !dbg !147
  %13 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %7, i32 0, i32 0, !dbg !148
  %14 = bitcast i8** %13 to [1 x i32]*, !dbg !148
  %15 = load [1 x i32], [1 x i32]* %14, align 4, !dbg !148
  %16 = call arm_aapcs_vfpcc i32 @nx_vopen(%struct.tcb_s* noundef %10, i8* noundef %11, i32 noundef %12, [1 x i32] %15) #4, !dbg !148
  store i32 %16, i32* %8, align 4, !dbg !149
  %17 = bitcast %struct.__va_list* %7 to i8*, !dbg !150
  call void @llvm.va_end(i8* %17), !dbg !150
  %18 = load i32, i32* %8, align 4, !dbg !151
  ret i32 %18, !dbg !152
}

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc i32 @nx_vopen(%struct.tcb_s* noundef %0, i8* noundef %1, i32 noundef %2, [1 x i32] %3) #0 !dbg !153 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.__va_list, align 4
  %7 = alloca %struct.tcb_s*, align 4
  %8 = alloca i8*, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.file, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %6, i32 0, i32 0
  %14 = bitcast i8** %13 to [1 x i32]*
  store [1 x i32] %3, [1 x i32]* %14, align 4
  store %struct.tcb_s* %0, %struct.tcb_s** %7, align 4
  store i8* %1, i8** %8, align 4
  store i32 %2, i32* %9, align 4
  %15 = load i8*, i8** %8, align 4, !dbg !154
  %16 = load i32, i32* %9, align 4, !dbg !155
  %17 = call arm_aapcs_vfpcc i32 @getumask() #4, !dbg !156
  %18 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %6, i32 0, i32 0, !dbg !157
  %19 = bitcast i8** %18 to [1 x i32]*, !dbg !157
  %20 = load [1 x i32], [1 x i32]* %19, align 4, !dbg !157
  %21 = call arm_aapcs_vfpcc i32 @file_vopen(%struct.file* noundef %10, i8* noundef %15, i32 noundef %16, i32 noundef %17, [1 x i32] %20) #4, !dbg !157
  store i32 %21, i32* %11, align 4, !dbg !158
  %22 = load i32, i32* %11, align 4, !dbg !159
  %23 = icmp slt i32 %22, 0, !dbg !160
  br i1 %23, label %24, label %26, !dbg !159

24:                                               ; preds = %4
  %25 = load i32, i32* %11, align 4, !dbg !161
  store i32 %25, i32* %5, align 4, !dbg !162
  br label %43, !dbg !162

26:                                               ; preds = %4
  %27 = load %struct.tcb_s*, %struct.tcb_s** %7, align 4, !dbg !163
  %28 = getelementptr inbounds %struct.file, %struct.file* %10, i32 0, i32 3, !dbg !164
  %29 = load %struct.inode*, %struct.inode** %28, align 8, !dbg !164
  %30 = getelementptr inbounds %struct.file, %struct.file* %10, i32 0, i32 0, !dbg !165
  %31 = load i32, i32* %30, align 8, !dbg !165
  %32 = getelementptr inbounds %struct.file, %struct.file* %10, i32 0, i32 2, !dbg !166
  %33 = load i64, i64* %32, align 8, !dbg !166
  %34 = getelementptr inbounds %struct.file, %struct.file* %10, i32 0, i32 4, !dbg !167
  %35 = load i8*, i8** %34, align 4, !dbg !167
  %36 = call arm_aapcs_vfpcc i32 @file_allocate_from_tcb(%struct.tcb_s* noundef %27, %struct.inode* noundef %29, i32 noundef %31, i64 noundef %33, i8* noundef %35, i32 noundef 0, i1 noundef zeroext false) #4, !dbg !168
  store i32 %36, i32* %12, align 4, !dbg !169
  %37 = load i32, i32* %12, align 4, !dbg !170
  %38 = icmp slt i32 %37, 0, !dbg !171
  br i1 %38, label %39, label %41, !dbg !170

39:                                               ; preds = %26
  %40 = call arm_aapcs_vfpcc i32 @file_close(%struct.file* noundef %10) #4, !dbg !172
  br label %41, !dbg !173

41:                                               ; preds = %39, %26
  %42 = load i32, i32* %12, align 4, !dbg !174
  store i32 %42, i32* %5, align 4, !dbg !175
  br label %43, !dbg !175

43:                                               ; preds = %41, %24
  %44 = load i32, i32* %5, align 4, !dbg !176
  ret i32 %44, !dbg !176
}

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @nx_open(i8* noundef %0, i32 noundef %1, ...) #0 !dbg !177 {
  %3 = alloca i8*, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.__va_list, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 4
  store i32 %1, i32* %4, align 4
  %7 = bitcast %struct.__va_list* %5 to i8*, !dbg !178
  call void @llvm.va_start(i8* %7), !dbg !178
  %8 = load %struct.dq_entry_s*, %struct.dq_entry_s** getelementptr inbounds (%struct.dq_queue_s, %struct.dq_queue_s* @g_readytorun, i32 0, i32 0), align 4, !dbg !179
  %9 = bitcast %struct.dq_entry_s* %8 to %struct.tcb_s*, !dbg !179
  %10 = load i8*, i8** %3, align 4, !dbg !180
  %11 = load i32, i32* %4, align 4, !dbg !181
  %12 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %5, i32 0, i32 0, !dbg !182
  %13 = bitcast i8** %12 to [1 x i32]*, !dbg !182
  %14 = load [1 x i32], [1 x i32]* %13, align 4, !dbg !182
  %15 = call arm_aapcs_vfpcc i32 @nx_vopen(%struct.tcb_s* noundef %9, i8* noundef %10, i32 noundef %11, [1 x i32] %14) #4, !dbg !182
  store i32 %15, i32* %6, align 4, !dbg !183
  %16 = bitcast %struct.__va_list* %5 to i8*, !dbg !184
  call void @llvm.va_end(i8* %16), !dbg !184
  %17 = load i32, i32* %6, align 4, !dbg !185
  ret i32 %17, !dbg !186
}

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @open(i8* noundef %0, i32 noundef %1, ...) #0 !dbg !187 {
  %3 = alloca i8*, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.__va_list, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 4
  store i32 %1, i32* %4, align 4
  %7 = bitcast %struct.__va_list* %5 to i8*, !dbg !188
  call void @llvm.va_start(i8* %7), !dbg !188
  %8 = load %struct.dq_entry_s*, %struct.dq_entry_s** getelementptr inbounds (%struct.dq_queue_s, %struct.dq_queue_s* @g_readytorun, i32 0, i32 0), align 4, !dbg !189
  %9 = bitcast %struct.dq_entry_s* %8 to %struct.tcb_s*, !dbg !189
  %10 = load i8*, i8** %3, align 4, !dbg !190
  %11 = load i32, i32* %4, align 4, !dbg !191
  %12 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %5, i32 0, i32 0, !dbg !192
  %13 = bitcast i8** %12 to [1 x i32]*, !dbg !192
  %14 = load [1 x i32], [1 x i32]* %13, align 4, !dbg !192
  %15 = call arm_aapcs_vfpcc i32 @nx_vopen(%struct.tcb_s* noundef %9, i8* noundef %10, i32 noundef %11, [1 x i32] %14) #4, !dbg !192
  store i32 %15, i32* %6, align 4, !dbg !193
  %16 = bitcast %struct.__va_list* %5 to i8*, !dbg !194
  call void @llvm.va_end(i8* %16), !dbg !194
  %17 = load i32, i32* %6, align 4, !dbg !195
  %18 = icmp slt i32 %17, 0, !dbg !196
  br i1 %18, label %19, label %25, !dbg !195

19:                                               ; preds = %2
  br label %20, !dbg !197

20:                                               ; preds = %19
  %21 = load i32, i32* %6, align 4, !dbg !197
  %22 = sub nsw i32 0, %21, !dbg !197
  %23 = call arm_aapcs_vfpcc i32* @__errno() #4, !dbg !197
  store i32 %22, i32* %23, align 4, !dbg !197
  br label %24, !dbg !197

24:                                               ; preds = %20
  store i32 -1, i32* %6, align 4, !dbg !198
  br label %25, !dbg !199

25:                                               ; preds = %24, %2
  %26 = load i32, i32* %6, align 4, !dbg !200
  ret i32 %26, !dbg !201
}

declare dso_local arm_aapcs_vfpcc i32* @__errno() #2

declare dso_local arm_aapcs_vfpcc i32 @inode_find(%struct.inode_search_s* noundef) #2

; Function Attrs: noreturn
declare dso_local arm_aapcs_vfpcc void @__assert(i8* noundef, i32 noundef, i8* noundef) #3

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc i32 @inode_checkflags(%struct.inode* noundef %0, i32 noundef %1) #0 !dbg !202 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.inode*, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.file_operations*, align 4
  store %struct.inode* %0, %struct.inode** %4, align 4
  store i32 %1, i32* %5, align 4
  %7 = load %struct.inode*, %struct.inode** %4, align 4, !dbg !203
  %8 = getelementptr inbounds %struct.inode, %struct.inode* %7, i32 0, i32 5, !dbg !204
  %9 = bitcast %union.inode_ops_u* %8 to %struct.file_operations**, !dbg !205
  %10 = load %struct.file_operations*, %struct.file_operations** %9, align 4, !dbg !205
  store %struct.file_operations* %10, %struct.file_operations** %6, align 4, !dbg !206
  %11 = load %struct.inode*, %struct.inode** %4, align 4, !dbg !207
  %12 = getelementptr inbounds %struct.inode, %struct.inode* %11, i32 0, i32 4, !dbg !207
  %13 = load i16, i16* %12, align 2, !dbg !207
  %14 = zext i16 %13 to i32, !dbg !207
  %15 = and i32 %14, 15, !dbg !207
  %16 = icmp eq i32 %15, 0, !dbg !207
  br i1 %16, label %17, label %18, !dbg !207

17:                                               ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !208
  br label %62, !dbg !208

18:                                               ; preds = %2
  %19 = load %struct.file_operations*, %struct.file_operations** %6, align 4, !dbg !209
  %20 = icmp eq %struct.file_operations* %19, null, !dbg !210
  br i1 %20, label %21, label %22, !dbg !209

21:                                               ; preds = %18
  store i32 -6, i32* %3, align 4, !dbg !211
  br label %62, !dbg !211

22:                                               ; preds = %18
  %23 = load i32, i32* %5, align 4, !dbg !212
  %24 = and i32 %23, 1, !dbg !213
  %25 = icmp ne i32 %24, 0, !dbg !214
  br i1 %25, label %26, label %41, !dbg !215

26:                                               ; preds = %22
  %27 = load %struct.file_operations*, %struct.file_operations** %6, align 4, !dbg !216
  %28 = getelementptr inbounds %struct.file_operations, %struct.file_operations* %27, i32 0, i32 9, !dbg !217
  %29 = load i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*, %struct.uio*)** %28, align 4, !dbg !217
  %30 = icmp ne i32 (%struct.file*, %struct.uio*)* %29, null, !dbg !216
  br i1 %30, label %41, label %31, !dbg !218

31:                                               ; preds = %26
  %32 = load %struct.file_operations*, %struct.file_operations** %6, align 4, !dbg !219
  %33 = getelementptr inbounds %struct.file_operations, %struct.file_operations* %32, i32 0, i32 2, !dbg !220
  %34 = load i32 (%struct.file*, i8*, i32)*, i32 (%struct.file*, i8*, i32)** %33, align 4, !dbg !220
  %35 = icmp ne i32 (%struct.file*, i8*, i32)* %34, null, !dbg !219
  br i1 %35, label %41, label %36, !dbg !221

36:                                               ; preds = %31
  %37 = load %struct.file_operations*, %struct.file_operations** %6, align 4, !dbg !222
  %38 = getelementptr inbounds %struct.file_operations, %struct.file_operations* %37, i32 0, i32 5, !dbg !223
  %39 = load i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, i32, i32)** %38, align 4, !dbg !223
  %40 = icmp ne i32 (%struct.file*, i32, i32)* %39, null, !dbg !222
  br i1 %40, label %41, label %60, !dbg !224

41:                                               ; preds = %36, %31, %26, %22
  %42 = load i32, i32* %5, align 4, !dbg !225
  %43 = and i32 %42, 2, !dbg !226
  %44 = icmp ne i32 %43, 0, !dbg !227
  br i1 %44, label %45, label %61, !dbg !228

45:                                               ; preds = %41
  %46 = load %struct.file_operations*, %struct.file_operations** %6, align 4, !dbg !229
  %47 = getelementptr inbounds %struct.file_operations, %struct.file_operations* %46, i32 0, i32 10, !dbg !230
  %48 = load i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*, %struct.uio*)** %47, align 4, !dbg !230
  %49 = icmp ne i32 (%struct.file*, %struct.uio*)* %48, null, !dbg !229
  br i1 %49, label %61, label %50, !dbg !231

50:                                               ; preds = %45
  %51 = load %struct.file_operations*, %struct.file_operations** %6, align 4, !dbg !232
  %52 = getelementptr inbounds %struct.file_operations, %struct.file_operations* %51, i32 0, i32 3, !dbg !233
  %53 = load i32 (%struct.file*, i8*, i32)*, i32 (%struct.file*, i8*, i32)** %52, align 4, !dbg !233
  %54 = icmp ne i32 (%struct.file*, i8*, i32)* %53, null, !dbg !232
  br i1 %54, label %61, label %55, !dbg !234

55:                                               ; preds = %50
  %56 = load %struct.file_operations*, %struct.file_operations** %6, align 4, !dbg !235
  %57 = getelementptr inbounds %struct.file_operations, %struct.file_operations* %56, i32 0, i32 5, !dbg !236
  %58 = load i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, i32, i32)** %57, align 4, !dbg !236
  %59 = icmp ne i32 (%struct.file*, i32, i32)* %58, null, !dbg !235
  br i1 %59, label %61, label %60, !dbg !237

60:                                               ; preds = %55, %36
  store i32 -13, i32* %3, align 4, !dbg !238
  br label %62, !dbg !238

61:                                               ; preds = %55, %50, %45, %41
  store i32 0, i32* %3, align 4, !dbg !239
  br label %62, !dbg !239

62:                                               ; preds = %61, %60, %21, %17
  %63 = load i32, i32* %3, align 4, !dbg !240
  ret i32 %63, !dbg !240
}

declare dso_local arm_aapcs_vfpcc i8* @memset(i8* noundef, i32 noundef, i32 noundef) #2

declare dso_local arm_aapcs_vfpcc i32 @dir_allocate(%struct.file* noundef, i8* noundef) #2

declare dso_local arm_aapcs_vfpcc void @free(i8* noundef) #2

declare dso_local arm_aapcs_vfpcc void @inode_release(%struct.inode* noundef) #2

declare dso_local arm_aapcs_vfpcc i32 @getumask() #2

declare dso_local arm_aapcs_vfpcc i32 @file_allocate_from_tcb(%struct.tcb_s* noundef, %struct.inode* noundef, i32 noundef, i64 noundef, i8* noundef, i32 noundef, i1 noundef zeroext) #2

declare dso_local arm_aapcs_vfpcc i32 @file_close(%struct.file* noundef) #2

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #3 = { noreturn "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #4 = { nobuiltin "no-builtins" }
attributes #5 = { nobuiltin noreturn "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_open.c", directory: "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/open/Compile", checksumkind: CSK_MD5, checksum: "957b13c644d95c50cf982c2178c305ec")
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
!12 = distinct !DISubprogram(name: "file_open", scope: !13, file: !13, line: 364, type: !14, scopeLine: 365, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_open.c", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "957b13c644d95c50cf982c2178c305ec")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 369, column: 3, scope: !12)
!17 = !DILocation(line: 370, column: 20, scope: !12)
!18 = !DILocation(line: 370, column: 27, scope: !12)
!19 = !DILocation(line: 370, column: 33, scope: !12)
!20 = !DILocation(line: 370, column: 9, scope: !12)
!21 = !DILocation(line: 370, column: 7, scope: !12)
!22 = !DILocation(line: 371, column: 3, scope: !12)
!23 = !DILocation(line: 373, column: 7, scope: !12)
!24 = !DILocation(line: 373, column: 11, scope: !12)
!25 = !DILocation(line: 376, column: 5, scope: !12)
!26 = !DILocation(line: 378, column: 10, scope: !12)
!27 = !DILocation(line: 378, column: 3, scope: !12)
!28 = distinct !DISubprogram(name: "file_vopen", scope: !13, file: !13, line: 122, type: !14, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!29 = !DILocation(line: 128, column: 10, scope: !28)
!30 = !DILocation(line: 132, column: 7, scope: !28)
!31 = !DILocation(line: 132, column: 12, scope: !28)
!32 = !DILocation(line: 134, column: 7, scope: !28)
!33 = !DILocation(line: 141, column: 8, scope: !28)
!34 = !DILocation(line: 141, column: 15, scope: !28)
!35 = !DILocation(line: 141, column: 26, scope: !28)
!36 = !DILocation(line: 141, column: 7, scope: !28)
!37 = !DILocation(line: 143, column: 14, scope: !28)
!38 = !DILocation(line: 143, column: 12, scope: !28)
!39 = !DILocation(line: 144, column: 5, scope: !28)
!40 = !DILocation(line: 146, column: 12, scope: !28)
!41 = !DILocation(line: 146, column: 11, scope: !28)
!42 = !DILocation(line: 146, column: 8, scope: !28)
!43 = !DILocation(line: 151, column: 3, scope: !28)
!44 = !DILocation(line: 153, column: 9, scope: !28)
!45 = !DILocation(line: 153, column: 7, scope: !28)
!46 = !DILocation(line: 154, column: 7, scope: !28)
!47 = !DILocation(line: 154, column: 11, scope: !28)
!48 = !DILocation(line: 163, column: 11, scope: !28)
!49 = !DILocation(line: 163, column: 15, scope: !28)
!50 = !DILocation(line: 170, column: 11, scope: !28)
!51 = !DILocation(line: 172, column: 5, scope: !28)
!52 = !DILocation(line: 176, column: 16, scope: !28)
!53 = !DILocation(line: 176, column: 9, scope: !28)
!54 = !DILocation(line: 177, column: 3, scope: !28)
!55 = !DILocation(line: 179, column: 12, scope: !28)
!56 = !DILocation(line: 179, column: 21, scope: !28)
!57 = !DILocation(line: 179, column: 24, scope: !28)
!58 = !DILocation(line: 179, column: 7, scope: !28)
!59 = !DILocation(line: 181, column: 7, scope: !28)
!60 = !DILocation(line: 222, column: 26, scope: !28)
!61 = !DILocation(line: 222, column: 33, scope: !28)
!62 = !DILocation(line: 222, column: 9, scope: !28)
!63 = !DILocation(line: 222, column: 7, scope: !28)
!64 = !DILocation(line: 223, column: 7, scope: !28)
!65 = !DILocation(line: 223, column: 11, scope: !28)
!66 = !DILocation(line: 225, column: 7, scope: !28)
!67 = !DILocation(line: 230, column: 10, scope: !28)
!68 = !DILocation(line: 230, column: 3, scope: !28)
!69 = !DILocation(line: 231, column: 21, scope: !28)
!70 = !DILocation(line: 231, column: 3, scope: !28)
!71 = !DILocation(line: 231, column: 10, scope: !28)
!72 = !DILocation(line: 231, column: 19, scope: !28)
!73 = !DILocation(line: 232, column: 21, scope: !28)
!74 = !DILocation(line: 232, column: 3, scope: !28)
!75 = !DILocation(line: 232, column: 10, scope: !28)
!76 = !DILocation(line: 232, column: 19, scope: !28)
!77 = !DILocation(line: 239, column: 7, scope: !28)
!78 = !DILocation(line: 239, column: 14, scope: !28)
!79 = !DILocation(line: 241, column: 26, scope: !28)
!80 = !DILocation(line: 241, column: 38, scope: !28)
!81 = !DILocation(line: 241, column: 13, scope: !28)
!82 = !DILocation(line: 241, column: 11, scope: !28)
!83 = !DILocation(line: 242, column: 5, scope: !28)
!84 = !DILocation(line: 244, column: 12, scope: !28)
!85 = !DILocation(line: 246, column: 11, scope: !28)
!86 = !DILocation(line: 246, column: 18, scope: !28)
!87 = !DILocation(line: 246, column: 20, scope: !28)
!88 = !DILocation(line: 246, column: 28, scope: !28)
!89 = !DILocation(line: 246, column: 33, scope: !28)
!90 = !DILocation(line: 248, column: 17, scope: !28)
!91 = !DILocation(line: 248, column: 24, scope: !28)
!92 = !DILocation(line: 248, column: 26, scope: !28)
!93 = !DILocation(line: 248, column: 34, scope: !28)
!94 = !DILocation(line: 248, column: 39, scope: !28)
!95 = !DILocation(line: 248, column: 51, scope: !28)
!96 = !DILocation(line: 248, column: 60, scope: !28)
!97 = !DILocation(line: 248, column: 68, scope: !28)
!98 = !DILocation(line: 248, column: 15, scope: !28)
!99 = !DILocation(line: 249, column: 9, scope: !28)
!100 = !DILocation(line: 250, column: 5, scope: !28)
!101 = !DILocation(line: 252, column: 12, scope: !28)
!102 = !DILocation(line: 252, column: 35, scope: !28)
!103 = !DILocation(line: 252, column: 38, scope: !28)
!104 = !DILocation(line: 254, column: 11, scope: !28)
!105 = !DILocation(line: 254, column: 18, scope: !28)
!106 = !DILocation(line: 254, column: 20, scope: !28)
!107 = !DILocation(line: 254, column: 27, scope: !28)
!108 = !DILocation(line: 254, column: 32, scope: !28)
!109 = !DILocation(line: 256, column: 17, scope: !28)
!110 = !DILocation(line: 256, column: 24, scope: !28)
!111 = !DILocation(line: 256, column: 26, scope: !28)
!112 = !DILocation(line: 256, column: 33, scope: !28)
!113 = !DILocation(line: 256, column: 38, scope: !28)
!114 = !DILocation(line: 256, column: 15, scope: !28)
!115 = !DILocation(line: 257, column: 9, scope: !28)
!116 = !DILocation(line: 258, column: 5, scope: !28)
!117 = !DILocation(line: 261, column: 11, scope: !28)
!118 = !DILocation(line: 264, column: 7, scope: !28)
!119 = !DILocation(line: 264, column: 11, scope: !28)
!120 = !DILocation(line: 264, column: 22, scope: !28)
!121 = !DILocation(line: 264, column: 27, scope: !28)
!122 = !DILocation(line: 264, column: 34, scope: !28)
!123 = !DILocation(line: 264, column: 46, scope: !28)
!124 = !DILocation(line: 266, column: 26, scope: !28)
!125 = !DILocation(line: 266, column: 38, scope: !28)
!126 = !DILocation(line: 266, column: 13, scope: !28)
!127 = !DILocation(line: 266, column: 11, scope: !28)
!128 = !DILocation(line: 267, column: 5, scope: !28)
!129 = !DILocation(line: 269, column: 7, scope: !28)
!130 = !DILocation(line: 269, column: 11, scope: !28)
!131 = !DILocation(line: 271, column: 7, scope: !28)
!132 = !DILocation(line: 274, column: 3, scope: !28)
!133 = !DILocation(line: 278, column: 3, scope: !28)
!134 = !DILocation(line: 281, column: 3, scope: !28)
!135 = !DILocation(line: 281, column: 10, scope: !28)
!136 = !DILocation(line: 281, column: 18, scope: !28)
!137 = !DILocation(line: 282, column: 17, scope: !28)
!138 = !DILocation(line: 282, column: 3, scope: !28)
!139 = !DILocation(line: 285, column: 3, scope: !28)
!140 = !DILocation(line: 286, column: 10, scope: !28)
!141 = !DILocation(line: 286, column: 3, scope: !28)
!142 = !DILocation(line: 287, column: 1, scope: !28)
!143 = distinct !DISubprogram(name: "nx_open_from_tcb", scope: !13, file: !13, line: 404, type: !14, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!144 = !DILocation(line: 412, column: 3, scope: !143)
!145 = !DILocation(line: 413, column: 17, scope: !143)
!146 = !DILocation(line: 413, column: 22, scope: !143)
!147 = !DILocation(line: 413, column: 28, scope: !143)
!148 = !DILocation(line: 413, column: 8, scope: !143)
!149 = !DILocation(line: 413, column: 6, scope: !143)
!150 = !DILocation(line: 414, column: 3, scope: !143)
!151 = !DILocation(line: 416, column: 10, scope: !143)
!152 = !DILocation(line: 416, column: 3, scope: !143)
!153 = distinct !DISubprogram(name: "nx_vopen", scope: !13, file: !13, line: 311, type: !14, scopeLine: 313, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!154 = !DILocation(line: 320, column: 28, scope: !153)
!155 = !DILocation(line: 320, column: 34, scope: !153)
!156 = !DILocation(line: 320, column: 42, scope: !153)
!157 = !DILocation(line: 320, column: 9, scope: !153)
!158 = !DILocation(line: 320, column: 7, scope: !153)
!159 = !DILocation(line: 321, column: 7, scope: !153)
!160 = !DILocation(line: 321, column: 11, scope: !153)
!161 = !DILocation(line: 323, column: 14, scope: !153)
!162 = !DILocation(line: 323, column: 7, scope: !153)
!163 = !DILocation(line: 328, column: 31, scope: !153)
!164 = !DILocation(line: 328, column: 42, scope: !153)
!165 = !DILocation(line: 328, column: 57, scope: !153)
!166 = !DILocation(line: 329, column: 37, scope: !153)
!167 = !DILocation(line: 329, column: 50, scope: !153)
!168 = !DILocation(line: 328, column: 8, scope: !153)
!169 = !DILocation(line: 328, column: 6, scope: !153)
!170 = !DILocation(line: 330, column: 7, scope: !153)
!171 = !DILocation(line: 330, column: 10, scope: !153)
!172 = !DILocation(line: 332, column: 7, scope: !153)
!173 = !DILocation(line: 333, column: 5, scope: !153)
!174 = !DILocation(line: 335, column: 10, scope: !153)
!175 = !DILocation(line: 335, column: 3, scope: !153)
!176 = !DILocation(line: 336, column: 1, scope: !153)
!177 = distinct !DISubprogram(name: "nx_open", scope: !13, file: !13, line: 440, type: !14, scopeLine: 441, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!178 = !DILocation(line: 447, column: 3, scope: !177)
!179 = !DILocation(line: 448, column: 17, scope: !177)
!180 = !DILocation(line: 448, column: 30, scope: !177)
!181 = !DILocation(line: 448, column: 36, scope: !177)
!182 = !DILocation(line: 448, column: 8, scope: !177)
!183 = !DILocation(line: 448, column: 6, scope: !177)
!184 = !DILocation(line: 449, column: 3, scope: !177)
!185 = !DILocation(line: 451, column: 10, scope: !177)
!186 = !DILocation(line: 451, column: 3, scope: !177)
!187 = distinct !DISubprogram(name: "open", scope: !13, file: !13, line: 466, type: !14, scopeLine: 467, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!188 = !DILocation(line: 477, column: 3, scope: !187)
!189 = !DILocation(line: 478, column: 17, scope: !187)
!190 = !DILocation(line: 478, column: 30, scope: !187)
!191 = !DILocation(line: 478, column: 36, scope: !187)
!192 = !DILocation(line: 478, column: 8, scope: !187)
!193 = !DILocation(line: 478, column: 6, scope: !187)
!194 = !DILocation(line: 479, column: 3, scope: !187)
!195 = !DILocation(line: 483, column: 7, scope: !187)
!196 = !DILocation(line: 483, column: 10, scope: !187)
!197 = !DILocation(line: 485, column: 7, scope: !187)
!198 = !DILocation(line: 486, column: 10, scope: !187)
!199 = !DILocation(line: 487, column: 5, scope: !187)
!200 = !DILocation(line: 490, column: 10, scope: !187)
!201 = !DILocation(line: 490, column: 3, scope: !187)
!202 = distinct !DISubprogram(name: "inode_checkflags", scope: !13, file: !13, line: 70, type: !14, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!203 = !DILocation(line: 72, column: 43, scope: !202)
!204 = !DILocation(line: 72, column: 50, scope: !202)
!205 = !DILocation(line: 72, column: 52, scope: !202)
!206 = !DILocation(line: 72, column: 37, scope: !202)
!207 = !DILocation(line: 74, column: 7, scope: !202)
!208 = !DILocation(line: 76, column: 7, scope: !202)
!209 = !DILocation(line: 79, column: 7, scope: !202)
!210 = !DILocation(line: 79, column: 11, scope: !202)
!211 = !DILocation(line: 81, column: 7, scope: !202)
!212 = !DILocation(line: 84, column: 9, scope: !202)
!213 = !DILocation(line: 84, column: 16, scope: !202)
!214 = !DILocation(line: 84, column: 26, scope: !202)
!215 = !DILocation(line: 84, column: 31, scope: !202)
!216 = !DILocation(line: 84, column: 35, scope: !202)
!217 = !DILocation(line: 84, column: 40, scope: !202)
!218 = !DILocation(line: 84, column: 46, scope: !202)
!219 = !DILocation(line: 84, column: 50, scope: !202)
!220 = !DILocation(line: 84, column: 55, scope: !202)
!221 = !DILocation(line: 84, column: 60, scope: !202)
!222 = !DILocation(line: 84, column: 64, scope: !202)
!223 = !DILocation(line: 84, column: 69, scope: !202)
!224 = !DILocation(line: 84, column: 76, scope: !202)
!225 = !DILocation(line: 85, column: 9, scope: !202)
!226 = !DILocation(line: 85, column: 16, scope: !202)
!227 = !DILocation(line: 85, column: 26, scope: !202)
!228 = !DILocation(line: 85, column: 31, scope: !202)
!229 = !DILocation(line: 85, column: 35, scope: !202)
!230 = !DILocation(line: 85, column: 40, scope: !202)
!231 = !DILocation(line: 85, column: 47, scope: !202)
!232 = !DILocation(line: 85, column: 51, scope: !202)
!233 = !DILocation(line: 85, column: 56, scope: !202)
!234 = !DILocation(line: 85, column: 62, scope: !202)
!235 = !DILocation(line: 85, column: 66, scope: !202)
!236 = !DILocation(line: 85, column: 71, scope: !202)
!237 = !DILocation(line: 84, column: 7, scope: !202)
!238 = !DILocation(line: 87, column: 7, scope: !202)
!239 = !DILocation(line: 91, column: 7, scope: !202)
!240 = !DILocation(line: 93, column: 1, scope: !202)
