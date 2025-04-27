#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Check bounds and exit early if out of range
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Utilize threadIdx for parallel writing and avoid redundant computation
    unsigned int tid = threadIdx.x;
    if (tid < BLOCKSIZE / sizeof(unsigned long)) {
        ptr[tid] = (unsigned long) &ptr[tid];
    }
}