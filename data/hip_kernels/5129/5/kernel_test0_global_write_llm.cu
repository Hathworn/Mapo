#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    // Using shared memory to reduce global memory access
    __shared__ unsigned int local_pattern[1];
    local_pattern[0] = 1; // Initial pattern
    
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;

    unsigned long mask = 4;
    *ptr = local_pattern[0];

    while(ptr < end_ptr){
        ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);
        if (ptr == orig_ptr){
            mask = mask << 1;
            continue;
        }
        if (ptr >= end_ptr){
            break;
        }

        *ptr = local_pattern[0];

        // Shift pattern in shared memory
        local_pattern[0] = local_pattern[0] << 1;
        mask = mask << 1;
    }
    return;
}