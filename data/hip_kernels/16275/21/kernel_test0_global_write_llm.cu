#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;
    unsigned int pattern = 1;
    unsigned long mask = 4;

    *ptr = pattern;  // Set initial pattern

    while (true) {  // Optimize loop and control flow
        ptr = (unsigned int*)((unsigned long)orig_ptr | mask);
        
        if (ptr >= end_ptr) {  
            break;  // Exit loop if ptr exceeds end_ptr
        }

        *ptr = pattern;  // Write pattern
        pattern <<= 1;   // Update pattern
        mask <<= 1;      // Update mask
    }
    return;
}