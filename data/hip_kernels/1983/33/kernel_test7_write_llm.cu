#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    unsigned int global_idx = blockIdx.x * BLOCKSIZE;

    // Convert char pointers to unsigned int pointers for indexing
    unsigned int* ptr = (unsigned int*)(_ptr + global_idx);
    unsigned int* start_ptr = (unsigned int*)_start_ptr;

    // Ensure the pointer is within bounds
    if (ptr + BLOCKSIZE / sizeof(unsigned int) > (unsigned int*)end_ptr) {
        return;
    }

    // Loop unrolling for performance
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i++) {
        ptr[i] = start_ptr[i];
    }

    return;
}