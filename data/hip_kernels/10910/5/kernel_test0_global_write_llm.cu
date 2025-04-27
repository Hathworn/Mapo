```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    // Use thread indexing
    unsigned int tid = blockDim.x * blockIdx.x + threadIdx.x;

    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;
    
    unsigned int pattern = 1 << tid; // Each thread gets a different pattern
    unsigned long mask = 4 << tid;   // Each thread gets a different mask
    
    ptr = (unsigned int*)((unsigned long)orig_ptr | mask);
    if (ptr >= end_ptr) return;
    
    *ptr = pattern;
    
    while(true) {
        mask = mask << 1;
        ptr = (unsigned int*)((unsigned long)orig_ptr | mask);
        if (ptr >= end_ptr) break;
        *ptr = pattern;
        pattern = pattern << 1;
    }
}