#include <stdio.h>

void say_hello() {
    printf("Hello, 间接调用！\n");
}

void Func1(int x) {
    x = x + 10;
    // int n = 0;
    // Func1(n);
    // cout << "n = " << n << endl; // n = 0
}

void Func2(int *x) {
    (* x) = (* x) + 10;  // （*x）指针变对象
    // int n = 0;
    // Func2(&n);
    // cout << "n = " << n << endl; // n = 10
}

// void Func3(int &x) {
//     x = x + 10;
//     // int n = 0;
//     // Func3(n);
//     // cout << "n = " << n << endl; // n = 10
// }

int factorial(int n) {
    if (n == 0 || n == 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

int main() {
    int num = 5;
    // int x = factorial(num);

    // int m;
    // int &n= m;   // n是m的一个引用（reference），m是被引用物（referent）。
    // int i = 5;
    // int j = 6;
    // int &k = i;
    // k = j;      // k 和 i 的值都变成了 6;


    // 1. 定义函数指针（中间媒介），类型要和目标函数匹配
    // void (*func_ptr)() = NULL;

    // 2. 把目标函数的地址赋值给指针
    // func_ptr = say_hello;

    // 3. 通过指针间接调用函数（核心：没直接写say_hello()）
    // func_ptr();

    int y = 1;
    // _Pragma("loopbound min 1 max 1000")
    // while (1) {
    // for (;;) {
    for(int i =1; i<100; i++) {
        y += 1;
    }

    return 0;
}



// if (TimeTrace)
//   timeTraceProfilerInitialize(TimeTraceGranularity, argv[0]);
//   auto TimeTraceScopeExit = make_scope_exit([]() {
//             if (TimeTrace) {
//                 if (auto E = timeTraceProfilerWrite(TimeTraceFile, OutputFilename)) {
//                     handleAllErrors(std::move(E), [&](const StringError &SE) {errs() << SE.getMessage() << "\n";});
//                     return;
//                 }
//                 timeTraceProfilerCleanup();
//                 }
//             }
//         );

// clang test.c -w -S -emit-llvm -gline-tables-only -O0 -Xclang -disable-O0-optnone -fno-builtin -fno-jump-tables -fno-optimize-sibling-calls --target=arm -o ./untest.ll

// opt -S ./untest.ll -mem2reg -indvars -loop-simplify -inline -instcombine -globaldce -dce -lowerswitch -simplifycfg -o ./test.ll

// llvmta -O0 -float-abi=hard -mattr=-neon,+vfp2 -disable-tail-calls --ta-output-unknown-extfuncs test.ll

// llvmta -O0 -float-abi=hard -mattr=-neon,+vfp2 -disable-tail-calls --ta-output-unknown-loops --core-info=CoreInfo.json test.ll
