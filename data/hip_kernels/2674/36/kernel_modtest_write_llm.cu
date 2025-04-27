#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int i;
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x*BLOCKSIZE);

    // Check if pointer is within range to avoid unwanted memory access
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int limit = BLOCKSIZE / sizeof(unsigned int);

    // Combine two loops to improve performance and reduce global memory access
    for (i = 0; i < limit; i++) {
        if (i % MOD_SZ == offset) {
            ptr[i] = p1;
        } else {
            ptr[i] = p2;
        }
    }

    return;
}