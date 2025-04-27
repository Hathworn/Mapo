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

    // Use unrolled loop to improve performance
    while (ptr < end_ptr)
    {
        ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);
        if (ptr >= end_ptr)
        {
            break;
        }
        *ptr = pattern;
        pattern <<= 1;  // Simplify pattern left shift
        mask <<= 1;     // Simplify mask left shift

        // Additional iteration to enhance throughput
        unsigned int* next_ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);
        if (next_ptr < end_ptr)
        {
            next_ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);
            *next_ptr = pattern;
            pattern <<= 1;  // Simplify pattern left shift
            mask <<= 1;     // Simplify mask left shift
        }
    }
    return;
}