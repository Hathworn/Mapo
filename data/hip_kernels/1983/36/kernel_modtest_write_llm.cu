#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    // Check boundary condition at the start
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int i = offset;
    // Unroll the loop to reduce number of iterations
    #pragma unroll
    for (; i < BLOCKSIZE/sizeof(unsigned int); i += MOD_SZ) {
        ptr[i] = p1;
    }

    // Separate loop to handle remaining operations
    #pragma unroll
    for (i = 0; i < BLOCKSIZE/sizeof(unsigned int); i++) {
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;
        }
    }
    return;
}