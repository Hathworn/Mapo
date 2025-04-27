#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    // Calculate starting pointer with bounds check
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);
    if (ptr >= (unsigned int*)end_ptr) {
        return; // Exit early if out of bounds
    }

    // Use threadIdx.x to parallelize writing pattern across multiple threads
    int tid = threadIdx.x;
    for (unsigned int i = tid; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = pattern; // Write pattern to each calculated position
    }

    return;
}