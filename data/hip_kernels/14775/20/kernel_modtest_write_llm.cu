#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    // Pre-calculate commonly used value
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int blockLimit = BLOCKSIZE / sizeof(unsigned int);

    // Return early if ptr is out of bounds
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Utilize shared memory for improved memory access pattern efficiency
    __shared__ unsigned int sharedMemory[BLOCKSIZE / sizeof(unsigned int)];
    
    // Initialize shared memory with current global memory values
    for (unsigned int i = threadIdx.x; i < blockLimit; i += blockDim.x) {
        sharedMemory[i] = ptr[i];
    }
    __syncthreads();

    // First loop: write p1 to specific positions
    for (unsigned int i = offset + threadIdx.x; i < blockLimit; i += MOD_SZ * blockDim.x) {
        sharedMemory[i] = p1;
    }
    
    // Second loop: write p2 to other positions
    for (unsigned int i = threadIdx.x; i < blockLimit; i += blockDim.x) {
        if (i % MOD_SZ != offset) {
            sharedMemory[i] = p2;
        }
    }
    __syncthreads();

    // Write back results to global memory
    for (unsigned int i = threadIdx.x; i < blockLimit; i += blockDim.x) {
        ptr[i] = sharedMemory[i];
    }
}