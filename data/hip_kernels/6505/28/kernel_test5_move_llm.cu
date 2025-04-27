#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCKSIZE 256

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate half_count once to optimize performance
    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Use shared memory to optimize memory access patterns
    __shared__ unsigned int shared_data[BLOCKSIZE / sizeof(unsigned int)];

    // Load data into shared memory
    for (unsigned int i = threadIdx.x; i < half_count; i += blockDim.x) {
        shared_data[i] = ptr[i];
        shared_data[i + half_count] = ptr_mid[i];
    }

    __syncthreads();

    // Transfer data from shared memory to destination positions
    for (unsigned int i = threadIdx.x; i < half_count - 8; i += blockDim.x) {
        ptr[i + 8] = shared_data[half_count + i];
    }

    for (unsigned int i = threadIdx.x; i < 8; i += blockDim.x) {
        ptr[i] = shared_data[half_count - 8 + i];
    }
}