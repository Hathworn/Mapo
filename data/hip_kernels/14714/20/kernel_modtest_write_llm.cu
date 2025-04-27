#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    // Calculate the starting pointer for the current block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the starting pointer goes beyond the end_ptr
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Cache block size in register
    unsigned int blockSizeInUInts = BLOCKSIZE / sizeof(unsigned int);
    
    // Using separate threads for the two tasks to enable parallelization
    unsigned int tid = threadIdx.x;
    unsigned int stride = blockDim.x;

    // Fill array with p1 at specified offsets in a strided loop
    for (unsigned int i = offset + tid; i < blockSizeInUInts; i += MOD_SZ * stride) {
        ptr[i] = p1;
    }

    // Fill array with p2 where the offsets don't match
    for (unsigned int i = tid; i < blockSizeInUInts; i += stride) {
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;
        }
    }
}