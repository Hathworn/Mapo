#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clock_block(clock_t *d, clock_t clock_count) {
    clock_t start_clock = clock64();
    // Reuse previous computations to reduce clock reads
    clock_t clock_offset;
    do {
        clock_offset = clock64() - start_clock;
    } while (clock_offset < clock_count);

    // Avoid unnecessary memory access check
    if (d != nullptr) {
        *d = clock_offset;
    }
}