# !/bin/bash 
set -e -u -o pipefail

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
