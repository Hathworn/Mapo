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

    // Use a more efficient loop control with fewer checks
    while (true) {
        ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);
        
        if (ptr >= end_ptr) {
            break; // Exit if pointer exceeds boundary
        }

        *ptr = pattern; // Write pattern to memory

        pattern <<= 1;  // Increment pattern by shifting left
        mask <<= 1;     // Shift mask to next position
    }
}