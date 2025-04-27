#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_write(char* _ptr, char* end_ptr) 
{
    // Calculate the base pointer for this block
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;

    // Return early if block is out of range
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate the end of this block
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);

    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Set the initial pattern at the starting pointer
    *ptr = pattern;

    // Efficiently traverse and write pattern in memory blocks
    while (true) {
        // Calculate the new pointer position using bitwise OR operation
        ptr = (unsigned int*) (((unsigned long)orig_ptr) | mask);

        // If the computed pointer goes back to the original, shift mask and continue
        if (ptr == orig_ptr) {
            mask = mask << 1;
            continue;
        }

        // Stop if the pointer has crossed the end of block
        if (ptr >= block_end) {
            break;
        }

        // Write the current pattern to the calculated position
        *ptr = pattern;

        // Update pattern and mask for the next iteration
        pattern = pattern << 1;
        mask = mask << 1;
    }
}