# !/bin/bash 
set -e -u -o pipefail

export ROOT_DIR=$1                     # 1 —— 区域地址；

# export LOG_ADDR="$ROOT_DIR/examx.log"

# 进入工作区工作
for CLASS in "$ROOT_DIR"*; do
    if find "$CLASS" -maxdepth 1 -type f -iname "changelog*" | grep -q .; then
        # *. 工程的名称；
        printf "$CLASS\n"
        PROJECT="${CLASS##*/}"
        printf "\tProject:${CLASS##*/}\n"
        ./run.sh $CLASS $CLASS     # & 
    fi
done

# wait
# ./test.sh \
# /workspaces/llvmta/testcases/singletest/
# /workspaces/llvmta/testcases/tacle-bench/bench/
# /workspaces/llvmta/testcases/Benchmarks/loopexamples/nested/

# for PROJECT in $(find "$CLASS" -type d); do
#   STime=$(date +%s)
#   ...
#   ETime=$(date +%s)
#   echo "$WORK_DIR:$bound:$((ETime - STime))" >> $LOG_ADDR
# done

# export LOG_ADDR="$ROOT_DIR/examx.log"
# export LOG_ADDR="/workspaces/llvmta/testcases/examx.log"
# > $LOG_ADDR
