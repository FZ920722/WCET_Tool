; ModuleID = 'unoptimized.ll'
source_filename = "llvm-link"
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
%struct.sem_s = type { i16, i8, %struct.dq_entry_s }
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
%struct.flock = type { i16, i16, i64, i64, i32 }

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @file_fcntl(%struct.file* noundef %0, i32 noundef %1, ...) #0 !dbg !12 {
  %3 = alloca %union.anon, align 4
  %4 = bitcast %union.anon* %3 to i8*, !dbg !16
  call void @llvm.va_start(i8* nonnull %4), !dbg !16
  %5 = bitcast %union.anon* %3 to i32*, !dbg !17
  %.unpack = load i32, i32* %5, align 4, !dbg !17
  %6 = insertvalue [1 x i32] undef, i32 %.unpack, 0, !dbg !17
  %7 = call arm_aapcs_vfpcc i32 @file_vfcntl(%struct.file* noundef %0, i32 noundef %1, [1 x i32] %6) #3, !dbg !17
  %8 = bitcast %union.anon* %3 to i8*, !dbg !18
  call void @llvm.va_end(i8* %8), !dbg !18
  ret i32 %7, !dbg !19
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #1

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc i32 @file_vfcntl(%struct.file* noundef %0, i32 noundef %1, [1 x i32] %2) #0 !dbg !20 {
  %4 = alloca %union.anon, align 4
  %5 = alloca i32, align 4
  %6 = extractvalue [1 x i32] %2, 0
  %7 = bitcast %union.anon* %4 to i32*
  store i32 %6, i32* %7, align 4
  %8 = getelementptr inbounds %struct.file, %struct.file* %0, i32 0, i32 3, !dbg !21
  %9 = load %struct.inode*, %struct.inode** %8, align 8, !dbg !21
  %.not = icmp eq %struct.inode* %9, null, !dbg !22
  br i1 %.not, label %10, label %11, !dbg !23

10:                                               ; preds = %3
  br label %109, !dbg !24

11:                                               ; preds = %3
  switch i32 %1, label %107 [
    i32 0, label %12
    i32 18, label %19
    i32 1, label %26
    i32 8, label %30
    i32 2, label %44
    i32 9, label %47
    i32 5, label %69
    i32 13, label %69
    i32 4, label %70
    i32 11, label %77
    i32 12, label %84
    i32 15, label %91
    i32 19, label %98
    i32 20, label %105
  ], !dbg !25

12:                                               ; preds = %11
  %13 = getelementptr inbounds %union.anon, %union.anon* %4, i32 0, i32 0, !dbg !26
  %14 = load i8*, i8** %13, align 4, !dbg !26
  %15 = getelementptr inbounds i8, i8* %14, i32 4, !dbg !26
  store i8* %15, i8** %13, align 4, !dbg !26
  %16 = bitcast i8* %14 to i32*, !dbg !26
  %17 = load i32, i32* %16, align 4, !dbg !26
  %18 = call arm_aapcs_vfpcc i32 @file_dup(%struct.file* noundef %0, i32 noundef %17, i32 noundef 0) #4, !dbg !27
  br label %108, !dbg !28

19:                                               ; preds = %11
  %20 = getelementptr inbounds %union.anon, %union.anon* %4, i32 0, i32 0, !dbg !29
  %21 = load i8*, i8** %20, align 4, !dbg !29
  %22 = getelementptr inbounds i8, i8* %21, i32 4, !dbg !29
  store i8* %22, i8** %20, align 4, !dbg !29
  %23 = bitcast i8* %21 to i32*, !dbg !29
  %24 = load i32, i32* %23, align 4, !dbg !29
  %25 = call arm_aapcs_vfpcc i32 @file_dup(%struct.file* noundef %0, i32 noundef %24, i32 noundef 1024) #4, !dbg !30
  br label %108, !dbg !31

26:                                               ; preds = %11
  %27 = getelementptr inbounds %struct.file, %struct.file* %0, i32 0, i32 0, !dbg !32
  %28 = load i32, i32* %27, align 8, !dbg !32
  %29 = lshr i32 %28, 10, !dbg !33
  %.lobit7 = and i32 %29, 1, !dbg !33
  br label %108, !dbg !34

30:                                               ; preds = %11
  %31 = getelementptr inbounds %union.anon, %union.anon* %4, i32 0, i32 0, !dbg !35
  %32 = load i8*, i8** %31, align 4, !dbg !35
  %33 = getelementptr inbounds i8, i8* %32, i32 4, !dbg !35
  store i8* %33, i8** %31, align 4, !dbg !35
  %34 = bitcast i8* %32 to i32*, !dbg !35
  %35 = load i32, i32* %34, align 4, !dbg !35
  %.not4 = icmp ult i32 %35, 2, !dbg !36
  br i1 %.not4, label %37, label %36, !dbg !37

36:                                               ; preds = %30
  br label %108, !dbg !38

37:                                               ; preds = %30
  %38 = and i32 %35, 1, !dbg !39
  %.not5 = icmp eq i32 %38, 0, !dbg !39
  br i1 %.not5, label %41, label %39, !dbg !40

39:                                               ; preds = %37
  %40 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %0, i32 noundef 779, i8* noundef null) #4, !dbg !41
  br label %43, !dbg !42

41:                                               ; preds = %37
  %42 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %0, i32 noundef 780, i8* noundef null) #4, !dbg !43
  br label %43

43:                                               ; preds = %41, %39
  %.01 = phi i32 [ %40, %39 ], [ %42, %41 ], !dbg !44
  br label %108, !dbg !45

44:                                               ; preds = %11
  %45 = getelementptr inbounds %struct.file, %struct.file* %0, i32 0, i32 0, !dbg !46
  %46 = load i32, i32* %45, align 8, !dbg !46
  br label %108, !dbg !47

47:                                               ; preds = %11
  %48 = getelementptr inbounds %union.anon, %union.anon* %4, i32 0, i32 0, !dbg !48
  %49 = load i8*, i8** %48, align 4, !dbg !48
  %50 = getelementptr inbounds i8, i8* %49, i32 4, !dbg !48
  store i8* %50, i8** %48, align 4, !dbg !48
  %51 = bitcast i8* %49 to i32*, !dbg !48
  %52 = load i32, i32* %51, align 4, !dbg !48
  %53 = lshr i32 %52, 6, !dbg !49
  %.lobit = and i32 %53, 1, !dbg !49
  store i32 %.lobit, i32* %5, align 4, !dbg !50
  %54 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %0, i32 noundef 778, i32* noundef nonnull %5) #4, !dbg !51
  %55 = icmp eq i32 %54, 0, !dbg !52
  br i1 %55, label %56, label %68, !dbg !53

56:                                               ; preds = %47
  %57 = and i32 %52, 144, !dbg !54
  %58 = getelementptr inbounds %struct.file, %struct.file* %0, i32 0, i32 0, !dbg !55
  %59 = load i32, i32* %58, align 8, !dbg !56
  %60 = and i32 %59, -145, !dbg !56
  %61 = getelementptr inbounds %struct.file, %struct.file* %0, i32 0, i32 0, !dbg !57
  %62 = or i32 %60, %57, !dbg !58
  store i32 %62, i32* %61, align 8, !dbg !58
  %63 = and i32 %52, 16, !dbg !59
  %.not3 = icmp eq i32 %63, 0, !dbg !60
  br i1 %.not3, label %67, label %64, !dbg !61

64:                                               ; preds = %56
  %65 = call arm_aapcs_vfpcc i64 @file_seek(%struct.file* noundef %0, i64 noundef 0, i32 noundef 2) #4, !dbg !62
  %66 = trunc i64 %65 to i32, !dbg !62
  br label %67, !dbg !63

67:                                               ; preds = %64, %56
  %.1 = phi i32 [ %66, %64 ], [ %54, %56 ], !dbg !44
  br label %68, !dbg !64

68:                                               ; preds = %67, %47
  %.2 = phi i32 [ %.1, %67 ], [ %54, %47 ], !dbg !44
  br label %108, !dbg !65

69:                                               ; preds = %11, %11
  br label %108, !dbg !66

70:                                               ; preds = %11
  %71 = getelementptr inbounds %union.anon, %union.anon* %4, i32 0, i32 0, !dbg !67
  %72 = load i8*, i8** %71, align 4, !dbg !67
  %73 = getelementptr inbounds i8, i8* %72, i32 4, !dbg !67
  store i8* %73, i8** %71, align 4, !dbg !67
  %74 = bitcast i8* %72 to %struct.flock**, !dbg !67
  %75 = load %struct.flock*, %struct.flock** %74, align 4, !dbg !67
  %76 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %0, i32 noundef 787, %struct.flock* noundef %75) #4, !dbg !68
  br label %108, !dbg !69

77:                                               ; preds = %11
  %78 = getelementptr inbounds %union.anon, %union.anon* %4, i32 0, i32 0, !dbg !70
  %79 = load i8*, i8** %78, align 4, !dbg !70
  %80 = getelementptr inbounds i8, i8* %79, i32 4, !dbg !70
  store i8* %80, i8** %78, align 4, !dbg !70
  %81 = bitcast i8* %79 to %struct.flock**, !dbg !70
  %82 = load %struct.flock*, %struct.flock** %81, align 4, !dbg !70
  %83 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %0, i32 noundef 786, %struct.flock* noundef %82) #4, !dbg !71
  br label %108, !dbg !72

84:                                               ; preds = %11
  %85 = getelementptr inbounds %union.anon, %union.anon* %4, i32 0, i32 0, !dbg !73
  %86 = load i8*, i8** %85, align 4, !dbg !73
  %87 = getelementptr inbounds i8, i8* %86, i32 4, !dbg !73
  store i8* %87, i8** %85, align 4, !dbg !73
  %88 = bitcast i8* %86 to %struct.flock**, !dbg !73
  %89 = load %struct.flock*, %struct.flock** %88, align 4, !dbg !73
  %90 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %0, i32 noundef 788, %struct.flock* noundef %89) #4, !dbg !74
  br label %108, !dbg !75

91:                                               ; preds = %11
  %92 = getelementptr inbounds %union.anon, %union.anon* %4, i32 0, i32 0, !dbg !76
  %93 = load i8*, i8** %92, align 4, !dbg !76
  %94 = getelementptr inbounds i8, i8* %93, i32 4, !dbg !76
  store i8* %94, i8** %92, align 4, !dbg !76
  %95 = bitcast i8* %93 to i8**, !dbg !76
  %96 = load i8*, i8** %95, align 4, !dbg !76
  %97 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %0, i32 noundef 771, i8* noundef %96) #4, !dbg !77
  br label %108, !dbg !78

98:                                               ; preds = %11
  %99 = getelementptr inbounds %union.anon, %union.anon* %4, i32 0, i32 0, !dbg !79
  %100 = load i8*, i8** %99, align 4, !dbg !79
  %101 = getelementptr inbounds i8, i8* %100, i32 4, !dbg !79
  store i8* %101, i8** %99, align 4, !dbg !79
  %102 = bitcast i8* %100 to i32*, !dbg !79
  %103 = load i32, i32* %102, align 4, !dbg !79
  %104 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %0, i32 noundef 6149, i32 noundef %103) #4, !dbg !80
  br label %108, !dbg !81

105:                                              ; preds = %11
  %106 = call arm_aapcs_vfpcc i32 (%struct.file*, i32, ...) @file_ioctl(%struct.file* noundef %0, i32 noundef 6150) #4, !dbg !82
  br label %108, !dbg !83

107:                                              ; preds = %11
  br label %108, !dbg !84

108:                                              ; preds = %107, %105, %98, %91, %84, %77, %70, %69, %68, %44, %43, %36, %26, %19, %12
  %.3 = phi i32 [ -22, %107 ], [ %106, %105 ], [ %104, %98 ], [ %97, %91 ], [ %90, %84 ], [ %83, %77 ], [ %76, %70 ], [ -9, %69 ], [ %.2, %68 ], [ %46, %44 ], [ -38, %36 ], [ %.01, %43 ], [ %.lobit7, %26 ], [ %25, %19 ], [ %18, %12 ], !dbg !44
  br label %109, !dbg !85

109:                                              ; preds = %108, %10
  %.0 = phi i32 [ %.3, %108 ], [ -9, %10 ], !dbg !44
  ret i32 %.0, !dbg !86
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #1

declare dso_local arm_aapcs_vfpcc i32 @file_dup(%struct.file* noundef, i32 noundef, i32 noundef) #2

declare dso_local arm_aapcs_vfpcc i32 @file_ioctl(%struct.file* noundef, i32 noundef, ...) #2

declare dso_local arm_aapcs_vfpcc i64 @file_seek(%struct.file* noundef, i64 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @fcntl(i32 noundef %0, i32 noundef %1, ...) #0 !dbg !87 {
  %3 = alloca %struct.file*, align 4
  %4 = alloca %union.anon, align 4
  %5 = bitcast %union.anon* %4 to i8*, !dbg !88
  call void @llvm.va_start(i8* nonnull %5), !dbg !88
  %6 = call arm_aapcs_vfpcc i32 @fs_getfilep(i32 noundef %0, %struct.file** noundef nonnull %3) #4, !dbg !89
  %7 = icmp sgt i32 %6, -1, !dbg !90
  br i1 %7, label %8, label %15, !dbg !91

8:                                                ; preds = %2
  %9 = load %struct.file*, %struct.file** %3, align 4, !dbg !92
  %10 = bitcast %union.anon* %4 to i32*, !dbg !93
  %.unpack = load i32, i32* %10, align 4, !dbg !93
  %11 = insertvalue [1 x i32] undef, i32 %.unpack, 0, !dbg !93
  %12 = call arm_aapcs_vfpcc i32 @file_vfcntl(%struct.file* noundef %9, i32 noundef %1, [1 x i32] %11) #3, !dbg !93
  %13 = load %struct.file*, %struct.file** %3, align 4, !dbg !94
  %14 = call arm_aapcs_vfpcc i32 @fs_putfilep(%struct.file* noundef %13) #4, !dbg !95
  br label %15, !dbg !96

15:                                               ; preds = %8, %2
  %.0 = phi i32 [ %12, %8 ], [ %6, %2 ], !dbg !97
  %16 = icmp slt i32 %.0, 0, !dbg !98
  br i1 %16, label %17, label %22, !dbg !99

17:                                               ; preds = %15
  br label %18, !dbg !100

18:                                               ; preds = %17
  %19 = sub nsw i32 0, %.0, !dbg !100
  %20 = call arm_aapcs_vfpcc i32* @__errno() #4, !dbg !100
  store i32 %19, i32* %20, align 4, !dbg !100
  br label %21, !dbg !100

21:                                               ; preds = %18
  br label %22, !dbg !101

22:                                               ; preds = %21, %15
  %.1 = phi i32 [ -1, %21 ], [ %.0, %15 ], !dbg !97
  %23 = bitcast %union.anon* %4 to i8*, !dbg !102
  call void @llvm.va_end(i8* %23), !dbg !102
  ret i32 %.1, !dbg !103
}

declare dso_local arm_aapcs_vfpcc i32 @fs_getfilep(i32 noundef, %struct.file** noundef) #2

declare dso_local arm_aapcs_vfpcc i32 @fs_putfilep(%struct.file* noundef) #2

declare dso_local arm_aapcs_vfpcc i32* @__errno() #2

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #3 = { nobuiltin "no-builtins" }
attributes #4 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!2}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8, !9, !10, !11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c", directory: "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/fcntl/Compile", checksumkind: CSK_MD5, checksum: "82f0ae00e0aeca46555c7e5a196e459f")
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
!12 = distinct !DISubprogram(name: "file_fcntl", scope: !13, file: !13, line: 298, type: !14, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/fs/vfs/fs_fcntl.c", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "82f0ae00e0aeca46555c7e5a196e459f")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 305, column: 3, scope: !12)
!17 = !DILocation(line: 311, column: 9, scope: !12)
!18 = !DILocation(line: 313, column: 3, scope: !12)
!19 = !DILocation(line: 314, column: 3, scope: !12)
!20 = distinct !DISubprogram(name: "file_vfcntl", scope: !13, file: !13, line: 49, type: !14, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!21 = !DILocation(line: 55, column: 15, scope: !20)
!22 = !DILocation(line: 55, column: 8, scope: !20)
!23 = !DILocation(line: 55, column: 7, scope: !20)
!24 = !DILocation(line: 57, column: 7, scope: !20)
!25 = !DILocation(line: 60, column: 3, scope: !20)
!26 = !DILocation(line: 76, column: 33, scope: !20)
!27 = !DILocation(line: 76, column: 17, scope: !20)
!28 = !DILocation(line: 78, column: 9, scope: !20)
!29 = !DILocation(line: 82, column: 33, scope: !20)
!30 = !DILocation(line: 82, column: 17, scope: !20)
!31 = !DILocation(line: 84, column: 9, scope: !20)
!32 = !DILocation(line: 94, column: 24, scope: !20)
!33 = !DILocation(line: 94, column: 17, scope: !20)
!34 = !DILocation(line: 96, column: 9, scope: !20)
!35 = !DILocation(line: 107, column: 24, scope: !20)
!36 = !DILocation(line: 109, column: 22, scope: !20)
!37 = !DILocation(line: 109, column: 15, scope: !20)
!38 = !DILocation(line: 112, column: 15, scope: !20)
!39 = !DILocation(line: 115, column: 22, scope: !20)
!40 = !DILocation(line: 115, column: 15, scope: !20)
!41 = !DILocation(line: 117, column: 21, scope: !20)
!42 = !DILocation(line: 118, column: 13, scope: !20)
!43 = !DILocation(line: 121, column: 21, scope: !20)
!44 = !DILocation(line: 0, scope: !20)
!45 = !DILocation(line: 124, column: 9, scope: !20)
!46 = !DILocation(line: 137, column: 24, scope: !20)
!47 = !DILocation(line: 139, column: 9, scope: !20)
!48 = !DILocation(line: 152, column: 24, scope: !20)
!49 = !DILocation(line: 153, column: 26, scope: !20)
!50 = !DILocation(line: 153, column: 15, scope: !20)
!51 = !DILocation(line: 155, column: 17, scope: !20)
!52 = !DILocation(line: 156, column: 19, scope: !20)
!53 = !DILocation(line: 156, column: 15, scope: !20)
!54 = !DILocation(line: 158, column: 31, scope: !20)
!55 = !DILocation(line: 159, column: 22, scope: !20)
!56 = !DILocation(line: 159, column: 31, scope: !20)
!57 = !DILocation(line: 160, column: 22, scope: !20)
!58 = !DILocation(line: 160, column: 31, scope: !20)
!59 = !DILocation(line: 162, column: 36, scope: !20)
!60 = !DILocation(line: 162, column: 48, scope: !20)
!61 = !DILocation(line: 162, column: 19, scope: !20)
!62 = !DILocation(line: 164, column: 25, scope: !20)
!63 = !DILocation(line: 165, column: 17, scope: !20)
!64 = !DILocation(line: 166, column: 13, scope: !20)
!65 = !DILocation(line: 168, column: 9, scope: !20)
!66 = !DILocation(line: 188, column: 9, scope: !20)
!67 = !DILocation(line: 202, column: 28, scope: !20)
!68 = !DILocation(line: 201, column: 17, scope: !20)
!69 = !DILocation(line: 205, column: 9, scope: !20)
!70 = !DILocation(line: 219, column: 28, scope: !20)
!71 = !DILocation(line: 218, column: 17, scope: !20)
!72 = !DILocation(line: 222, column: 9, scope: !20)
!73 = !DILocation(line: 235, column: 28, scope: !20)
!74 = !DILocation(line: 234, column: 17, scope: !20)
!75 = !DILocation(line: 238, column: 9, scope: !20)
!76 = !DILocation(line: 245, column: 50, scope: !20)
!77 = !DILocation(line: 245, column: 17, scope: !20)
!78 = !DILocation(line: 248, column: 9, scope: !20)
!79 = !DILocation(line: 255, column: 52, scope: !20)
!80 = !DILocation(line: 255, column: 17, scope: !20)
!81 = !DILocation(line: 258, column: 9, scope: !20)
!82 = !DILocation(line: 264, column: 17, scope: !20)
!83 = !DILocation(line: 267, column: 9, scope: !20)
!84 = !DILocation(line: 269, column: 9, scope: !20)
!85 = !DILocation(line: 272, column: 3, scope: !20)
!86 = !DILocation(line: 273, column: 1, scope: !20)
!87 = distinct !DISubprogram(name: "fcntl", scope: !13, file: !13, line: 336, type: !14, scopeLine: 337, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!88 = !DILocation(line: 348, column: 3, scope: !87)
!89 = !DILocation(line: 352, column: 9, scope: !87)
!90 = !DILocation(line: 353, column: 11, scope: !87)
!91 = !DILocation(line: 353, column: 7, scope: !87)
!92 = !DILocation(line: 359, column: 25, scope: !87)
!93 = !DILocation(line: 359, column: 13, scope: !87)
!94 = !DILocation(line: 360, column: 19, scope: !87)
!95 = !DILocation(line: 360, column: 7, scope: !87)
!96 = !DILocation(line: 361, column: 5, scope: !87)
!97 = !DILocation(line: 0, scope: !87)
!98 = !DILocation(line: 363, column: 11, scope: !87)
!99 = !DILocation(line: 363, column: 7, scope: !87)
!100 = !DILocation(line: 365, column: 7, scope: !87)
!101 = !DILocation(line: 367, column: 5, scope: !87)
!102 = !DILocation(line: 369, column: 3, scope: !87)
!103 = !DILocation(line: 372, column: 3, scope: !87)
