# !/bin/bash
set -e -u -o pipefail

# 1 —— 区域地址；
export ROOT_DIR=$1

# export LOG_ADDR="$ROOT_DIR/examx.log"
# for CLASS in "$ROOT_DIR"*; do
#     if find "$CLASS" -maxdepth 1 -type f -iname "changelog*" | grep -q .; then
#         # *. 工程的名称；
#         printf "$CLASS\n"
#         PROJECT="${CLASS##*/}"
#         printf "\tProject:${CLASS##*/}\n"
#         ./run.sh $CLASS $CLASS     # & 
#     fi
# done

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


export WORK_DIR=$1  # /workspaces/llvmta/workspace/test
export SOUR_DIR=$2  # /workspaces/llvmta/workspace/test/code
export HEAD_DIR=$3  # /workspaces/llvmta/workspace/test/head

export COMP_DIR="$WORK_DIR/Compile"
export ANAL_DIR="$WORK_DIR/Analysis"

printf "\n"
printf "\t$WORK_DIR\n"
printf "\t$SOUR_DIR\n"
printf "\t$HEAD_DIR\n"
printf "\n"
printf "\t$COMP_DIR\n"
printf "\t$ANAL_DIR\n"

# S1. Compile(生成IR)
if [ -d $COMP_DIR ]; then
    rm -rf "$COMP_DIR"
fi
mkdir $COMP_DIR

./S1_Compile.sh "$COMP_DIR" "$SOUR_DIR" "$HEAD_DIR"

# S2. Analysis(分析)
if [ -d $ANAL_DIR ]; then
    rm -rf "$ANAL_DIR"
fi
mkdir $ANAL_DIR

# cp "$COMP_DIR/optimized.ll" "$ANAL_DIR/optimized.ll"

# ./S2_Analysis.sh "$SOUR_DIR" "$HEAD_DIR" "$ANAL_DIR"


# S3. 总编译
# ./S3_TCompile.sh $PROJECT 

# ./run.sh \
#   /workspaces/llvmta/workspace/test \
#   /workspaces/llvmta/workspace/test/code \
#   /workspaces/llvmta/workspace/test/head

