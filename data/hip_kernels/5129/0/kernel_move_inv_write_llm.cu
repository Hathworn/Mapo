#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Ensure memory write is valid and within bounds.
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use shared memory or register for intermediate operations if beneficial.
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i++) {
        ptr[i] = pattern;
    }
}