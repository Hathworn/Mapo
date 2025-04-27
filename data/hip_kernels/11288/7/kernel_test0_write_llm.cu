```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    // Calculate initial pointers based on block index
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    if (orig_ptr >= (unsigned int*) end_ptr) {
        return;
    }
    
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);
    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Write initial pattern to original pointer address
    *orig_ptr = pattern;

    // Loop with optimized pointer arithmetic
    while (true) {
        unsigned int* ptr = (unsigned int*)((unsigned long)orig_ptr | mask);
        if (ptr == orig_ptr) {
            mask <<= 1; // Increment mask
            continue;
        }
        if (ptr >= block_end) {
            break; // Exit loop if out of bounds
        }

        *ptr = pattern; // Write pattern at calculated pointer
        pattern <<= 1;  // Increment pattern
        mask <<= 1;     // Increment mask
    }
}