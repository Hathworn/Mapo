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
        ptr = (unsigned int*) ((((unsigned long)ptr) & ~(mask - 1)) | mask);  // Aligning pointer with mask
        if (ptr >= end_ptr) {
            break;  // Exit loop if pointer goes beyond end
        }
        *ptr = pattern;  // Write pattern to current pointer location
        pattern <<= 1;   // Shift pattern to the left
        mask <<= 1;      // Double the mask
    }
    return;
}