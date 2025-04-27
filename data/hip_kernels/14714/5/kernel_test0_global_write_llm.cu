#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    // Use shared memory for pattern variable to reduce global memory writes
    __shared__ unsigned int pattern;
    pattern = 1;
    
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;

    unsigned long mask = 4;

    // Write pattern to the initial position
    *ptr = pattern;

    while(ptr < end_ptr){
        // Calculate new pointer position with mask and orig_ptr
        ptr = (unsigned int*) ( ((unsigned long)orig_ptr) | mask);
        
        if (ptr == orig_ptr){
            mask = mask << 1;
            continue;
        }
        if (ptr >= end_ptr) {
            break;
        }

        // Write pattern to the calculated position
        *ptr = pattern;

        // Double the pattern efficiently using bitwise operations
        pattern <<= 1;
        mask <<= 1;
    }
    return;
}