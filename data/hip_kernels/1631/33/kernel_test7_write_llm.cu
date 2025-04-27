#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test7_write(char* _ptr, char* end_ptr, char* _start_ptr, unsigned int* err)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* start_ptr = (unsigned int*) _start_ptr;

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use threadIdx to distribute work across threads and optimize memory access
    int stride = blockDim.x * gridDim.x;  // Calculate the stride for each thread
    for (int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += stride) {
        ptr[i] = start_ptr[i];
    }
}