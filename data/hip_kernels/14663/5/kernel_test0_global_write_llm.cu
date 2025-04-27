#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    // Using shared memory to reduce global memory access
    __shared__ unsigned int shared_pattern;
    __shared__ unsigned long shared_mask;
    
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;

    // Initialize shared variables
    if (threadIdx.x == 0) {
        shared_pattern = 1;
        shared_mask = 4;
    }
    __syncthreads();

    *ptr = shared_pattern;

    while(ptr < end_ptr){
        ptr = (unsigned int*) (((unsigned long)orig_ptr) | shared_mask);
        if (ptr == orig_ptr){
            shared_mask = shared_mask << 1;
            continue;
        }
        if (ptr >= end_ptr){
            break;
        }

        *ptr = shared_pattern;

        shared_pattern = shared_pattern << 1;
        shared_mask = shared_mask << 1;
    }
    return;
}