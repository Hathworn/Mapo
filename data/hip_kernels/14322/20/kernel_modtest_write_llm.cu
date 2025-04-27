#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Terminate early if out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int blockSteps = BLOCKSIZE / sizeof(unsigned int);

    // Loop unrolling for better performance
    for (unsigned int i = offset; i < blockSteps; i += MOD_SZ) {
        ptr[i] = p1;
    }

    // Reduced modulo operations
    for (unsigned int i = 0; i < blockSteps; i++) {
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;
        }
    }
}