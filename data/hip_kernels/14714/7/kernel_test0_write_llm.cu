#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr) {
    unsigned int* orig_ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);

    // Early exit if the block starts beyond end_ptr
    if (ptr >= (unsigned int*)end_ptr) return;

    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Initialize first value
    *ptr = pattern;

    // Loop through memory block and write patterns
    while (true) {
        ptr = (unsigned int*)(((unsigned long)orig_ptr) | mask);

        // Check for out-of-bounds or repeated address
        if (ptr >= block_end || ptr == orig_ptr) {
            mask <<= 1;
            if (ptr == orig_ptr) continue;
            else break;
        }

        *ptr = pattern;
        pattern <<= 1;
        mask <<= 1;
    }
}