#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    // Calculate original pointer and check bounds
    unsigned int* orig_ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Calculate the end of the block
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);

    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Write initial pattern
    *ptr = pattern;

    while (ptr < block_end) {
        // Use bit manipulation to calculate new pointer efficiently
        ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);

        // Avoid overwriting the original pointer
        if (ptr == orig_ptr) {
            mask = mask << 1;
            continue;
        }

        // Break if the pointer exceeds block boundary
        if (ptr >= block_end) {
            break;
        }

        // Write pattern
        *ptr = pattern;

        // Shift pattern and mask for next iteration
        pattern <<= 1;
        mask <<= 1;
    }
}
```
