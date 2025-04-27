#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    // Calculate global thread index
    unsigned int globalIdx = blockIdx.x * BLOCKSIZE + threadIdx.x * sizeof(unsigned int);
    unsigned int* ptr = (unsigned int*) (_ptr + globalIdx);

    // Check boundary condition
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Write pattern in parallel using threads
    ptr[0] = pattern;
}