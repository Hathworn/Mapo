#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_global_write(char* _ptr, char* _end_ptr)
{
    // Optimize pointer casting and initialization
    unsigned int* ptr = reinterpret_cast<unsigned int*>(_ptr);
    unsigned int* end_ptr = reinterpret_cast<unsigned int*>(_end_ptr);
    unsigned int* orig_ptr = ptr;
    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Initialize the first element
    *ptr = pattern;

    // Loop through while optimizing memory access
    while (ptr < end_ptr) {
        ptr = reinterpret_cast<unsigned int*>(reinterpret_cast<unsigned long>(orig_ptr) | mask);

        // Skip re-assignment and out-of-bounds condition checks
        if (ptr == orig_ptr) {
            mask <<= 1;
            continue;
        }
        if (ptr >= end_ptr) {
            break;
        }

        // Write pattern to the current pointer position
        *ptr = pattern;

        // Update pattern and mask
        pattern <<= 1;
        mask <<= 1;
    }
}