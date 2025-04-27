#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Optimize memory access using threadIdx.x for parallelism
    unsigned int idx = threadIdx.x;
    unsigned int stride = BLOCKSIZE / sizeof(unsigned int);
    for (unsigned int i = idx; i < stride; i += blockDim.x) {
        ptr[i] = pattern;
    }
}