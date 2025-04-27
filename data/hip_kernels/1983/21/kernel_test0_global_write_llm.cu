#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Initial write
    *ptr = pattern;

    while(ptr < end_ptr)
    {
        // Calculate new pointer position using mask
        unsigned int* new_ptr = (unsigned int*)((unsigned long)ptr | mask);

        // Ensure progression to avoid infinite loop and check bounds
        if(new_ptr >= end_ptr)
        {
            break;
        }

        // Write pattern at new pointer position
        *new_ptr = pattern;

        // Update ptr and pattern for next iteration
        ptr = new_ptr;
        pattern <<= 1;
        mask <<= 1;
    }
}