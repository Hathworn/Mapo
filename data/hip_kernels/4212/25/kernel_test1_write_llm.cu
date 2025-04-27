#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    // Calculate starting index for this block only once
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Check boundary condition before proceeding with loop
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Unroll the loop to reduce loop overhead and improve memory access patterns
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned long); i++) {
        ptr[i] = (unsigned long) &ptr[i];
    }
}