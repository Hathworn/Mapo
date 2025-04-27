#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    // Calculate the pointer offset for the current block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Return if the calculated pointer is out of the bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Shared memory to reduce redundant memory accesses
    __shared__ unsigned int shared_ptr[BLOCKSIZE / sizeof(unsigned int)];

    // Load data into shared memory
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        shared_ptr[i] = ptr[i];
    }
    __syncthreads();

    // Apply first modification
    for (unsigned int i = threadIdx.x + offset; i < BLOCKSIZE / sizeof(unsigned int); i += MOD_SZ * blockDim.x) {
        shared_ptr[i] = p1;
    }
    __syncthreads();

    // Apply second modification
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        if (i % MOD_SZ != offset) {
            shared_ptr[i] = p2;
        }
    }
    __syncthreads();

    // Write the data back to the global memory
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = shared_ptr[i];
    }
}