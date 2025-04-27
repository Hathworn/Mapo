#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    unsigned int* ptr = (unsigned int*)_ptr;
    unsigned int* end_ptr = (unsigned int*)_end_ptr;
    unsigned int* orig_ptr = ptr;

    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Write initial pattern
    *ptr = pattern;

    // Loop through memory until the end pointer is reached
    while(ptr < end_ptr) {
        ptr = (unsigned int*) (((unsigned long)orig_ptr) | mask); // Calculate next pointer
        if (ptr == orig_ptr) {
            mask = mask << 1; // Shift mask if there is no change to the pointer
            continue;
        }
        if (ptr >= end_ptr) {
            break; // Exit loop if the pointer has reached the end
        }

        *ptr = pattern; // Write pattern to calculated pointer
        pattern = pattern << 1; // Shift pattern
        mask = mask << 1; // Shift mask for next iteration
    }
    return;
}