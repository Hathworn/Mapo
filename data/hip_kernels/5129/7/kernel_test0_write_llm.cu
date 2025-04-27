#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    // Use blockIdx and threadIdx to calculate the starting memory position
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE + threadIdx.x * sizeof(unsigned int));
    unsigned int* ptr = orig_ptr;

    // Guard against out-of-bounds access
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int* block_end = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE + BLOCKSIZE);

    // Initialize pattern and mask
    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Write initial pattern
    *ptr = pattern;

    // Iterate with mask to populate the block
    while (ptr < block_end) {
        ptr = (unsigned int*) (((unsigned long)orig_ptr) | mask);
        
        // Ensure ptr is not reverting to orig_ptr which causes infinite loop
        if (ptr == orig_ptr) {
            mask <<= 1;
            continue;
        }

        // Ensure we don't write beyond the block's end
        if (ptr >= block_end) {
            break;
        }

        // Update memory with current pattern
        *ptr = pattern;

        // Update pattern and mask for next iteration
        pattern <<= 1;
        mask <<= 1;
    }
}