#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr) {
    // Pre-calculate shared values
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);
    unsigned int pattern = 1;
    unsigned long mask = 4;

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    *ptr = pattern;

    while (ptr < block_end) {
        // Optimize pointer calculation
        unsigned long new_ptr_value = ((unsigned long)orig_ptr) | mask;
        ptr = (unsigned int*) new_ptr_value;
        if (ptr == orig_ptr) {
            mask <<= 1; // Efficiently shift mask
            continue;
        }
        if (ptr >= block_end) {
            break;
        }

        *ptr = pattern;

        // Efficiently shift pattern and mask
        pattern <<= 1;
        mask <<= 1;
    }
    return;
}