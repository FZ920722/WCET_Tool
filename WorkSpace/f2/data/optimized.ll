; ModuleID = 'unoptimized.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv4t-unknown-unknown"

@g_system_ticks = external dso_local global i32, align 4

; Function Attrs: noinline nounwind
define dso_local arm_aapcs_vfpcc i32 @clock() #0 !dbg !12 {
entry:
  %0 = load volatile i32, i32* @g_system_ticks, align 4, !dbg !16
  ret i32 %0, !dbg !17
}

attributes #0 = { noinline nounwind "disable-tail-calls"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm7tdmi" "target-features"="+armv4t,+strict-align,-aes,-bf16,-d32,-dotprod,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fp64,-fpregs,-fullfp16,-mve.fp,-neon,-sha2,-thumb-mode,-vfp2,-vfp2sp,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!2}
!llvm.module.flags = !{!3, !4, !5, !6, !7, !8, !9, !10, !11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (https://gitee.com/zzmmma/tam.git da2a436da583758d7c610dada3fa3f35c8d35100)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/fyj/DiskD/WCET_Tool/WorkSpace/f2/clock.c", directory: "/home/fyj/DiskD/tam/testcases/tam_0guhdu4p", checksumkind: CSK_MD5, checksum: "6604e06540a8da2053884a014a279e25")
!2 = !{!"clang version 14.0.6 (https://gitee.com/zzmmma/tam.git da2a436da583758d7c610dada3fa3f35c8d35100)"}
!3 = !{i32 7, !"Dwarf Version", i32 5}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 1, !"min_enum_size", i32 4}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = distinct !DISubprogram(name: "clock", scope: !13, file: !13, line: 63, type: !14, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!13 = !DIFile(filename: "WCET_Tool/WorkSpace/f2/clock.c", directory: "/home/fyj/DiskD", checksumkind: CSK_MD5, checksum: "6604e06540a8da2053884a014a279e25")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 65, column: 19, scope: !12)
!17 = !DILocation(line: 65, column: 3, scope: !12)
