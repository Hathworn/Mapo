#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x*BLOCKSIZE);

    // Early exit if pointer exceeds end_ptr
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use shared memory to reduce global memory access
    __shared__ unsigned int shared_block[BLOCKSIZE/sizeof(unsigned int)];

    // Initialize shared memory
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE/sizeof(unsigned int); i += blockDim.x) {
        shared_block[i] = p2; // Set default to p2
    }

    // Synchronize threads
    __syncthreads();

    // Write p1 at specific offsets
    for (unsigned int i = offset + threadIdx.x; i < BLOCKSIZE/sizeof(unsigned int); i += blockDim.x * MOD_SZ) {
        shared_block[i] = p1;
    }

    // Synchronize threads before writing back to global memory
    __syncthreads();

    // Write back to global memory
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE/sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = shared_block[i];
    }
}