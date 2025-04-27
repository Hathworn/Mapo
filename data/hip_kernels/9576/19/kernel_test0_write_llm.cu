#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    // Calculate the starting index based on threadIdx and blockIdx
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Avoid accessing out-of-bounds memory
    if (ptr + idx * blockDim.x >= (unsigned int*) end_ptr) {
        return;
    }

    // Use each thread to handle a part of the workload
    if (idx < BLOCKSIZE / sizeof(unsigned int)) {
        ptr[idx] = pattern;
    }
}