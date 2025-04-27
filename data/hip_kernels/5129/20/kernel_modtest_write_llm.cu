#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2) {
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if pointer exceeds end
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Unroll the loop with fixed offsets for improved performance
    #pragma unroll
    for (unsigned int i = offset; i < BLOCKSIZE / sizeof(unsigned int); i += MOD_SZ) {
        ptr[i] = p1;
    }

    // Combine the two loops to reduce overhead
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i++) {
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;
        }
    }
}