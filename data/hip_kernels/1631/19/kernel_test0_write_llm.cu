#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* end_pos = (unsigned int*) end_ptr;

    // Early exit if pointer exceeds end
    if (ptr >= end_pos) {
        return;
    }

    // Use an optimized loop to apply pattern
    #pragma unroll 
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i++) {
        ptr[i] = pattern;
    }
}