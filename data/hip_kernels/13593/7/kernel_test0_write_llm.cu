#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x*BLOCKSIZE);
    unsigned int* ptr = orig_ptr;

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);
    unsigned int pattern = 1;
    unsigned long mask = 4;

    *ptr = pattern;

    while (ptr < block_end) {
        ptr = (unsigned int*)((unsigned long)orig_ptr | mask);
        if (ptr >= block_end) {  // Break if beyond block boundary
            break;
        }
        
        *ptr = pattern;  // Write pattern

        pattern <<= 1;  // Optimize pattern update using compound assignment
        mask <<= 1;     // Optimize mask update using compound assignment

        // Skip redundant mask shifting when ptr equals orig_ptr
        if (ptr == orig_ptr) {
            continue;
        }
    }
}