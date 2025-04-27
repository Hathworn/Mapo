#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x*BLOCKSIZE);

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use threadIdx to improve parallelism and reduce loop iterations
    unsigned int idx = threadIdx.x;
    unsigned int stride = blockDim.x;
    
    // Each thread writes multiple elements according to step size
    for (unsigned int i = idx; i < BLOCKSIZE / sizeof(unsigned int); i += stride) {
        ptr[i] = pattern;
    }
}