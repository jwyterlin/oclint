#! /bin/bash

# setup environment variables
CWD=`pwd`
PROJECT_ROOT="$CWD/.."
LLVM_SRC="$PROJECT_ROOT/llvm"
LLVM_BUILD="$PROJECT_ROOT/build/llvm-install"
OCLINT_CORE_SRC="$PROJECT_ROOT/oclint-core"
OCLINT_CORE_BUILD="$PROJECT_ROOT/build/oclint-core"
OCLINT_RULES_SRC="$PROJECT_ROOT/oclint-rules"
OCLINT_RULES_BUILD="$PROJECT_ROOT/build/oclint-rules"

# create directory and prepare for build
mkdir -p $OCLINT_RULES_BUILD
cd $OCLINT_RULES_BUILD

# configure and build
cmake -D CMAKE_CXX_COMPILER=$LLVM_BUILD/bin/clang++ -D CMAKE_C_COMPILER=$LLVM_BUILD/bin/clang -D LLVM_ROOT=$LLVM_BUILD -D OCLINT_SOURCE_DIR=$OCLINT_CORE_SRC -D OCLINT_BUILD_DIR=$OCLINT_CORE_BUILD $OCLINT_RULES_SRC
make

# back to the current folder
cd $CWD