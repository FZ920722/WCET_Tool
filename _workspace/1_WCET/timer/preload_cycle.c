#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>

typedef int (*main_fn)(int, char **, char **);
typedef int (*libc_start_main_fn)(
    main_fn, int, char **,
    void (*)(void), void (*)(void),
    void (*)(void), void *
);

static main_fn real_main;

static inline uint64_t read_cntvct(void) {
    uint64_t val;
    asm volatile("mrs %0, cntvct_el0" : "=r" (val));
    return val;
}

int my_main(int argc, char **argv, char **envp) {
    uint64_t start = read_cntvct();
    int ret = real_main(argc, argv, envp);
    uint64_t end = read_cntvct();
    printf("main() cycles = %lu\n", end - start);
    return ret;
}

int __libc_start_main(
    main_fn main, int argc, char **ubp_av,
    void (*init)(void), void (*fini)(void),
    void (*rtld_fini)(void), void *stack_end)
{
    real_main = main;
    libc_start_main_fn real = dlsym(RTLD_NEXT, "__libc_start_main");
    return real(my_main, argc, ubp_av, init, fini, rtld_fini, stack_end);
}
