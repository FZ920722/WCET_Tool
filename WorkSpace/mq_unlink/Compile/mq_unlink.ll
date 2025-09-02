; ModuleID = '/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_unlink.c'
source_filename = "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_unlink.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-unknown"

%struct.inode = type { %struct.inode*, %struct.inode*, %struct.inode*, i16, i16, %union.inode_ops_u, i16, i8*, [1 x i8] }
%union.inode_ops_u = type { %struct.file_operations* }
%struct.file_operations = type { i32 (%struct.file*)*, i32 (%struct.file*)*, i32 (%struct.file*, i8*, i32)*, i32 (%struct.file*, i8*, i32)*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.mm_map_entry_s*)*, i32 (%struct.file*, i64)*, i32 (%struct.file*, %struct.pollfd*, i1)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.file*, %struct.uio*)*, i32 (%struct.inode*)* }
%struct.file = type { i32, i32, i64, %struct.inode*, i8*, i64, i8, i8 }
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
%struct.inode_search_s = type { i8*, %struct.inode*, %struct.inode*, %struct.inode*, i8*, i8*, i8 }
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

@.str = private unnamed_addr constant [15 x i8] c"/var/mqueue/%s\00", align 1
@.str.1 = private unnamed_addr constant [79 x i8] c"/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_unlink.c\00", align 1

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @file_mq_unlink(i8* noundef %0) #0 !dbg !12 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 4
  %4 = alloca %struct.inode*, align 4
  %5 = alloca %struct.inode_search_s, align 4
  %6 = alloca [64 x i8], align 1
  %7 = alloca i32, align 4
  store i8* %0, i8** %3, align 4
  %8 = getelementptr inbounds [64 x i8], [64 x i8]* %6, i32 0, i32 0, !dbg !16
  %9 = load i8*, i8** %3, align 4, !dbg !17
  %10 = call arm_aapcs_vfpcc i32 (i8*, i32, i8*, ...) @snprintf(i8* noundef %8, i32 noundef 64, i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* noundef %9) #3, !dbg !18
  br label %11, !dbg !19

11:                                               ; preds = %1
  %12 = getelementptr inbounds [64 x i8], [64 x i8]* %6, i32 0, i32 0, !dbg !19
  %13 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 0, !dbg !19
  store i8* %12, i8** %13, align 4, !dbg !19
  %14 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 1, !dbg !19
  store %struct.inode* null, %struct.inode** %14, align 4, !dbg !19
  %15 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 2, !dbg !19
  store %struct.inode* null, %struct.inode** %15, align 4, !dbg !19
  %16 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 3, !dbg !19
  store %struct.inode* null, %struct.inode** %16, align 4, !dbg !19
  %17 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 4, !dbg !19
  store i8* null, i8** %17, align 4, !dbg !19
  %18 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 5, !dbg !19
  store i8* null, i8** %18, align 4, !dbg !19
  %19 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 6, !dbg !19
  store i8 0, i8* %19, align 4, !dbg !19
  br label %20, !dbg !19

20:                                               ; preds = %11
  %21 = call arm_aapcs_vfpcc i32 @inode_find(%struct.inode_search_s* noundef %5) #3, !dbg !20
  store i32 %21, i32* %7, align 4, !dbg !21
  %22 = load i32, i32* %7, align 4, !dbg !22
  %23 = icmp slt i32 %22, 0, !dbg !23
  br i1 %23, label %24, label %25, !dbg !22

24:                                               ; preds = %20
  br label %72, !dbg !24

25:                                               ; preds = %20
  %26 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 1, !dbg !25
  %27 = load %struct.inode*, %struct.inode** %26, align 4, !dbg !25
  store %struct.inode* %27, %struct.inode** %4, align 4, !dbg !26
  %28 = load %struct.inode*, %struct.inode** %4, align 4, !dbg !27
  %29 = getelementptr inbounds %struct.inode, %struct.inode* %28, i32 0, i32 4, !dbg !27
  %30 = load i16, i16* %29, align 2, !dbg !27
  %31 = zext i16 %30 to i32, !dbg !27
  %32 = and i32 %31, 15, !dbg !27
  %33 = icmp eq i32 %32, 5, !dbg !27
  br i1 %33, label %35, label %34, !dbg !28

34:                                               ; preds = %25
  store i32 -6, i32* %7, align 4, !dbg !29
  br label %70, !dbg !30

35:                                               ; preds = %25
  call arm_aapcs_vfpcc void @inode_lock() #3, !dbg !31
  %36 = load %struct.inode*, %struct.inode** %4, align 4, !dbg !32
  %37 = getelementptr inbounds %struct.inode, %struct.inode* %36, i32 0, i32 2, !dbg !33
  %38 = load %struct.inode*, %struct.inode** %37, align 4, !dbg !33
  %39 = icmp ne %struct.inode* %38, null, !dbg !34
  br i1 %39, label %40, label %41, !dbg !32

40:                                               ; preds = %35
  store i32 -39, i32* %7, align 4, !dbg !35
  br label %69, !dbg !36

41:                                               ; preds = %35
  %42 = getelementptr inbounds [64 x i8], [64 x i8]* %6, i32 0, i32 0, !dbg !37
  %43 = call arm_aapcs_vfpcc i32 @inode_remove(i8* noundef %42) #3, !dbg !38
  store i32 %43, i32* %7, align 4, !dbg !39
  %44 = load i32, i32* %7, align 4, !dbg !40
  %45 = icmp sge i32 %44, 0, !dbg !40
  br i1 %45, label %49, label %46, !dbg !40

46:                                               ; preds = %41
  %47 = load i32, i32* %7, align 4, !dbg !40
  %48 = icmp eq i32 %47, -16, !dbg !40
  br label %49, !dbg !40

49:                                               ; preds = %46, %41
  %50 = phi i1 [ true, %41 ], [ %48, %46 ]
  %51 = xor i1 %50, true, !dbg !40
  %52 = xor i1 %51, true, !dbg !40
  %53 = xor i1 %52, true, !dbg !40
  br i1 %53, label %54, label %56, !dbg !40

54:                                               ; preds = %49
  call arm_aapcs_vfpcc void @__assert(i8* noundef getelementptr inbounds ([79 x i8], [79 x i8]* @.str.1, i32 0, i32 0), i32 noundef 161, i8* noundef null) #4, !dbg !40
  unreachable, !dbg !40

55:                                               ; No predecessors!
  br label %57, !dbg !40

56:                                               ; preds = %49
  br label %57, !dbg !40

57:                                               ; preds = %56, %55
  call arm_aapcs_vfpcc void @inode_unlock() #3, !dbg !41
  %58 = load %struct.inode*, %struct.inode** %4, align 4, !dbg !42
  call arm_aapcs_vfpcc void @mq_inode_release(%struct.inode* noundef %58) #3, !dbg !43
  br label %59, !dbg !44

59:                                               ; preds = %57
  %60 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 5, !dbg !44
  %61 = load i8*, i8** %60, align 4, !dbg !44
  %62 = icmp ne i8* %61, null, !dbg !44
  br i1 %62, label %63, label %67, !dbg !44

63:                                               ; preds = %59
  %64 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 5, !dbg !44
  %65 = load i8*, i8** %64, align 4, !dbg !44
  call arm_aapcs_vfpcc void @free(i8* noundef %65) #3, !dbg !44
  %66 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 5, !dbg !44
  store i8* null, i8** %66, align 4, !dbg !44
  br label %67, !dbg !44

67:                                               ; preds = %63, %59
  br label %68, !dbg !44

68:                                               ; preds = %67
  store i32 0, i32* %2, align 4, !dbg !45
  br label %84, !dbg !45

69:                                               ; preds = %40
  call arm_aapcs_vfpcc void @inode_unlock() #3, !dbg !46
  br label %70, !dbg !46

70:                                               ; preds = %69, %34
  %71 = load %struct.inode*, %struct.inode** %4, align 4, !dbg !47
  call arm_aapcs_vfpcc void @inode_release(%struct.inode* noundef %71) #3, !dbg !48
  br label %72, !dbg !48

72:                                               ; preds = %70, %24
  br label %73, !dbg !49

73:                                               ; preds = %72
  %74 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 5, !dbg !49
  %75 = load i8*, i8** %74, align 4, !dbg !49
  %76 = icmp ne i8* %75, null, !dbg !49
  br i1 %76, label %77, label %81, !dbg !49

77:                                               ; preds = %73
  %78 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 5, !dbg !49
  %79 = load i8*, i8** %78, align 4, !dbg !49
  call arm_aapcs_vfpcc void @free(i8* noundef %79) #3, !dbg !49
  %80 = getelementptr inbounds %struct.inode_search_s, %struct.inode_search_s* %5, i32 0, i32 5, !dbg !49
  store i8* null, i8** %80, align 4, !dbg !49
  br label %81, !dbg !49

81:                                               ; preds = %77, %73
  br label %82, !dbg !49

82:                                               ; preds = %81
  %83 = load i32, i32* %7, align 4, !dbg !50
  store i32 %83, i32* %2, align 4, !dbg !51
  br label %84, !dbg !51

84:                                               ; preds = %82, %68
  %85 = load i32, i32* %2, align 4, !dbg !52
  ret i32 %85, !dbg !52
}

declare dso_local arm_aapcs_vfpcc i32 @snprintf(i8* noundef, i32 noundef, i8* noundef, ...) #1

declare dso_local arm_aapcs_vfpcc i32 @inode_find(%struct.inode_search_s* noundef) #1

declare dso_local arm_aapcs_vfpcc void @inode_lock() #1

declare dso_local arm_aapcs_vfpcc i32 @inode_remove(i8* noundef) #1

; Function Attrs: noreturn
declare dso_local arm_aapcs_vfpcc void @__assert(i8* noundef, i32 noundef, i8* noundef) #2

declare dso_local arm_aapcs_vfpcc void @inode_unlock() #1

; Function Attrs: noinline nounwind
define internal arm_aapcs_vfpcc void @mq_inode_release(%struct.inode* noundef %0) #0 !dbg !53 {
  %2 = alloca %struct.inode*, align 4
  %3 = alloca i16, align 2
  %4 = alloca %struct.mqueue_inode_s*, align 4
  store %struct.inode* %0, %struct.inode** %2, align 4
  %5 = load %struct.inode*, %struct.inode** %2, align 4, !dbg !54
  %6 = getelementptr inbounds %struct.inode, %struct.inode* %5, i32 0, i32 3, !dbg !54
  %7 = load atomic i16, i16* %6 seq_cst, align 4, !dbg !54
  store i16 %7, i16* %3, align 2, !dbg !54
  %8 = load i16, i16* %3, align 2, !dbg !54
  %9 = sext i16 %8 to i32, !dbg !54
  %10 = icmp sle i32 %9, 1, !dbg !55
  br i1 %10, label %11, label %23, !dbg !54

11:                                               ; preds = %1
  %12 = load %struct.inode*, %struct.inode** %2, align 4, !dbg !56
  %13 = getelementptr inbounds %struct.inode, %struct.inode* %12, i32 0, i32 7, !dbg !57
  %14 = load i8*, i8** %13, align 4, !dbg !57
  %15 = bitcast i8* %14 to %struct.mqueue_inode_s*, !dbg !56
  store %struct.mqueue_inode_s* %15, %struct.mqueue_inode_s** %4, align 4, !dbg !58
  %16 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %4, align 4, !dbg !59
  %17 = icmp ne %struct.mqueue_inode_s* %16, null, !dbg !59
  br i1 %17, label %18, label %22, !dbg !59

18:                                               ; preds = %11
  %19 = load %struct.mqueue_inode_s*, %struct.mqueue_inode_s** %4, align 4, !dbg !60
  call arm_aapcs_vfpcc void @nxmq_free_msgq(%struct.mqueue_inode_s* noundef %19) #3, !dbg !61
  %20 = load %struct.inode*, %struct.inode** %2, align 4, !dbg !62
  %21 = getelementptr inbounds %struct.inode, %struct.inode* %20, i32 0, i32 7, !dbg !63
  store i8* null, i8** %21, align 4, !dbg !64
  br label %22, !dbg !65

22:                                               ; preds = %18, %11
  br label %23, !dbg !66

23:                                               ; preds = %22, %1
  %24 = load %struct.inode*, %struct.inode** %2, align 4, !dbg !67
  call arm_aapcs_vfpcc void @inode_release(%struct.inode* noundef %24) #3, !dbg !68
  ret void, !dbg !69
}

declare dso_local arm_aapcs_vfpcc void @free(i8* noundef) #1

declare dso_local arm_aapcs_vfpcc void @inode_release(%struct.inode* noundef) #1

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @nxmq_unlink(i8* noundef %0) #0 !dbg !70 {
  %2 = alloca i8*, align 4
  store i8* %0, i8** %2, align 4
  %3 = load i8*, i8** %2, align 4, !dbg !71
  %4 = call arm_aapcs_vfpcc i32 @file_mq_unlink(i8* noundef %3) #3, !dbg !72
  ret i32 %4, !dbg !73
}

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @mq_unlink(i8* noundef %0) #0 !dbg !74 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 4
  %5 = load i8*, i8** %3, align 4, !dbg !75
  %6 = call arm_aapcs_vfpcc i32 @nxmq_unlink(i8* noundef %5) #3, !dbg !76
  store i32 %6, i32* %4, align 4, !dbg !77
  %7 = load i32, i32* %4, align 4, !dbg !78
  %8 = icmp slt i32 %7, 0, !dbg !79
  br i1 %8, label %9, label %15, !dbg !78

9:                                                ; preds = %1
  br label %10, !dbg !80

10:                                               ; preds = %9
  %11 = load i32, i32* %4, align 4, !dbg !80
  %12 = sub nsw i32 0, %11, !dbg !80
  %13 = call arm_aapcs_vfpcc i32* @__errno() #3, !dbg !80
  store i32 %12, i32* %13, align 4, !dbg !80
  br label %14, !dbg !80

14:                                               ; preds = %10
  store i32 -1, i32* %2, align 4, !dbg !81
  br label %16, !dbg !81

15:                                               ; preds = %1
  store i32 0, i32* %2, align 4, !dbg !82
  br label %16, !dbg !82

16:                                               ; preds = %15, %14
  %17 = load i32, i32* %2, align 4, !dbg !83
  ret i32 %17, !dbg !83
}

declare dso_local arm_aapcs_vfpcc i32* @__errno() #1

declare dso_local arm_aapcs_vfpcc void @nxmq_free_msgq(%struct.mqueue_inode_s* noundef) #1

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #2 = { noreturn "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,+vfp3d16,+vfp3d16sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #3 = { nobuiltin "no-builtins" }
attributes #4 = { nobuiltin noreturn "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/Desktop/data/1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_unlink.c", directory: "/home/fyj/Desktop/data/WCET_Tool/WorkSpace/mq_unlink/Compile", checksumkind: CSK_MD5, checksum: "f08e37e3ca1022bc9b033dbf2afc8449")
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
!12 = distinct !DISubprogram(name: "file_mq_unlink", scope: !13, file: !13, line: 102, type: !14, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "1_WCETSpace/vela-opensource/nuttx/fs/mqueue/mq_unlink.c", directory: "/home/fyj/Desktop/data", checksumkind: CSK_MD5, checksum: "f08e37e3ca1022bc9b033dbf2afc8449")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 111, column: 12, scope: !12)
!17 = !DILocation(line: 112, column: 45, scope: !12)
!18 = !DILocation(line: 111, column: 3, scope: !12)
!19 = !DILocation(line: 116, column: 3, scope: !12)
!20 = !DILocation(line: 118, column: 9, scope: !12)
!21 = !DILocation(line: 118, column: 7, scope: !12)
!22 = !DILocation(line: 119, column: 7, scope: !12)
!23 = !DILocation(line: 119, column: 11, scope: !12)
!24 = !DILocation(line: 123, column: 7, scope: !12)
!25 = !DILocation(line: 128, column: 16, scope: !12)
!26 = !DILocation(line: 128, column: 9, scope: !12)
!27 = !DILocation(line: 132, column: 8, scope: !12)
!28 = !DILocation(line: 132, column: 7, scope: !12)
!29 = !DILocation(line: 134, column: 11, scope: !12)
!30 = !DILocation(line: 135, column: 7, scope: !12)
!31 = !DILocation(line: 142, column: 3, scope: !12)
!32 = !DILocation(line: 143, column: 7, scope: !12)
!33 = !DILocation(line: 143, column: 14, scope: !12)
!34 = !DILocation(line: 143, column: 22, scope: !12)
!35 = !DILocation(line: 145, column: 11, scope: !12)
!36 = !DILocation(line: 146, column: 7, scope: !12)
!37 = !DILocation(line: 154, column: 22, scope: !12)
!38 = !DILocation(line: 154, column: 9, scope: !12)
!39 = !DILocation(line: 154, column: 7, scope: !12)
!40 = !DILocation(line: 161, column: 3, scope: !12)
!41 = !DILocation(line: 171, column: 3, scope: !12)
!42 = !DILocation(line: 172, column: 20, scope: !12)
!43 = !DILocation(line: 172, column: 3, scope: !12)
!44 = !DILocation(line: 173, column: 3, scope: !12)
!45 = !DILocation(line: 177, column: 3, scope: !12)
!46 = !DILocation(line: 180, column: 3, scope: !12)
!47 = !DILocation(line: 183, column: 17, scope: !12)
!48 = !DILocation(line: 183, column: 3, scope: !12)
!49 = !DILocation(line: 186, column: 3, scope: !12)
!50 = !DILocation(line: 187, column: 10, scope: !12)
!51 = !DILocation(line: 187, column: 3, scope: !12)
!52 = !DILocation(line: 188, column: 1, scope: !12)
!53 = distinct !DISubprogram(name: "mq_inode_release", scope: !13, file: !13, line: 59, type: !14, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!54 = !DILocation(line: 61, column: 7, scope: !53)
!55 = !DILocation(line: 61, column: 36, scope: !53)
!56 = !DILocation(line: 63, column: 41, scope: !53)
!57 = !DILocation(line: 63, column: 48, scope: !53)
!58 = !DILocation(line: 63, column: 34, scope: !53)
!59 = !DILocation(line: 65, column: 11, scope: !53)
!60 = !DILocation(line: 67, column: 26, scope: !53)
!61 = !DILocation(line: 67, column: 11, scope: !53)
!62 = !DILocation(line: 68, column: 11, scope: !53)
!63 = !DILocation(line: 68, column: 18, scope: !53)
!64 = !DILocation(line: 68, column: 28, scope: !53)
!65 = !DILocation(line: 69, column: 9, scope: !53)
!66 = !DILocation(line: 70, column: 5, scope: !53)
!67 = !DILocation(line: 72, column: 17, scope: !53)
!68 = !DILocation(line: 72, column: 3, scope: !53)
!69 = !DILocation(line: 73, column: 1, scope: !53)
!70 = distinct !DISubprogram(name: "nxmq_unlink", scope: !13, file: !13, line: 213, type: !14, scopeLine: 214, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!71 = !DILocation(line: 215, column: 25, scope: !70)
!72 = !DILocation(line: 215, column: 10, scope: !70)
!73 = !DILocation(line: 215, column: 3, scope: !70)
!74 = distinct !DISubprogram(name: "mq_unlink", scope: !13, file: !13, line: 237, type: !14, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!75 = !DILocation(line: 241, column: 21, scope: !74)
!76 = !DILocation(line: 241, column: 9, scope: !74)
!77 = !DILocation(line: 241, column: 7, scope: !74)
!78 = !DILocation(line: 242, column: 7, scope: !74)
!79 = !DILocation(line: 242, column: 11, scope: !74)
!80 = !DILocation(line: 244, column: 7, scope: !74)
!81 = !DILocation(line: 245, column: 7, scope: !74)
!82 = !DILocation(line: 248, column: 3, scope: !74)
!83 = !DILocation(line: 249, column: 1, scope: !74)
