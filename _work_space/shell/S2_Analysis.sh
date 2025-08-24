# !/bin/bash 
set -e -u -o pipefail

export SOUR_DIR=$1     # 1 —— 源代码地址
export HEAD_DIR=$2     # 2 —— 头文件地址
export ANAL_DIR=$3     # 3 —— 编译工作区；

# ### (1) 参数配置 ### #
export ENTRYPOINT="main"
export MEM_Latency=100

L1I_Assoc=8
L1I_Nsets=128
L1I_Linesize=64

L1D_Assoc=8
L1D_Nsets=128
L1D_Linesize=64

L2C_Assoc=8
L2C_Nsets=1024
L2C_Linesize=64

# ### (2) 指令配置 ### #
LLVMTA_INSTRUCT=""

LLVMTA_INSTRUCT+="-O0 "
# LLVMTA_INSTRUCT+="-O0-disable-O0-optnone "
LLVMTA_INSTRUCT+="-float-abi=hard "
LLVMTA_INSTRUCT+="-mattr=-neon,+vfp2 "
LLVMTA_INSTRUCT+="-disable-tail-calls "
# LLVMTA_INSTRUCT+="-mcpu=arm7tdmi "
# LLVMTA_INSTRUCT+="-debug-only= "
# -debug-only=all 
# --debug-entry-values

# 一、 LLVMTA General Options:
# LLVMTA_INSTRUCT+="--ta-ana-type=timing "                  # 1.
# LLVMTA_INSTRUCT+="--ta-anainfo-policy=precompall "        # 2.
LLVMTA_INSTRUCT+="--ta-analysis-entry-point=$ENTRYPOINT "   # 3.  Run WCET Analysis itself 针对每个入口函数:
# LLVMTA_INSTRUCT+="--ta-comp-type= "                       # 4.  会报错放弃  #  icache,dcache,dramrefresh,sharedbusblocking
# LLVMTA_INSTRUCT+="--ta-compana-joint-ilp=true "           # 5.
# LLVMTA_INSTRUCT+="--ta-compana-joint-ilp "
# LLVMTA_INSTRUCT+="--ta-enable-fixpoint-checks=true " # 6.
# LLVMTA_INSTRUCT+="--ta-enable-muarchjoin=true "      # 7.
# LLVMTA_INSTRUCT+="--ta-follow-localwc=<value> "      # 8.  选择要专门跟踪的本地最坏情况
# LLVMTA_INSTRUCT+="--ta-metric-wcep=<value> "         # 9.  在最坏情况时间路径上需要最大化的指标
# LLVMTA_INSTRUCT+="--ta-metric-max=<value> "          # 10. 除时间外需要最大化的指标
# LLVMTA_INSTRUCT+="--ta-pathana-type=<value> "        # 11. 选择路径分析类型，默认为'simpleilp'（简单ILP解决方案）
LLVMTA_INSTRUCT+="--ta-pathana-type=graphilp "
# LLVMTA_INSTRUCT+="--ta-quiet "                       # 12. 静默模式(不报告进度，不转储详细分析信息) 
# LLVMTA_INSTRUCT+="--ta-restart-after-external"       # 13. 外部函数调用后重置微架构状态(默认false)
# LLVMTA_INSTRUCT+="--ta-start-address-code=<uint>"    # 14. 二进制文件中代码段的起始地址
LLVMTA_INSTRUCT+="--ta-strict=false "                  # 15. 启用严格模式(遇到未知情况时断言，默认true， true可能报错)；
# LLVMTA_INSTRUCT+="--ta-ucb-clever=true"              # 16. 启用更精确处理空间局部性的 UCB 模式 (默认false)；
# 1. 求解器相关；
LLVMTA_INSTRUCT+="--ta-lpsolver=gurobi "               # 1.1 路径分析中的LP求解器选择
LLVMTA_INSTRUCT+="--ta-lpsolver-effort=maximal "       # 1.2 LP求解器求解精度
# 2. 输出文件：
# --ta-dumpb-vcg-graph                    # 2.1 以VCG格式转储状态图(默认为.dot格式)
# --ta-output-unknown-extfuncs            # 2.2 输出外部函数注解模板文件(默认false)
# --ta-output-unknown-loops               # 2.3 输出循环注解文件(默认false)
# 3. 输入文件：
# --ta-loop-bounds-file=<string>          # 3.1.包含循环界限的文件路径
# --ta-loop-lowerbounds-file=<string>     # 3.2.包含循环下界的文件路径
# --ta-extfunc-annotation-file=<string>   # 3.3.外部函数注解文件路径
# 4. Cache的持久性配置: elementwise; conditionalmust;
LLVMTA_INSTRUCT+="--ta-icache-persistence=conditionalmust "
LLVMTA_INSTRUCT+="--ta-dcache-persistence=conditionalmust "
LLVMTA_INSTRUCT+="--ta-l2cache-persistence=conditionalmust "
# --ta-l2cache-persistence=elementwise \

# 5. 抢占：
# --ta-preemption-dcache-budget=<uint>              # 5.1 抢占可能导致的数据缓存未命中额外数量(默认0)
# --ta-preemption-icache-budget=<uint>              # 5.2 抢占可能导致的指令缓存未命中额外数量(默认0)
# --ta-preemptive                                   # 5.3 被分析程序是否可被抢占(默认false)
# --ta-calculate-slope-interference-curve=<value>   # 5.4. 计算干扰响应曲线的线性近似斜率
# --ta-compositional-base-bound=<value>             # 5.5.启用组合基础界限计算
# --ta-dump-interference-response-curve=<value>     # 5.6.转储干扰响应曲线
# 6. 寄存器地址：
# --ta-initial-link-register=<uint>                 # 6.1 初始链接寄存器值(默认0x00000000)
# --ta-initial-stack-pointer=<uint>                 # 6.2 初始栈指针(默认0x08000000)

# 二、 Context Sensitivity Options:
# --ta-loop-peel=<uint>                             # 1. 指定在跟踪分区期间要区分的初始循环迭代次数
# --ta-num-callee-tokens=<int>                      # 2. 调用时区分上下文的被调用方令牌最大数量
LLVMTA_INSTRUCT+="--ta-num-callsite-tokens=2 "      # 3. 调用时区分上下文的调用点令牌最大数量   # 指定调用点令牌的数量。 这影响分析工具如何处理函数调用。
# --ta-num-loop-tokens=<int>                        # 4. 循环相关令牌的最大数量

# 三、 Hardware Platform Configuration Options:
# 1. L2缓存延迟(默认4，传输单个字需要5周期)
LLVMTA_INSTRUCT+="--ta-mem-latency=$MEM_Latency "
# --ta-L2-latency=<uint>
# --ta-bgmem-type=<value>         # “sram，simpledram”
# --ta-dram-refresh-latency=<uint>
# --ta-mem-per-word-latency=<uint>
# 2. 指定内存类型为分离缓存（separate caches）。 这影响分析工具如何模拟内存访问。
LLVMTA_INSTRUCT+="--ta-memory-type=separatecaches "    # none，single，separatecaches，priv-instr-spm-data-shared
# 3. 指定微架构类型为顺序执行（inorder/outoforder）。 这影响分析工具如何模拟指令的执行顺序。  
LLVMTA_INSTRUCT+="--ta-muarch-type=outoforder "        # fixedlatency，pret，inorder，strictlyinorder，outoforder
# --ta-num-concurrent-cores=<uint>                      # none，roundRobin
# --ta-stall-on=<value>                                 # dramrefresh，busblocking
# 4. 指定调用点令牌的数量。 这影响分析工具如何处理函数调用。
LLVMTA_INSTRUCT+="--ta-unblock-stores=true "

# 四、 Cache Configuration:
LLVMTA_INSTRUCT+="--ta-dcache-write-back=true "
LLVMTA_INSTRUCT+="--ta-dcache-write-allocate=true "
# --ta-dcache-replpol=<value>     # lru，fifo，alwayshit，alwaysmiss
LLVMTA_INSTRUCT+="--ta-dcache-assoc=$L1D_Assoc "
LLVMTA_INSTRUCT+="--ta-dcache-nsets=$L1D_Nsets "
LLVMTA_INSTRUCT+="--ta-dcache-linesize=$L1D_Linesize "
# --ta-icache-replpol=<value>     # lru，fifo，alwayshit，alwaysmiss
LLVMTA_INSTRUCT+="--ta-icache-assoc=$L1I_Assoc "
LLVMTA_INSTRUCT+="--ta-icache-nsets=$L1I_Nsets "
LLVMTA_INSTRUCT+="--ta-icache-linesize=$L1I_Linesize "
# --ta-l2cache-replpol=<value>    # lru，fifo，alwayshit，alwaysmiss
LLVMTA_INSTRUCT+="--ta-l2cache-assoc=$L2C_Assoc "
LLVMTA_INSTRUCT+="--ta-l2cache-nsets=$L2C_Nsets "
LLVMTA_INSTRUCT+="--ta-l2cache-linesize=$L2C_Linesize "

# 五、Writeback Analysis:
# --ta-assume-clean-cache 
# --ta-dfs-persistence
# --ta-dirtiness-analysis
# --ta-statically-refute-writebacks
# --ta-wb-bound=<value>             # none，store，dfs

# 六、Array-aware Cache Analysis:
LLVMTA_INSTRUCT+="--ta-array-analysis=True "
# --ta-array-must=<value>           # none,conflict-set-intersect,conflict-set-union,conflict-powerset 
# --ta-array-persis=<value>         # none,setwise

# 七、Multi-Core Corunner-sensitive Analysis:
# --ta-access-cycles-joinable-partition-size=<uint>                     - Size of the partitions that are used to decide if two upper bounds on the number of access cycles should be joined. Only has an effect for the arrival curve calculation. By default, all bounds are joined. A value of 1 means only join identical bounds. A value of X means only join bounds that result in the same number if they are both integer divided by X.
# --ta-arrival-curve-calculation-method=<value>                         - Method used for the calculation of the arrival curve values used in co-runner-sensitive analysis. (default 'ilpbased')
#   =programGranularity                                                 -   Based on a minimum period and an upper bound on the number of accesses per program run. (potentially less precise)
#   =ilpbased                                                           -   Based on an ILP implicit path enumeration.
# --ta-arrival-curve-call-site-get-inner-edges-method=<value>           - Which method to use to detect the inner edges of call sites in the calculation of values on an arrival curve. (default 'insideProgramRuns')
#   =all                                                                -   all
#   =insideProgramRuns                                                  -   insideProgramRuns
#   =betweenInOutReachableSimple                                        -   betweenInOutReachableSimple
#   =betweenInOutReachableSimplePlus                                    -   betweenInOutReachableSimplePlus
#   =betweenInOutReachableDetailed                                      -   betweenInOutReachableDetailed
# --ta-arrival-curve-ilp-objective=<value>                              - Use one of two orthogonal objectives. Or use a combined version that is at least as precise as each variant, but potentially more precise than each one. (default 'variant1')
#   =variant1                                                           -   Sum up upper bound on event occurrences for each edge.
#   =variant2                                                           -   Sum up upper bound on event occurrences for each edge that is not first or the last of the path. For every remaining clock cycle of the time window, assume an event.
#   =combined                                                           -   For each ILP valuation, use the minimum of above two variants as objective.
# --ta-arrival-curve-ilp-time-limit=<number>                            - The time limit in seconds for one arrival curve value calculation via ILP. 0.0 is the default value. 0.0 means there is no time limit. Note that we strongly recommend using a time limit for the calculation of arrival curve values as it is significantly more complex than the calculation of per-execution-run event bounds.
# --ta-arrival-curve-loop-get-inner-edges-method=<value>                - Which method to use to detect the inner edges of loops in the calculation of values on an arrival curve. (default 'insideProgramRuns')
#   =all                                                                -   all
#   =insideProgramRuns                                                  -   insideProgramRuns
#   =betweenInOutReachableSimple                                        -   betweenInOutReachableSimple
#   =betweenInOutReachableSimplePlus                                    -   betweenInOutReachableSimplePlus
#   =betweenInOutReachableDetailed                                      -   betweenInOutReachableDetailed
# --ta-blocking-joinable-partition-size=<uint>                          - Size of the partitions that are used to decide if two lower blocking bounds should be joined. Only has an effect in combination with -ta-shared-memory-blocking-type=roundrobin+UBconcurrentaccesscycles. By default, all lower blocking bounds are joined. A value of 1 means only join identical bounds. A value of X means only join bounds that result in the same number if they are both integer divided by X.
# --ta-co-runner-sensitive                                              - Enables the co-runner-sensitive analysis. By default, is is disabled (false).
# --ta-co-runner-sensitive-analysis-fixed-point-type=<value>            - Determines which type of fixed point the iterative co-runner-sensitive analysis pursues (default 'greatest')
#   =least                                                              -   Obtain least fixed point.
#   =greatest                                                           -   Obtain greatest fixed point.
# --ta-co-runner-sensitive-dumped-blocked-cycles-scaled-to-accesses     - Dump the impact of the number of concurrently interfering accesses on the WCET bound instead of the concurrently interfering access cycles (default false).
# --ta-co-runner-sensitive-no-arrival-curve-values                      - Do not perform an arrival curve value calculation in co-runner-sensitive analysis. (default false)
# --ta-co-runner-sensitive-no-wcet-bound                                - Do not perform a WCET bound calculation in co-runner-sensitive analysis. A value true is not allowed if a relative period is specified. (default false)
# --ta-conc-acc-cyc-bounds=<string>                                     - Expects a list of natural numbers with semicolon as delimeter. The number of elements in the list must be a multiple of -ta-num-concurrent-cores and must not be 0.
# --ta-program-period=<uint>                                            - How many cycles at least have to pass between two starts of the program under a periodic scheduling. The default value 0 means that no periodic scheduling is assumed to lower bound the time between two program starts.
# --ta-program-period-rel=<number>                                      - value >= 1 means period is value * wcetAssumingMaxInterference. value < 1 means period is wcetAssumingNoInterference + value * (wcetAssumingMaxInterference - wcetAssumingNoInterference). Negative factor values are OK. If the resulting absolute period would be negative, it is assumed as 0. If the relative period is specified, it overwrites a possible absolute period.
# --ta-program-period-rel-eval-wrt-wcet-ignoring-interference           - If this is true, the relative period is multiplied with a wcet bound ignoring the interference to obtain the absolute period.
# --ta-program-period-subpath-method                                    - Use the subpath method for more precision when taking into account the program period.
# --ta-until-iteration-measurement=<int>                                - Perform dedicated measurements from the start until the end of the iteration for as many iterations as this parameter states. Note that there is also an iteration 0. A negative value disables this dedicated measurements. This parameter is ignored in co-runner-insensitive analysis.

# 八、 TODO:
# --Timing anomaly analysis, state splitting                            - (default 'T')
# --core=<uint>                                                         - The core for the analysis (default '0')
# --parallel-programs                                                   - Parallel Program Analysis
# --ta-multicore-type=<value> # :多核分析;：liangy、none
# LLVMTA_INSTRUCT+="--ta-multicore-type=none "
LLVMTA_INSTRUCT+="--core-info=/workspaces/llvmta/workspace/CoreInfo.json "
LLVMTA_INSTRUCT+="--core-numbers=1 "
LLVMTA_INSTRUCT+="--shared-cache-persistence-analysis=false "


pushd "$ANAL_DIR" > /dev/null
    printf "\t#$ANAL_DIR\n"

    # S1 Output File;
    # printf "1 out\n"
    # (1) 使用 llvmta 分析外部函数信息。输出外部函数注解模板文件(默认false)
    # --ta-output-unknown-extfuncs
    llvmta $LLVMTA_INSTRUCT \
        --ta-output-unknown-extfuncs=true \
        -debug-only= \
        optimized.ll \
        > /dev/null 2>&1
  
    # (2) 使用 llvmta 分析循环信息。输出循环注解文件(默认false)
    # --ta-output-unknown-loops
    llvmta $LLVMTA_INSTRUCT \
        --ta-output-unknown-loops=true \
        -debug-only= \
        optimized.ll \
        > /dev/null 2>&1

    # (3) vcg
    # llvmta $LLVMTA_INSTRUCT \
    #   --ta-dumpb-vcg-graph \
    #   optimized.ll \
    #   > /dev/null 2>&1
    
    # S2 Loop Bound Update;
    # printf "2 loop\n"
    cp -f LoopAnnotations.csv ${SOUR_DIR}

    pushd "$SOUR_DIR" > /dev/null
        cp -f LoopAnnotations.csv LLoopAnnotations.csv
        python3 /workspaces/llvmta/testcases/quickGetBound.py -s "./"   # > /dev/null 2>&1
        mv -f LoopAnnotations.csv $ANAL_DIR
        mv -f LLoopAnnotations.csv $ANAL_DIR
    popd > /dev/null

    # S3 WCET Analysis
    # printf "3 WCET\n"
    bound=$(\
    llvmta $LLVMTA_INSTRUCT \
        --ta-loop-bounds-file=LoopAnnotations.csv \
        --ta-loop-lowerbounds-file=LLoopAnnotations.csv \
        --ta-restart-after-external \
        --ta-extfunc-annotation-file=ExtFuncAnnotations.csv \
        -debug-only= \
        optimized.ll \
    2>&1 | grep "Calculated Timing Bound" | awk '{print $NF}')
    
    echo "Bound:$bound"

    # S5_输出AEG图
    # sed 's/|->/maps to/g' StateGraph_Time.dot > AEG.dot
    # dot -Tpng AEG.dot -o output.png

    # S6_BUFFX
    # dot -Tpng StateGraph_Time.dot -o output.png    # S2B 输出AEG图
    
popd > /dev/null
