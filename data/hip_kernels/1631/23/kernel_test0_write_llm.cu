#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr)
{
    unsigned int* orig_ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* ptr = orig_ptr;
    
    // Check if pointer exceeds the end pointer at the beginning
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int* block_end = orig_ptr + BLOCKSIZE / sizeof(unsigned int);
    unsigned int pattern = 1;
    unsigned long mask = 4;

    // Write first pattern outside the loop for clarity
    *ptr = pattern;

    // Optimize loop condition and avoid unnecessary type casting
    while (true) {
        ptr = (unsigned int*) (((unsigned long)orig_ptr) | mask);
        
        if (ptr >= block_end) {
            break;
        }

        // Avoid unnecessary writes by checking pointer change
        if (ptr == orig_ptr) {
            mask <<= 1;
            continue;
        }

        *ptr = pattern;
        pattern <<= 1;
        mask <<= 1;
    }

    return;
}