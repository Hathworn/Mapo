#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Exit early if outside the valid range
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate the number of iterations outside the loop
    unsigned int num_iterations = BLOCKSIZE / sizeof(unsigned int);
    
    // Loop unrolling for better performance
    for (unsigned int i = 0; i < num_iterations; i += 4) {
        ptr[i] = pattern;
        if (i + 1 < num_iterations) ptr[i + 1] = pattern;
        if (i + 2 < num_iterations) ptr[i + 2] = pattern;
        if (i + 3 < num_iterations) ptr[i + 3] = pattern;
    }

    return;
}