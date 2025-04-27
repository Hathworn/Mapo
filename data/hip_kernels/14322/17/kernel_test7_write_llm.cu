#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    // Compute the starting point for this block and thread
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* start_ptr = (unsigned int*)_start_ptr;

    // Terminate if pointer is out of bounds
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Unroll loop for performance
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i++) {
        ptr[i] = start_ptr[i];
    }

    return;
}