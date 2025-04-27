#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    // Calculate the current thread's index in the grid
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int* ptr = (unsigned int*) (_ptr + idx * sizeof(unsigned int));

    // Terminate threads with indices beyond the end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Write the pattern to memory
    *ptr = pattern;
}