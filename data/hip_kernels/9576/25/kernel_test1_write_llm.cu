#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x*BLOCKSIZE);

    // Ensure memory access is within bounds
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Use `threadIdx.x` to parallelize the loop effectively
    int idx = threadIdx.x;
    if (idx < BLOCKSIZE / sizeof(unsigned long)) {
        ptr[idx] = (unsigned long) &ptr[idx];
    }

    return;
}