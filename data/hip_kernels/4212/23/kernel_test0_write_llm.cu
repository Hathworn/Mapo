#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    // Calculate the starting pointer for the current block
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    
    // Early exit if the start pointer is out of bounds
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }
    
    // Define the end of the current block
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);
    unsigned int pattern = 1;
    unsigned long mask = 4;
    
    // Set the initial value at the start of the block
    *ptr = pattern;
    
    // Iterate over block memory using calculated mask positions
    while (ptr < block_end) {
        // Calculate new pointer with mask
        ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);
        if (ptr == orig_ptr) {
            // If it points to the origin again, shift the mask
            mask <<= 1;
            continue;
        }
        if (ptr >= block_end) {
            // Break if the new pointer is out of block bounds
            break;
        }
        
        // Write pattern to the calculated pointer
        *ptr = pattern;
        
        // Update pattern and mask
        pattern <<= 1;
        mask <<= 1;
    }
}