#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    // Calculate the starting pointer for the current block
    unsigned int* orig_ptr = reinterpret_cast<unsigned int*>(_ptr) + blockIdx.x * (BLOCKSIZE / sizeof(unsigned int));
    unsigned int* ptr = orig_ptr;

    // Early exit if the block's starting point exceeds the end pointer
    if (ptr >= reinterpret_cast<unsigned int*>(end_ptr)) {
        return;
    }

    // Define block_end as the end of the block size
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);

    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Write the initial pattern to the start of the block
    *ptr = pattern;

    // Optimize loop to minimize pointer arithmetic inside the loop
    while (true) {
        // Calculate the next pointer with mask
        ptr = reinterpret_cast<unsigned int*>(reinterpret_cast<unsigned long>(orig_ptr) | mask);
        
        if (ptr >= block_end) {
            break;
        }

        // Only write to memory if ptr is a different pointer than orig_ptr
        *ptr = pattern;
        
        // Update pattern and mask for the next iteration
        if (ptr == orig_ptr) {
            mask <<= 1;
            continue;
        }
        
        pattern <<= 1;
        mask <<= 1;
    }
}