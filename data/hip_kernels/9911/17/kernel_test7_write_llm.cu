#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* start_ptr = (unsigned int*) _start_ptr;
    
    // Early exit if out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use thread index for parallel copying
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = start_ptr[i];
    }
}