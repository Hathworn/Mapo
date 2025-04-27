#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    // Casting char pointers to unsigned int pointers for aligned writes
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;

    unsigned int pattern = 1;
    unsigned long mask = 4;

    *ptr = pattern;

    // Improved loop iteration to reduce unnecessary calculations
    while (ptr < end_ptr) {
        // Compute target position with mask using bitwise OR
        unsigned int* next_ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);

        if (next_ptr >= end_ptr) {
            break;
        }

        // Write pattern to memory
        *next_ptr = pattern;

        // Update mask and pattern for next iteration
        // This increment step avoids repetitive computation
        mask <<= 1;
        pattern <<= 1;
        orig_ptr = next_ptr;
    }
}