#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    // Cache block size and modulo size
    const unsigned int block_size = BLOCKSIZE / sizeof(unsigned int);
    const unsigned int* end_ptr_converted = (unsigned int*)end_ptr;

    // Calculate starting pointer for each block
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);

    // Prevent any out-of-bound memory access
    if (ptr >= end_ptr_converted) {
        return;
    }

    // Unroll loops for improved performance
    #pragma unroll
    for (unsigned int i = offset; i < block_size; i += MOD_SZ) {
        ptr[i] = p1;  // Write p1 at specific offset intervals
    }

    #pragma unroll
    for (unsigned int i = 0; i < block_size; i++) {
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;  // Write p2 for other indices
        }
    }
}