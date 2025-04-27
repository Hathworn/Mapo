#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    unsigned int idx = blockIdx.x * BLOCKSIZE / sizeof(unsigned int) + threadIdx.x;  // Optimize index calculation
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* start_ptr = (unsigned int*)_start_ptr;

    __shared__ unsigned int shared_data[BLOCKSIZE / sizeof(unsigned int)];  // Use shared memory for performance

    if ((unsigned char*)(ptr + idx) >= end_ptr) {
        return;  // Ensure out-of-bounds prevention
    }

    shared_data[threadIdx.x] = start_ptr[threadIdx.x];  // Load data into shared memory

    __syncthreads();  // Synchronize threads before writing to global memory

    ptr[idx] = shared_data[threadIdx.x];  // Write data from shared memory to global memory

    return;
}