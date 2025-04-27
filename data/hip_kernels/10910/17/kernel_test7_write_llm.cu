#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* start_ptr = (unsigned int*) _start_ptr;
    
    // Early exit if ptr is out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Using threadIdx.x to spread the loop work across threads in a warp
    unsigned int idx = threadIdx.x;
    for (; idx < BLOCKSIZE / sizeof(unsigned int); idx += blockDim.x) {
        ptr[idx] = start_ptr[idx];
    }
}