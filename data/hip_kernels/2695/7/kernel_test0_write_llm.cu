#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;

    // Early exit if the block's starting pointer exceeds the end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);
    unsigned int pattern = 1;
    unsigned long mask = 4;

    *ptr = pattern;

    // Loop processing, optimized with fewer operations
    while (true) {
        ptr = (unsigned int*) (((unsigned long)orig_ptr) | mask);

        if (ptr >= block_end) {
            break;
        }

        *ptr = pattern;
        
        // Optimize pattern and mask updates
        pattern <<= 1;
        mask <<= 1;

        if (ptr == orig_ptr) {
            continue;
        }
    }
}