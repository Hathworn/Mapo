#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    unsigned int i;
    // Calculate the starting index for this block
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* start_ptr = (unsigned int*)_start_ptr;

    // Exit if the pointer exceeds end pointer
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Use unrolled loop for better performance
    #pragma unroll
    for (i = 0; i < BLOCKSIZE / sizeof(unsigned int); i++) {
        ptr[i] = start_ptr[i];
    }

    return;
}