#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    unsigned int* orig_ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);

    unsigned int pattern = 1;
    unsigned long mask = 4;

    *ptr = pattern;

    // Use shared memory for mask to reduce register pressure
    __shared__ unsigned long shared_mask;
    shared_mask = mask;

    // Loop through blocks for calculation
    while (ptr < block_end)
    {
        ptr = (unsigned int*)((unsigned long)orig_ptr | shared_mask);
        if (ptr == orig_ptr) {
            shared_mask = shared_mask << 1;
            continue;
        }
        if (ptr >= block_end) {
            break;
        }

        *ptr = pattern;
        pattern = pattern << 1;
        shared_mask = shared_mask << 1;  // Update shared mask
    }
    return;
}