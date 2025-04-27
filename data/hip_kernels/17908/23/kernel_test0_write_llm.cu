#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    // Calculate the starting address for the current block
    unsigned int* orig_ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;

    // Early exit if the starting address is beyond the end
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Calculate the end address for this block
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);

    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Initialize the starting address with the pattern
    *ptr = pattern;

    // Loop through and set memory locations as per pattern
    while (ptr < block_end) {
        ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);

        // If computed address equals the original, shift the mask and continue
        if (ptr == orig_ptr) {
            mask <<= 1;
            continue;
        }

        // Break if the computed address is beyond the block end
        if (ptr >= block_end) {
            break;
        }

        // Set the memory location with the current pattern
        *ptr = pattern;

        // Update the pattern and mask for the next iteration
        pattern <<= 1;
        mask <<= 1;
    }
}