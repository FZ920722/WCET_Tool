; ModuleID = 'test.c'
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
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4, !dbg !18
  %add = add nsw i32 %0, 10, !dbg !19
  store i32 %add, i32* %x.addr, align 4, !dbg !20
  ret void, !dbg !21
}

; Function Attrs: noinline nounwind
define dso_local arm_aapcscc void @Func2(i32* noundef %x) #0 !dbg !22 {
entry:
  %x.addr = alloca i32*, align 4
  store i32* %x, i32** %x.addr, align 4
  %0 = load i32*, i32** %x.addr, align 4, !dbg !23
  %1 = load i32, i32* %0, align 4, !dbg !24
  %add = add nsw i32 %1, 10, !dbg !25
  %2 = load i32*, i32** %x.addr, align 4, !dbg !26
  store i32 %add, i32* %2, align 4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: noinline nounwind
define dso_local arm_aapcscc i32 @factorial(i32 noundef %n) #0 !dbg !29 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 0, !dbg !31
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !32

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4, !dbg !33
  %cmp1 = icmp eq i32 %1, 1, !dbg !34
  br i1 %cmp1, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4, !dbg !35
  br label %return, !dbg !35

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32, i32* %n.addr, align 4, !dbg !36
  %3 = load i32, i32* %n.addr, align 4, !dbg !37
  %sub = sub nsw i32 %3, 1, !dbg !38
  %call = call arm_aapcscc i32 @factorial(i32 noundef %sub) #2, !dbg !39
  %mul = mul nsw i32 %2, %call, !dbg !40
  store i32 %mul, i32* %retval, align 4, !dbg !41
  br label %return, !dbg !41

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !42
  ret i32 %4, !dbg !42
}

; Function Attrs: noinline nounwind
define dso_local arm_aapcscc i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %num = alloca i32, align 4
  %x = alloca i32, align 4
  %func_ptr = alloca void (...)*, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 5, i32* %num, align 4, !dbg !44
  %0 = load i32, i32* %num, align 4, !dbg !45
  %call = call arm_aapcscc i32 @factorial(i32 noundef %0) #2, !dbg !46
  store i32 %call, i32* %x, align 4, !dbg !47
  store void (...)* null, void (...)** %func_ptr, align 4, !dbg !48
  store void (...)* bitcast (void ()* @say_hello to void (...)*), void (...)** %func_ptr, align 4, !dbg !49
  %1 = load void (...)*, void (...)** %func_ptr, align 4, !dbg !50
  %callee.knr.cast = bitcast void (...)* %1 to void ()*, !dbg !50
  call arm_aapcscc void %callee.knr.cast() #2, !dbg !50
  store i32 1, i32* %y, align 4, !dbg !51
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.cond, %entry
  %2 = load i32, i32* %y, align 4, !dbg !53
  %add = add nsw i32 %2, 1, !dbg !53
  store i32 %add, i32* %y, align 4, !dbg !53
  br label %for.cond, !dbg !52, !llvm.loop !54
}

attributes #0 = { noinline nounwind "disable-tail-calls"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm7tdmi" "target-features"="+armv4t,+soft-float,+strict-align,-aes,-bf16,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-sha2,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "use-soft-float"="true" }
attributes #1 = { "disable-tail-calls"="true" "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm7tdmi" "target-features"="+armv4t,+soft-float,+strict-align,-aes,-bf16,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve,-mve.fp,-neon,-sha2,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" "use-soft-float"="true" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.c", directory: "/home/fyj/DiskN/WCET_Tool/C_C++", checksumkind: CSK_MD5, checksum: "824931c9fe6fa521db0735be2a80bd43")
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
!18 = !DILocation(line: 8, column: 9, scope: !17)
!19 = !DILocation(line: 8, column: 11, scope: !17)
!20 = !DILocation(line: 8, column: 7, scope: !17)
!21 = !DILocation(line: 12, column: 1, scope: !17)
!22 = distinct !DISubprogram(name: "Func2", scope: !1, file: !1, line: 14, type: !13, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!23 = !DILocation(line: 15, column: 16, scope: !22)
!24 = !DILocation(line: 15, column: 14, scope: !22)
!25 = !DILocation(line: 15, column: 19, scope: !22)
!26 = !DILocation(line: 15, column: 8, scope: !22)
!27 = !DILocation(line: 15, column: 11, scope: !22)
!28 = !DILocation(line: 19, column: 1, scope: !22)
!29 = distinct !DISubprogram(name: "factorial", scope: !1, file: !1, line: 28, type: !13, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!30 = !DILocation(line: 29, column: 9, scope: !29)
!31 = !DILocation(line: 29, column: 11, scope: !29)
!32 = !DILocation(line: 29, column: 16, scope: !29)
!33 = !DILocation(line: 29, column: 19, scope: !29)
!34 = !DILocation(line: 29, column: 21, scope: !29)
!35 = !DILocation(line: 30, column: 9, scope: !29)
!36 = !DILocation(line: 32, column: 12, scope: !29)
!37 = !DILocation(line: 32, column: 26, scope: !29)
!38 = !DILocation(line: 32, column: 28, scope: !29)
!39 = !DILocation(line: 32, column: 16, scope: !29)
!40 = !DILocation(line: 32, column: 14, scope: !29)
!41 = !DILocation(line: 32, column: 5, scope: !29)
!42 = !DILocation(line: 33, column: 1, scope: !29)
!43 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 35, type: !13, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!44 = !DILocation(line: 36, column: 9, scope: !43)
!45 = !DILocation(line: 37, column: 23, scope: !43)
!46 = !DILocation(line: 37, column: 13, scope: !43)
!47 = !DILocation(line: 37, column: 9, scope: !43)
!48 = !DILocation(line: 48, column: 12, scope: !43)
!49 = !DILocation(line: 51, column: 14, scope: !43)
!50 = !DILocation(line: 54, column: 5, scope: !43)
!51 = !DILocation(line: 56, column: 9, scope: !43)
!52 = !DILocation(line: 57, column: 5, scope: !43)
!53 = !DILocation(line: 58, column: 11, scope: !43)
!54 = distinct !{!54, !52, !55}
!55 = !DILocation(line: 59, column: 5, scope: !43)
