#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    // Calculate the starting index for the current thread block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Check if the starting index exceeds the end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use a loop unrolling technique to reduce loop overhead
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i++) {
        ptr[i] = pattern;
    }
    return;
}