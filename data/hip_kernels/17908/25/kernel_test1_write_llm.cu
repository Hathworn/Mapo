#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early return if block's starting point is beyond end_ptr
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Use threadIdx to reduce unnecessary iterations
    unsigned int tid = threadIdx.x; 
    unsigned int stride = blockDim.x;

    for (unsigned int i = tid; i < BLOCKSIZE / sizeof(unsigned long); i += stride) {
        ptr[i] = (unsigned long) &ptr[i];
    }

    return;
}