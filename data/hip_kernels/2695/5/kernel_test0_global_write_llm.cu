#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int pattern = 1;

    unsigned long mask = 4;

    *ptr = pattern;

    while (ptr < end_ptr) {
        // Calculate the next address using mask and optimize bit manipulation
        unsigned int* next_ptr = (unsigned int*)((unsigned long)_ptr | mask);
        // If mask doesn't change the address, double the mask
        while (next_ptr == ptr && next_ptr < end_ptr) {
            mask <<= 1;
            next_ptr = (unsigned int*)((unsigned long)_ptr | mask);
        }
        // Check if the next address is outside the end_ptr
        if (next_ptr >= end_ptr) {
            break;
        }
        // Write pattern to next address
        *next_ptr = pattern;
        
        // Update state for next iteration
        ptr = next_ptr;
        pattern <<= 1;
        mask <<= 1;
    }
}