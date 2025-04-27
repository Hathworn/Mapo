```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    // Calculate the starting pointer for each block
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    
    // Check bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);
    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Write initial pattern
    *ptr = pattern;

    // Efficient loop with bit manipulation
    while (ptr < block_end) {
        ptr = (unsigned int*) (((unsigned long)orig_ptr) | mask);
        
        if (ptr == orig_ptr) {
            mask <<= 1;
            continue;
        }
        
        if (ptr >= block_end) {
            break;
        }

        *ptr = pattern;

        pattern <<= 1;
        mask <<= 1;
    }
    return;
}