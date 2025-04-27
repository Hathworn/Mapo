#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int i;
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Optimize memory access by unrolling and reducing branching
    unsigned int limit = BLOCKSIZE / sizeof(unsigned int);

    for (i = offset; i < limit; i += MOD_SZ) {
        ptr[i] = p1;
    }

    for (i = 0; i < limit; ++i) {
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;
        }
    }

    return;
}