//===-- HelloWorld.cpp - Example Transformations --------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "llvm/Transforms/Utils/HelloWorld.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Instructions.h"

#include "llvm/Support/raw_ostream.h"

using namespace llvm;

PreservedAnalyses HelloWorldPass::run(Function &F,
                                      FunctionAnalysisManager &AM) {
  // errs() << "------------" << "\n";
  // Module *M = F.getParent();  // 获取父模块
  // LLVMContext &Context = M->getContext();
  // bool modified = false;
  // for (auto &BB : F) {
  //   for (auto &I : BB) {
  //     StringRef Name = I.getName();
  //     errs() << Name << "\n";
  //   }
  // }

  // 3. 新增功能：检查函数是否包含内联汇编
  for (auto &BB : F) {
    for (auto &I : BB) {
      if (CallInst *CI = dyn_cast<CallInst>(&I)) {
        if (CI->isInlineAsm()) {
          // errs() << "Found inline assembly in function: " << F.getName() << "\n";
          // F.setLinkage(GlobalValue::ExternalLinkage);
          F.deleteBody();
          return PreservedAnalyses::none();

        }
      }
    }
  }
  // errs() << "Found no inline assembly in function: " << F.getName() << "\n";

  // errs() << "------------" << "\n";

  return PreservedAnalyses::all();
}