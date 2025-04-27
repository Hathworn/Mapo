#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    unsigned int idx = blockIdx.x * BLOCKSIZE / sizeof(unsigned int);
    unsigned int* ptr = (unsigned int*)_ptr + idx;
    unsigned int* start_ptr = (unsigned int*)_start_ptr;

    // Check ptr boundary condition
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Use threadIdx.x to perform coalesced writes
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = start_ptr[i];
    }
}