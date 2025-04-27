#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    // Compute the starting pointer for the block
    unsigned int* orig_ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    
    // Check if the starting pointer is out of bounds
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Compute the end pointer for the block
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);
    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Write the initial pattern
    *ptr = pattern;

    // Loop through the block with optimized conditions
    while (true) {
        // Calculate the next address based on the mask
        ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);
        
        // Break if the mask calculation overflows past block_end
        if (ptr >= block_end) {
            break;
        }

        // Only increment mask at each successful write site
        *ptr = pattern;
        pattern <<= 1;  // Use compound assignment for pattern
        mask <<= 1;     // Increment the mask
    }
    return;
}