#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if index exceeds boundary
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Use shared memory for faster access
    __shared__ unsigned int shared_data[BLOCKSIZE / sizeof(unsigned int)];
    
    // Prefetch to shared memory
    for (unsigned int i = threadIdx.x; i < half_count; i += blockDim.x) {
        shared_data[i] = ptr[i];
    }
    __syncthreads();

    // First movement using shared memory
    for (unsigned int i = threadIdx.x; i < half_count - 8; i += blockDim.x) {
        shared_data[i + 8] = shared_data[i + half_count];
    }
    __syncthreads();

    // Second movement using shared memory
    for (unsigned int i = threadIdx.x; i < 8; i += blockDim.x) {
        shared_data[i] = shared_data[half_count - 8 + i];
    }
    __syncthreads();

    // Write back to global memory
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = shared_data[i];
    }
}