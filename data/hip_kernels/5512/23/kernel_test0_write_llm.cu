#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);
    unsigned int pattern = 1;
    unsigned long mask = 4;

    *ptr = pattern;

    while(ptr < block_end){

        // This operation updates ptr using bitwise OR with mask
        ptr = (unsigned int*) (((unsigned long)orig_ptr) | mask);

        // When ptr equals orig_ptr, increment mask and continue to avoid infinite loop
        if (ptr == orig_ptr){
            mask = mask << 1;
            continue;
        }
        // Check if ptr exceeds the block_end to exit the loop
        if (ptr >= block_end){
            break;
        }

        *ptr = pattern;

        // Update pattern and mask for next iteration
        pattern = pattern << 1;
        mask = mask << 1;
    }
    return;
}