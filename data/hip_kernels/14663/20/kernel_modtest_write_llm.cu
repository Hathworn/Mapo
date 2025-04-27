#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int i;
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x*BLOCKSIZE);

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Unroll loop for better performance
    for (i = offset; i < BLOCKSIZE / sizeof(unsigned int); i += MOD_SZ) {
        ptr[i] = p1;
    }

    // Optimize: Combine two loops and use threadIdx for parallel write
    for (i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;
        }
    }

    return;
}