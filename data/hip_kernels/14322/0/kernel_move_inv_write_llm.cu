#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Exit if start of block is already out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Loop unrolling for reduced loop overhead
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i++) {
        ptr[i] = pattern;
    }
}