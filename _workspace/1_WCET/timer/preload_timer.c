#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <time.h>

typedef int (*main_fn)(int, char **, char **);
typedef int (*libc_start_main_fn)(
    main_fn, int, char **,
    void (*)(void), void (*)(void),
    void (*)(void), void *
);

static main_fn real_main;

int timed_main(int argc, char **argv, char **envp) {
    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);

    int ret = real_main(argc, argv, envp);

    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    uint64_t delta_ns = (end.tv_sec - start.tv_sec) * 1000000000ULL +
                        (end.tv_nsec - start.tv_nsec);

    printf("main() time = %lu ns\n", delta_ns);
    return ret;
}

int __libc_start_main(
    main_fn main, int argc, char **ubp_av,
    void (*init)(void), void (*fini)(void),
    void (*rtld_fini)(void), void *stack_end
) {
    real_main = main;
    libc_start_main_fn real = dlsym(RTLD_NEXT, "__libc_start_main");
    return real(timed_main, argc, ubp_av, init, fini, rtld_fini, stack_end);
}
