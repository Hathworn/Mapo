#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    // Calculate the pointer once at the start
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Avoid unnecessary computation when out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Precompute limit to avoid repeated division
    unsigned int limit = BLOCKSIZE / sizeof(unsigned int);

    // Unrolling loop to optimize memory writes
    #pragma unroll
    for (unsigned int i = offset; i < limit; i += MOD_SZ) {
        ptr[i] = p1;
    }

    // Optimize second loop by reducing conditional checks
    #pragma unroll
    for (unsigned int i = 0; i < limit; i++) {
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;
        }
    }
}