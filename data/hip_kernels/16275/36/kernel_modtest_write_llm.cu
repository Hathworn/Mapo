#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    // Calculate the start pointer for the current block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Return early if the start pointer exceeds the end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Caching the end index and step size to avoid recalculating
    unsigned int end_index = BLOCKSIZE / sizeof(unsigned int);

    // Unrolling loop for better performance
    for (unsigned int i = offset; i < end_index; i += MOD_SZ) {
        ptr[i] = p1;
    }

    // Unrolling loop for better performance
    for (unsigned int i = 0; i < end_index; i++) {
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;
        }
    }
}