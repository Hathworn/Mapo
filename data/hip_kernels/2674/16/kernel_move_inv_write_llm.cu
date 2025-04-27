#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int* end = (unsigned int*) end_ptr;

    // Exit if block's starting pointer is beyond the end
    if (ptr >= end) return;

    // Use thread index to increase parallelization
    unsigned int idx = threadIdx.x;

    // Each thread writes its corresponding position
    for (unsigned int i = idx; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = pattern;
    }
}