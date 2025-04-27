#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    // Calculate thread-specific memory address calculation
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE + threadIdx.x * sizeof(unsigned int));

    // Ensure thread-specific pointer does not exceed end_ptr
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Write pattern in a loop across threadIdx within BLOCKSIZE
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = pattern;
    }
}