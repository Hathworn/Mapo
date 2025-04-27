#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCKSIZE 256 // Assuming BLOCKSIZE is defined somewhere

__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);

    // Avoid unnecessary processing for threads with out-of-bound addresses
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Precompute the number of elements to be written in this block
    unsigned int numElements = BLOCKSIZE / sizeof(unsigned int);

    // Optimize with the intrinsic `memset` for faster writes if possible
    // Otherwise, continue using the loop for setting pattern
    #pragma unroll
    for (unsigned int i = 0; i < numElements; i++) {
        ptr[i] = pattern;
    }
}