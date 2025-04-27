#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    // Calculate the initial pointer position for this block
    unsigned int* orig_ptr = reinterpret_cast<unsigned int*>(_ptr) + blockIdx.x * BLOCKSIZE / sizeof(unsigned int);
    unsigned int* ptr = orig_ptr;

    // Check if the initial pointer is already out of bounds
    if (ptr >= reinterpret_cast<unsigned int*>(end_ptr)) {
        return;
    }

    // Define the ending position of the block
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);

    // Initialize pattern and mask
    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Set the initial value
    *ptr = pattern;

    // Optimized loop with reduced computations and more efficient pointer management
    while (true) {
        ptr = reinterpret_cast<unsigned int*>(reinterpret_cast<unsigned long>(orig_ptr) | mask);

        // Break conditions
        if (ptr == orig_ptr || ptr >= block_end) {
            break;
        }

        // Update the memory at the identified pointer location
        *ptr = pattern;

        // Update the pattern and mask for the next iteration
        pattern <<= 1;
        mask <<= 1;
    }
}