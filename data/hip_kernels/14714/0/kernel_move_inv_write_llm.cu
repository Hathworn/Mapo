#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel_move_inv_write function
__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    // Calculate block-based pointer
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Check bounds and exit early if needed
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use loop unrolling to optimize the write operation
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += 4) {
        ptr[i] = pattern;
        ptr[i + 1] = pattern;
        ptr[i + 2] = pattern;
        ptr[i + 3] = pattern;
    }

    return;
}