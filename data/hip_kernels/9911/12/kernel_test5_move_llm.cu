#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if pointer exceeds end_ptr
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Use shared memory to reduce global memory operations
    __shared__ unsigned int shared_mem[BLOCKSIZE / sizeof(unsigned int)];

    // Load memory into shared memory
    for (unsigned int i = threadIdx.x; i < half_count; i += blockDim.x) {
        shared_mem[i] = ptr[i];
    }
    
    __syncthreads();

    // Copy data to the middle section using shared memory
    for (unsigned int i = threadIdx.x; i < half_count; i += blockDim.x) {
        ptr_mid[i] = shared_mem[i];
    }
    
    __syncthreads();

    // Move first part to later positions using shared memory
    for (unsigned int i = threadIdx.x; i < half_count - 8; i += blockDim.x) {
        ptr[i + 8] = shared_mem[i];
    }
    
    // Move last 8 elements
    if (threadIdx.x < 8) {
        ptr[threadIdx.x] = ptr_mid[half_count - 8 + threadIdx.x];
    }
}