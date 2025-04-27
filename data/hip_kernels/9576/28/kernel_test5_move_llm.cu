#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    // Calculate the initial offset for each block
    unsigned int* ptr = reinterpret_cast<unsigned int*>(_ptr + blockIdx.x * BLOCKSIZE);
    
    // If the pointer exceeds end_ptr, exit the kernel
    if (ptr >= reinterpret_cast<unsigned int*>(end_ptr)) {
        return;
    }

    // Calculate the half block count in terms of unsigned int
    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Use shared memory to reduce global memory access
    __shared__ unsigned int shared_mem[BLOCKSIZE / sizeof(unsigned int)];

    // Move first half to shared memory
    for (unsigned int i = threadIdx.x; i < half_count; i += blockDim.x) {
        shared_mem[i] = ptr[i];
    }
    __syncthreads();

    // Move data from shared memory to ptr_mid
    for (unsigned int i = threadIdx.x; i < half_count; i += blockDim.x) {
        ptr_mid[i] = shared_mem[i];
    }
    __syncthreads();

    // Reorganize ptr using shared memory
    for (unsigned int i = threadIdx.x; i < half_count - 8; i += blockDim.x) {
        ptr[i + 8] = ptr_mid[i];
    }
    __syncthreads();

    for (unsigned int i = threadIdx.x; i < 8; i += blockDim.x) {
        ptr[i] = ptr_mid[half_count - 8 + i];
    }
}