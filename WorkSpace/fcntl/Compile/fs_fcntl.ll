; ModuleID = '/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c'
source_filename = "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-unknown"

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
%struct.filelist = type { i8, i8, %struct.file** }
%struct.mm_map_s = type { %struct.sq_queue_s, i32, %struct.rmutex_s }
%struct.pollfd = type opaque
%struct.uio = type { %struct.iovec*, i32 }
%struct.iovec = type { i8*, i32 }
%struct.__va_list = type { i8* }
%struct.flock = type { i16, i16, i64, i64, i32 }

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @file_fcntl(%struct.file* noundef %0, i32 noundef %1, ...) #0 !dbg !12 {
  %3 = alloca %struct.file*, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.__va_list, align 4
  %6 = alloca i32, align 4
  store %struct.file* %0, %struct.file** %3, align 4
  store i32 %1, i32* %4, align 4
  %7 = bitcast %struct.__va_list* %5 to i8*, !dbg !16
  call void @llvm.va_start(i8* %7), !dbg !16
  %8 = load %struct.file*, %struct.file** %3, align 4, !dbg !17
  %9 = load i32, i32* %4, align 4, !dbg !18
  %10 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %5, i32 0, i32 0, !dbg !19
  %11 = bitcast i8** %10 to [1 x i32]*, !dbg !19
  %12 = load [1 x i32], [1 x i32]* %11, align 4, !dbg !19
  %13 = call arm_aapcs_vfpcc i32 @file_vfcntl(%struct.file* noundef %8, i32 noundef %9, [1 x i32] %12) #3, !dbg !19
  store i32 %13, i32* %6, align 4, !dbg !20
  %14 = bitcast %struct.__va_list* %5 to i8*, !dbg !21
  call void @llvm.va_end(i8* %14), !dbg !21
  %15 = load i32, i32* %6, align 4, !dbg !22
  ret i32 %15, !dbg !23
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #1

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc i32 @file_vfcntl(%struct.file* noundef %0, i32 noundef %1, [1 x i32] %2) #0 !dbg !24 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.__va_list, align 4
  %6 = alloca %struct.file*, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %5, i32 0, i32 0
  %13 = bitcast i8** %12 to [1 x i32]*
  store [1 x i32] %2, [1 x i32]* %13, align 4
  store %struct.file* %0, %struct.file** %6, align 4
  store i32 %1, i32* %7, align 4
  store i32 -22, i32* %8, align 4, !dbg !25
  %14 = load %struct.file*, %struct.file** %6, align 4, !dbg !26
  %15 = getelementptr inbounds %struct.file, %struct.file* %14, i32 0, i32 3, !dbg !27
  %16 = load %struct.inode*, %struct.inode** %15, align 8, !dbg !27
  %17 = icmp ne %struct.inode* %16, null, !dbg !26
  br i1 %17, label %19, label %18, !dbg !28

18:                                               ; preds = %3
  store i32 -9, i32* %4, align 4, !dbg !29
  br label %156, !dbg !29

19:                                               ; preds = %3
  %20 = load i32, i32* %7, align 4, !dbg !30
  switch i32 %20, label %153 [
    i32 0, label %21
    i32 18, label %29
    i32 1, label %37
    i32 8, label %45
    i32 2, label %66
    i32 9, label %70
    i32 5, label %109
    i32 13, label %109
    i32 4, label %110
    i32 11, label %118
    i32 12, label %126
    i32 15, label %134
    i32 19, label %142
    i32 20, label %150
  ], !dbg !31

21:                                               ; preds = %19
  %22 = load %struct.file*, %struct.file** %6, align 4, !dbg !32
  %23 = bitcast %struct.__va_list* %5 to i8**, !dbg !33
  %24 = load i8*, i8** %23, align 4, !dbg !33
  %25 = getelementptr inbounds i8, i8* %24, i32 4, !dbg !33
  store i8* %25, i8** %23, align 4, !dbg !33
  %26 = bitcast i8* %24 to i32*, !dbg !33
  %27 = load i32, i32* %26, align 4, !dbg !33
  %28 = call arm_aapcs_vfpcc i32 @file_dup(%struct.file* noundef %22, i32 noundef %27, i32 noundef 0) #3, !dbg !34
  store i32 %28, i32* %8, align 4, !dbg !35
  br label %154, !dbg !36

29:                                               ; preds = %19
  %30 = load %struct.file*, %struct.file** %6, align 4, !dbg !37
  %31 = bitcast %struct.__va_list* %5 to i8**, !dbg !38
  %32 = load i8*, i8** %31, align 4, !dbg !38
  %33 = getelementptr inbounds i8, i8* %32, i32 4, !dbg !38
  store i8* %33, i8** %31, align 4, !dbg !38
  %34 = bitcast i8* %32 to i32*, !dbg !38
  %35 = load i32, i32* %34, align 4, !dbg !38
  %36 = call arm_aapcs_vfpcc i32 @file_dup(%struct.file* noundef %30, i32 noundef %35, i32 noundef 1024) #3, !dbg !39
  store i32 %36, i32* %8, align 4, !dbg !40
  br label %154, !dbg !41

37:                                               ; preds = %19
  %38 = load %struct.file*, %struct.file** %6, align 4, !dbg !42
  %39 = getelementptr inbounds %struct.file, %struct.file* %38, i32 0, i32 0, !dbg !43
  %40 = load i32, i32* %39, align 8, !dbg !43
  %41 = and i32 %40, 1024, !dbg !44
  %42 = icmp ne i32 %41, 0, !dbg !42
  %43 = zext i1 %42 to i64, !dbg !42
  %44 = select i1 %42, i32 1, i32 0, !dbg !42
  store i32 %44, i32* %8, align 4, !dbg !45
  br label %154, !dbg !46

45:                                               ; preds = %19
  %46 = bitcast %struct.__va_list* %5 to i8**, !dbg !47
  %47 = load i8*, i8** %46, align 4, !dbg !47
  %48 = getelementptr inbounds i8, i8* %47, i32 4, !dbg !47
  store i8* %48, i8** %46, align 4, !dbg !47
  %49 = bitcast i8* %47 to i32*, !dbg !47
  %50 = load i32, i32* %49, align 4, !dbg !47
  store i32 %50, i32* %9, align 4, !dbg !48
  %51 = load i32, i32* %9, align 4, !dbg !49
  %52 = and i32 %51, -2, !dbg !50
  %53 = icmp ne i32 %52, 0, !dbg !50
  br i1 %53, label %54, label %55, !dbg !49

54:                                               ; preds = %45
  store i32 -38, i32* %8, align 4, !dbg !51
  br label %154, !dbg !52

55:                                               ; preds = %45
  %56 = load i32, i32* %9, align 4, !dbg !53
  %57 = and i32 %56, 1, !dbg !54
  %58 = icmp ne i32 %57, 0, !dbg !54
  br i1 %58, label %59, label %62, !dbg !53

59:                                               ; preds = %55
  %60 = load %struct.file*, %struct.file** %6, align 4, !dbg !55
  %61 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %60, i32 noundef 779, i8* noundef null) #3, !dbg !56
  store i32 %61, i32* %8, align 4, !dbg !57
  br label %65, !dbg !58

62:                                               ; preds = %55
  %63 = load %struct.file*, %struct.file** %6, align 4, !dbg !59
  %64 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %63, i32 noundef 780, i8* noundef null) #3, !dbg !60
  store i32 %64, i32* %8, align 4, !dbg !61
  br label %65

65:                                               ; preds = %62, %59
  br label %154, !dbg !62

66:                                               ; preds = %19
  %67 = load %struct.file*, %struct.file** %6, align 4, !dbg !63
  %68 = getelementptr inbounds %struct.file, %struct.file* %67, i32 0, i32 0, !dbg !64
  %69 = load i32, i32* %68, align 8, !dbg !64
  store i32 %69, i32* %8, align 4, !dbg !65
  br label %154, !dbg !66

70:                                               ; preds = %19
  %71 = bitcast %struct.__va_list* %5 to i8**, !dbg !67
  %72 = load i8*, i8** %71, align 4, !dbg !67
  %73 = getelementptr inbounds i8, i8* %72, i32 4, !dbg !67
  store i8* %73, i8** %71, align 4, !dbg !67
  %74 = bitcast i8* %72 to i32*, !dbg !67
  %75 = load i32, i32* %74, align 4, !dbg !67
  store i32 %75, i32* %10, align 4, !dbg !68
  %76 = load i32, i32* %10, align 4, !dbg !69
  %77 = and i32 %76, 64, !dbg !70
  %78 = icmp ne i32 %77, 0, !dbg !71
  %79 = xor i1 %78, true, !dbg !71
  %80 = xor i1 %79, true, !dbg !72
  %81 = zext i1 %80 to i32, !dbg !72
  store i32 %81, i32* %11, align 4, !dbg !73
  %82 = load %struct.file*, %struct.file** %6, align 4, !dbg !74
  %83 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %82, i32 noundef 778, i32* noundef %11) #3, !dbg !75
  store i32 %83, i32* %8, align 4, !dbg !76
  %84 = load i32, i32* %8, align 4, !dbg !77
  %85 = icmp eq i32 %84, 0, !dbg !78
  br i1 %85, label %86, label %108, !dbg !77

86:                                               ; preds = %70
  %87 = load i32, i32* %10, align 4, !dbg !79
  %88 = and i32 %87, 144, !dbg !79
  store i32 %88, i32* %10, align 4, !dbg !79
  %89 = load %struct.file*, %struct.file** %6, align 4, !dbg !80
  %90 = getelementptr inbounds %struct.file, %struct.file* %89, i32 0, i32 0, !dbg !81
  %91 = load i32, i32* %90, align 8, !dbg !82
  %92 = and i32 %91, -145, !dbg !82
  store i32 %92, i32* %90, align 8, !dbg !82
  %93 = load i32, i32* %10, align 4, !dbg !83
  %94 = load %struct.file*, %struct.file** %6, align 4, !dbg !84
  %95 = getelementptr inbounds %struct.file, %struct.file* %94, i32 0, i32 0, !dbg !85
  %96 = load i32, i32* %95, align 8, !dbg !86
  %97 = or i32 %96, %93, !dbg !86
  store i32 %97, i32* %95, align 8, !dbg !86
  %98 = load %struct.file*, %struct.file** %6, align 4, !dbg !87
  %99 = getelementptr inbounds %struct.file, %struct.file* %98, i32 0, i32 0, !dbg !88
  %100 = load i32, i32* %99, align 8, !dbg !88
  %101 = and i32 %100, 16, !dbg !89
  %102 = icmp ne i32 %101, 0, !dbg !90
  br i1 %102, label %103, label %107, !dbg !91

103:                                              ; preds = %86
  %104 = load %struct.file*, %struct.file** %6, align 4, !dbg !92
  %105 = call arm_aapcs_vfpcc i64 @file_seek(%struct.file* noundef %104, i64 noundef 0, i32 noundef 2) #3, !dbg !93
  %106 = trunc i64 %105 to i32, !dbg !93
  store i32 %106, i32* %8, align 4, !dbg !94
  br label %107, !dbg !95

107:                                              ; preds = %103, %86
  br label %108, !dbg !96

108:                                              ; preds = %107, %70
  br label %154, !dbg !97

109:                                              ; preds = %19, %19
  store i32 -9, i32* %8, align 4, !dbg !98
  br label %154, !dbg !99

110:                                              ; preds = %19
  %111 = load %struct.file*, %struct.file** %6, align 4, !dbg !100
  %112 = bitcast %struct.__va_list* %5 to i8**, !dbg !101
  %113 = load i8*, i8** %112, align 4, !dbg !101
  %114 = getelementptr inbounds i8, i8* %113, i32 4, !dbg !101
  store i8* %114, i8** %112, align 4, !dbg !101
  %115 = bitcast i8* %113 to %struct.flock**, !dbg !101
  %116 = load %struct.flock*, %struct.flock** %115, align 4, !dbg !101
  %117 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %111, i32 noundef 787, %struct.flock* noundef %116) #3, !dbg !102
  store i32 %117, i32* %8, align 4, !dbg !103
  br label %154, !dbg !104

118:                                              ; preds = %19
  %119 = load %struct.file*, %struct.file** %6, align 4, !dbg !105
  %120 = bitcast %struct.__va_list* %5 to i8**, !dbg !106
  %121 = load i8*, i8** %120, align 4, !dbg !106
  %122 = getelementptr inbounds i8, i8* %121, i32 4, !dbg !106
  store i8* %122, i8** %120, align 4, !dbg !106
  %123 = bitcast i8* %121 to %struct.flock**, !dbg !106
  %124 = load %struct.flock*, %struct.flock** %123, align 4, !dbg !106
  %125 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %119, i32 noundef 786, %struct.flock* noundef %124) #3, !dbg !107
  store i32 %125, i32* %8, align 4, !dbg !108
  br label %154, !dbg !109

126:                                              ; preds = %19
  %127 = load %struct.file*, %struct.file** %6, align 4, !dbg !110
  %128 = bitcast %struct.__va_list* %5 to i8**, !dbg !111
  %129 = load i8*, i8** %128, align 4, !dbg !111
  %130 = getelementptr inbounds i8, i8* %129, i32 4, !dbg !111
  store i8* %130, i8** %128, align 4, !dbg !111
  %131 = bitcast i8* %129 to %struct.flock**, !dbg !111
  %132 = load %struct.flock*, %struct.flock** %131, align 4, !dbg !111
  %133 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %127, i32 noundef 788, %struct.flock* noundef %132) #3, !dbg !112
  store i32 %133, i32* %8, align 4, !dbg !113
  br label %154, !dbg !114

134:                                              ; preds = %19
  %135 = load %struct.file*, %struct.file** %6, align 4, !dbg !115
  %136 = bitcast %struct.__va_list* %5 to i8**, !dbg !116
  %137 = load i8*, i8** %136, align 4, !dbg !116
  %138 = getelementptr inbounds i8, i8* %137, i32 4, !dbg !116
  store i8* %138, i8** %136, align 4, !dbg !116
  %139 = bitcast i8* %137 to i8**, !dbg !116
  %140 = load i8*, i8** %139, align 4, !dbg !116
  %141 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %135, i32 noundef 771, i8* noundef %140) #3, !dbg !117
  store i32 %141, i32* %8, align 4, !dbg !118
  br label %154, !dbg !119

142:                                              ; preds = %19
  %143 = load %struct.file*, %struct.file** %6, align 4, !dbg !120
  %144 = bitcast %struct.__va_list* %5 to i8**, !dbg !121
  %145 = load i8*, i8** %144, align 4, !dbg !121
  %146 = getelementptr inbounds i8, i8* %145, i32 4, !dbg !121
  store i8* %146, i8** %144, align 4, !dbg !121
  %147 = bitcast i8* %145 to i32*, !dbg !121
  %148 = load i32, i32* %147, align 4, !dbg !121
  %149 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %143, i32 noundef 6149, i32 noundef %148) #3, !dbg !122
  store i32 %149, i32* %8, align 4, !dbg !123
  br label %154, !dbg !124

150:                                              ; preds = %19
  %151 = load %struct.file*, %struct.file** %6, align 4, !dbg !125
  %152 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %151, i32 noundef 6150) #3, !dbg !126
  store i32 %152, i32* %8, align 4, !dbg !127
  br label %154, !dbg !128

153:                                              ; preds = %19
  br label %154, !dbg !129

154:                                              ; preds = %153, %150, %142, %134, %126, %118, %110, %109, %108, %66, %65, %54, %37, %29, %21
  %155 = load i32, i32* %8, align 4, !dbg !130
  store i32 %155, i32* %4, align 4, !dbg !131
  br label %156, !dbg !131

156:                                              ; preds = %154, %18
  %157 = load i32, i32* %4, align 4, !dbg !132
  ret i32 %157, !dbg !132
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #1

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @fcntl(i32 noundef %0, i32 noundef %1, ...) #0 !dbg !133 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.file*, align 4
  %6 = alloca %struct.__va_list, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %8 = bitcast %struct.__va_list* %6 to i8*, !dbg !134
  call void @llvm.va_start(i8* %8), !dbg !134
  %9 = load i32, i32* %3, align 4, !dbg !135
  %10 = call arm_aapcs_vfpcc i32 @fs_getfilep(i32 noundef %9, %struct.file** noundef %5) #3, !dbg !136
  store i32 %10, i32* %7, align 4, !dbg !137
  %11 = load i32, i32* %7, align 4, !dbg !138
  %12 = icmp sge i32 %11, 0, !dbg !139
  br i1 %12, label %13, label %22, !dbg !138

13:                                               ; preds = %2
  %14 = load %struct.file*, %struct.file** %5, align 4, !dbg !140
  %15 = load i32, i32* %4, align 4, !dbg !141
  %16 = getelementptr inbounds %struct.__va_list, %struct.__va_list* %6, i32 0, i32 0, !dbg !142
  %17 = bitcast i8** %16 to [1 x i32]*, !dbg !142
  %18 = load [1 x i32], [1 x i32]* %17, align 4, !dbg !142
  %19 = call arm_aapcs_vfpcc i32 @file_vfcntl(%struct.file* noundef %14, i32 noundef %15, [1 x i32] %18) #3, !dbg !142
  store i32 %19, i32* %7, align 4, !dbg !143
  %20 = load %struct.file*, %struct.file** %5, align 4, !dbg !144
  %21 = call arm_aapcs_vfpcc i32 @fs_putfilep(%struct.file* noundef %20) #3, !dbg !145
  br label %22, !dbg !146

22:                                               ; preds = %13, %2
  %23 = load i32, i32* %7, align 4, !dbg !147
  %24 = icmp slt i32 %23, 0, !dbg !148
  br i1 %24, label %25, label %31, !dbg !147

25:                                               ; preds = %22
  br label %26, !dbg !149

26:                                               ; preds = %25
  %27 = load i32, i32* %7, align 4, !dbg !149
  %28 = sub nsw i32 0, %27, !dbg !149
  %29 = call arm_aapcs_vfpcc i32* @__errno() #3, !dbg !149
  store i32 %28, i32* %29, align 4, !dbg !149
  br label %30, !dbg !149

30:                                               ; preds = %26
  store i32 -1, i32* %7, align 4, !dbg !150
  br label %31, !dbg !151

31:                                               ; preds = %30, %22
  %32 = bitcast %struct.__va_list* %6 to i8*, !dbg !152
  call void @llvm.va_end(i8* %32), !dbg !152
  %33 = load i32, i32* %7, align 4, !dbg !153
  ret i32 %33, !dbg !154
}

declare dso_local arm_aapcs_vfpcc i32 @fs_getfilep(i32 noundef, %struct.file** noundef) #2

declare dso_local arm_aapcs_vfpcc i32 @fs_putfilep(%struct.file* noundef) #2

declare dso_local arm_aapcs_vfpcc i32* @__errno() #2

declare dso_local arm_aapcs_vfpcc i32 @file_dup(%struct.file* noundef, i32 noundef, i32 noundef) #2

declare dso_local arm_aapcs_vfpcc i32 @file_ioctl(%struct.file* noundef, i32 noundef, ...) #2

declare dso_local arm_aapcs_vfpcc i64 @file_seek(%struct.file* noundef, i64 noundef, i32 noundef) #2

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #3 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c", directory: "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/fcntl/Compile", checksumkind: CSK_MD5, checksum: "82f0ae00e0aeca46555c7e5a196e459f")
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
!12 = distinct !DISubprogram(name: "file_fcntl", scope: !13, file: !13, line: 298, type: !14, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "82f0ae00e0aeca46555c7e5a196e459f")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 305, column: 3, scope: !12)
!17 = !DILocation(line: 311, column: 21, scope: !12)
!18 = !DILocation(line: 311, column: 28, scope: !12)
!19 = !DILocation(line: 311, column: 9, scope: !12)
!20 = !DILocation(line: 311, column: 7, scope: !12)
!21 = !DILocation(line: 313, column: 3, scope: !12)
!22 = !DILocation(line: 314, column: 10, scope: !12)
!23 = !DILocation(line: 314, column: 3, scope: !12)
!24 = distinct !DISubprogram(name: "file_vfcntl", scope: !13, file: !13, line: 49, type: !14, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!25 = !DILocation(line: 51, column: 7, scope: !24)
!26 = !DILocation(line: 55, column: 8, scope: !24)
!27 = !DILocation(line: 55, column: 15, scope: !24)
!28 = !DILocation(line: 55, column: 7, scope: !24)
!29 = !DILocation(line: 57, column: 7, scope: !24)
!30 = !DILocation(line: 60, column: 11, scope: !24)
!31 = !DILocation(line: 60, column: 3, scope: !24)
!32 = !DILocation(line: 76, column: 26, scope: !24)
!33 = !DILocation(line: 76, column: 33, scope: !24)
!34 = !DILocation(line: 76, column: 17, scope: !24)
!35 = !DILocation(line: 76, column: 15, scope: !24)
!36 = !DILocation(line: 78, column: 9, scope: !24)
!37 = !DILocation(line: 82, column: 26, scope: !24)
!38 = !DILocation(line: 82, column: 33, scope: !24)
!39 = !DILocation(line: 82, column: 17, scope: !24)
!40 = !DILocation(line: 82, column: 15, scope: !24)
!41 = !DILocation(line: 84, column: 9, scope: !24)
!42 = !DILocation(line: 94, column: 17, scope: !24)
!43 = !DILocation(line: 94, column: 24, scope: !24)
!44 = !DILocation(line: 94, column: 33, scope: !24)
!45 = !DILocation(line: 94, column: 15, scope: !24)
!46 = !DILocation(line: 96, column: 9, scope: !24)
!47 = !DILocation(line: 107, column: 24, scope: !24)
!48 = !DILocation(line: 107, column: 15, scope: !24)
!49 = !DILocation(line: 109, column: 15, scope: !24)
!50 = !DILocation(line: 109, column: 22, scope: !24)
!51 = !DILocation(line: 111, column: 19, scope: !24)
!52 = !DILocation(line: 112, column: 15, scope: !24)
!53 = !DILocation(line: 115, column: 15, scope: !24)
!54 = !DILocation(line: 115, column: 22, scope: !24)
!55 = !DILocation(line: 117, column: 32, scope: !24)
!56 = !DILocation(line: 117, column: 21, scope: !24)
!57 = !DILocation(line: 117, column: 19, scope: !24)
!58 = !DILocation(line: 118, column: 13, scope: !24)
!59 = !DILocation(line: 121, column: 32, scope: !24)
!60 = !DILocation(line: 121, column: 21, scope: !24)
!61 = !DILocation(line: 121, column: 19, scope: !24)
!62 = !DILocation(line: 124, column: 9, scope: !24)
!63 = !DILocation(line: 137, column: 17, scope: !24)
!64 = !DILocation(line: 137, column: 24, scope: !24)
!65 = !DILocation(line: 137, column: 15, scope: !24)
!66 = !DILocation(line: 139, column: 9, scope: !24)
!67 = !DILocation(line: 152, column: 24, scope: !24)
!68 = !DILocation(line: 152, column: 15, scope: !24)
!69 = !DILocation(line: 153, column: 29, scope: !24)
!70 = !DILocation(line: 153, column: 36, scope: !24)
!71 = !DILocation(line: 153, column: 27, scope: !24)
!72 = !DILocation(line: 153, column: 26, scope: !24)
!73 = !DILocation(line: 153, column: 15, scope: !24)
!74 = !DILocation(line: 155, column: 28, scope: !24)
!75 = !DILocation(line: 155, column: 17, scope: !24)
!76 = !DILocation(line: 155, column: 15, scope: !24)
!77 = !DILocation(line: 156, column: 15, scope: !24)
!78 = !DILocation(line: 156, column: 19, scope: !24)
!79 = !DILocation(line: 158, column: 31, scope: !24)
!80 = !DILocation(line: 159, column: 15, scope: !24)
!81 = !DILocation(line: 159, column: 22, scope: !24)
!82 = !DILocation(line: 159, column: 31, scope: !24)
!83 = !DILocation(line: 160, column: 35, scope: !24)
!84 = !DILocation(line: 160, column: 15, scope: !24)
!85 = !DILocation(line: 160, column: 22, scope: !24)
!86 = !DILocation(line: 160, column: 31, scope: !24)
!87 = !DILocation(line: 162, column: 20, scope: !24)
!88 = !DILocation(line: 162, column: 27, scope: !24)
!89 = !DILocation(line: 162, column: 36, scope: !24)
!90 = !DILocation(line: 162, column: 48, scope: !24)
!91 = !DILocation(line: 162, column: 19, scope: !24)
!92 = !DILocation(line: 164, column: 35, scope: !24)
!93 = !DILocation(line: 164, column: 25, scope: !24)
!94 = !DILocation(line: 164, column: 23, scope: !24)
!95 = !DILocation(line: 165, column: 17, scope: !24)
!96 = !DILocation(line: 166, column: 13, scope: !24)
!97 = !DILocation(line: 168, column: 9, scope: !24)
!98 = !DILocation(line: 187, column: 13, scope: !24)
!99 = !DILocation(line: 188, column: 9, scope: !24)
!100 = !DILocation(line: 201, column: 28, scope: !24)
!101 = !DILocation(line: 202, column: 28, scope: !24)
!102 = !DILocation(line: 201, column: 17, scope: !24)
!103 = !DILocation(line: 201, column: 15, scope: !24)
!104 = !DILocation(line: 205, column: 9, scope: !24)
!105 = !DILocation(line: 218, column: 28, scope: !24)
!106 = !DILocation(line: 219, column: 28, scope: !24)
!107 = !DILocation(line: 218, column: 17, scope: !24)
!108 = !DILocation(line: 218, column: 15, scope: !24)
!109 = !DILocation(line: 222, column: 9, scope: !24)
!110 = !DILocation(line: 234, column: 28, scope: !24)
!111 = !DILocation(line: 235, column: 28, scope: !24)
!112 = !DILocation(line: 234, column: 17, scope: !24)
!113 = !DILocation(line: 234, column: 15, scope: !24)
!114 = !DILocation(line: 238, column: 9, scope: !24)
!115 = !DILocation(line: 245, column: 28, scope: !24)
!116 = !DILocation(line: 245, column: 50, scope: !24)
!117 = !DILocation(line: 245, column: 17, scope: !24)
!118 = !DILocation(line: 245, column: 15, scope: !24)
!119 = !DILocation(line: 248, column: 9, scope: !24)
!120 = !DILocation(line: 255, column: 28, scope: !24)
!121 = !DILocation(line: 255, column: 52, scope: !24)
!122 = !DILocation(line: 255, column: 17, scope: !24)
!123 = !DILocation(line: 255, column: 15, scope: !24)
!124 = !DILocation(line: 258, column: 9, scope: !24)
!125 = !DILocation(line: 264, column: 28, scope: !24)
!126 = !DILocation(line: 264, column: 17, scope: !24)
!127 = !DILocation(line: 264, column: 15, scope: !24)
!128 = !DILocation(line: 267, column: 9, scope: !24)
!129 = !DILocation(line: 269, column: 9, scope: !24)
!130 = !DILocation(line: 272, column: 10, scope: !24)
!131 = !DILocation(line: 272, column: 3, scope: !24)
!132 = !DILocation(line: 273, column: 1, scope: !24)
!133 = distinct !DISubprogram(name: "fcntl", scope: !13, file: !13, line: 336, type: !14, scopeLine: 337, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!134 = !DILocation(line: 348, column: 3, scope: !133)
!135 = !DILocation(line: 352, column: 21, scope: !133)
!136 = !DILocation(line: 352, column: 9, scope: !133)
!137 = !DILocation(line: 352, column: 7, scope: !133)
!138 = !DILocation(line: 353, column: 7, scope: !133)
!139 = !DILocation(line: 353, column: 11, scope: !133)
!140 = !DILocation(line: 359, column: 25, scope: !133)
!141 = !DILocation(line: 359, column: 32, scope: !133)
!142 = !DILocation(line: 359, column: 13, scope: !133)
!143 = !DILocation(line: 359, column: 11, scope: !133)
!144 = !DILocation(line: 360, column: 19, scope: !133)
!145 = !DILocation(line: 360, column: 7, scope: !133)
!146 = !DILocation(line: 361, column: 5, scope: !133)
!147 = !DILocation(line: 363, column: 7, scope: !133)
!148 = !DILocation(line: 363, column: 11, scope: !133)
!149 = !DILocation(line: 365, column: 7, scope: !133)
!150 = !DILocation(line: 366, column: 11, scope: !133)
!151 = !DILocation(line: 367, column: 5, scope: !133)
!152 = !DILocation(line: 369, column: 3, scope: !133)
!153 = !DILocation(line: 372, column: 10, scope: !133)
!154 = !DILocation(line: 372, column: 3, scope: !133)
