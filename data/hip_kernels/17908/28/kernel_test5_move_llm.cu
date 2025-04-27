```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    // Calculate initial pointer for this block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Check if this block's data is out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Precompute values for loop counts
    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Use shared memory for improved access times
    __shared__ unsigned int shared_mem[BLOCKSIZE / sizeof(unsigned int)];
    
    // Load data into shared memory
    if (threadIdx.x < half_count) {
        shared_mem[threadIdx.x] = ptr[threadIdx.x];
        shared_mem[threadIdx.x + half_count] = ptr_mid[threadIdx.x];
    }
    __syncthreads();

    // Move data from the first half to the second half
    if (threadIdx.x < half_count - 8) {
        ptr[threadIdx.x + 8] = shared_mem[threadIdx.x + half_count];
    }
    if (threadIdx.x < 8) {
        ptr[threadIdx.x] = shared_mem[half_count - 8 + threadIdx.x];
    }
}