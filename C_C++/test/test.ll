; ModuleID = './untest.ll'
source_filename = "test.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv4t-unknown-unknown"

@.str = private unnamed_addr constant [24 x i8] c"Hello, \E9\97\B4\E6\8E\A5\E8\B0\83\E7\94\A8\EF\BC\81\0A\00", align 1

; Function Attrs: noinline nounwind
define dso_local arm_aapcscc void @say_hello() #0 !dbg !12 {
entry:
  %call = call arm_aapcscc i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0)) #2, !dbg !15
  ret void, !dbg !16
}

declare dso_local arm_aapcscc i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind
define dso_local arm_aapcscc void @Func1(i32 noundef %x) #0 !dbg !17 {
entry:
  ret void, !dbg !18
}

; Function Attrs: noinline nounwind
define dso_local arm_aapcscc void @Func2(i32* noundef %x) #0 !dbg !19 {
entry:
  %0 = load i32, i32* %x, align 4, !dbg !20
  %add = add nsw i32 %0, 10, !dbg !21
  store i32 %add, i32* %x, align 4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: noinline nounwind
define dso_local arm_aapcscc i32 @factorial(i32 noundef %n) #0 !dbg !24 {
entry:
  switch i32 %n, label %if.end [
    i32 0, label %return
    i32 1, label %return
  ], !dbg !25

if.end:                                           ; preds = %entry
  %sub = add nsw i32 %n, -1, !dbg !26
  %call = call arm_aapcscc i32 @factorial(i32 noundef %sub) #3, !dbg !27
  %mul = mul nsw i32 %call, %n, !dbg !28
  br label %return, !dbg !29

return:                                           ; preds = %entry, %entry, %if.end
  %retval.0 = phi i32 [ %mul, %if.end ], [ 1, %entry ], [ 1, %entry ], !dbg !30
  ret i32 %retval.0, !dbg !31
}

; Function Attrs: noinline nounwind
define dso_local arm_aapcscc i32 @main() #0 !dbg !32 {
entry:
  ret i32 0, !dbg !33
}

attributes #0 = { noinline nounwind "disable-tail-calls"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm7tdmi" "target-features"="+armv4t,+soft-float,+strict-align,-aes,-bf16,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-sha2,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "use-soft-float"="true" }
attributes #1 = { "disable-tail-calls"="true" "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm7tdmi" "target-features"="+armv4t,+soft-float,+strict-align,-aes,-bf16,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-sha2,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "use-soft-float"="true" }
attributes #2 = { nobuiltin nounwind "no-builtins" }
attributes #3 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.c", directory: "/home/fyj/DiskN/WCET_Tool/C_C++/test", checksumkind: CSK_MD5, checksum: "1728bdf09d5cf58858ed5e3ffba0d7ce")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 1, !"min_enum_size", i32 4}
!6 = !{i32 1, !"branch-target-enforcement", i32 0}
!7 = !{i32 1, !"sign-return-address", i32 0}
!8 = !{i32 1, !"sign-return-address-all", i32 0}
!9 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!12 = distinct !DISubprogram(name: "say_hello", scope: !1, file: !1, line: 3, type: !13, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!13 = !DISubroutineType(types: !14)
!14 = !{}
!15 = !DILocation(line: 4, column: 5, scope: !12)
!16 = !DILocation(line: 5, column: 1, scope: !12)
!17 = distinct !DISubprogram(name: "Func1", scope: !1, file: !1, line: 7, type: !13, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!18 = !DILocation(line: 12, column: 1, scope: !17)
!19 = distinct !DISubprogram(name: "Func2", scope: !1, file: !1, line: 14, type: !13, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!20 = !DILocation(line: 15, column: 14, scope: !19)
!21 = !DILocation(line: 15, column: 19, scope: !19)
!22 = !DILocation(line: 15, column: 11, scope: !19)
!23 = !DILocation(line: 19, column: 1, scope: !19)
!24 = distinct !DISubprogram(name: "factorial", scope: !1, file: !1, line: 28, type: !13, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!25 = !DILocation(line: 29, column: 16, scope: !24)
!26 = !DILocation(line: 32, column: 28, scope: !24)
!27 = !DILocation(line: 32, column: 16, scope: !24)
!28 = !DILocation(line: 32, column: 14, scope: !24)
!29 = !DILocation(line: 32, column: 5, scope: !24)
!30 = !DILocation(line: 0, scope: !24)
!31 = !DILocation(line: 33, column: 1, scope: !24)
!32 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 35, type: !13, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!33 = !DILocation(line: 64, column: 5, scope: !32)
