#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x*BLOCKSIZE);
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }
    
    // Use shared memory for faster access
    __shared__ unsigned int shared_mem[BLOCKSIZE/sizeof(unsigned int)];

    // Initialize shared memory
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE/sizeof(unsigned int); i += blockDim.x) {
        shared_mem[i] = (i % MOD_SZ == offset) ? p1 : p2;
    }

    // Synchronize threads within block to ensure all threads have written to shared memory
    __syncthreads();

    // Copy from shared memory to global memory
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE/sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = shared_mem[i];
    }
    
    return;
}