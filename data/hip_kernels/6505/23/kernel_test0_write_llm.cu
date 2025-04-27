```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    unsigned int* orig_ptr = reinterpret_cast<unsigned int*>(_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);

    // Early exit if the initial pointer is outside the bounds.
    if (ptr >= reinterpret_cast<unsigned int*>(end_ptr)) {
        return;
    }

    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Write initial pattern.
    *ptr = pattern;

    // Optimized the loop to avoid unnecessary recalculations.
    while (true) {
        ptr = reinterpret_cast<unsigned int*>(((unsigned long)orig_ptr) | mask);
        if (ptr == orig_ptr || ptr >= block_end) {
            if (ptr >= block_end) break;
            mask <<= 1;
            continue;
        }

        *ptr = pattern;

        // Update pattern and mask.
        pattern <<= 1;
        mask <<= 1;
    }
}