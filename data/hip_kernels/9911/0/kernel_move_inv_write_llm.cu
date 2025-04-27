#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Check one time after calculating the memory position
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Use a single int for iteration
    int tid = threadIdx.x;
    int stride = blockDim.x;

    // Iterate over block using threads for potentially better parallelism
    for (unsigned int i = tid; i < BLOCKSIZE / sizeof(unsigned int); i += stride) {
        ptr[i] = pattern;
    }
}