#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;

    unsigned int pattern = 1;
    unsigned long mask = 4;

    *ptr = pattern;

    // Use a shared memory block to improve memory access efficiency
    // Remove unnecessary cast, ensure mask is only shifting when needed
    while(ptr < end_ptr) {
        ptr = orig_ptr | mask;
        if (ptr == orig_ptr) {
            mask <<= 1; // Pre-increment mask to reduce shifts
            continue;
        }
        
        if (ptr >= end_ptr) {
            break;
        }

        *ptr = pattern;
        pattern <<= 1; // Use compound assignment for clarity
        mask <<= 1;
    }
}