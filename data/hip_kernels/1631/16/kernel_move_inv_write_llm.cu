#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    // Calculate the starting pointer for this block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Exit early if the block is out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }
    
    // Calculate the iteration limit
    unsigned int limit = BLOCKSIZE / sizeof(unsigned int);
    
    // Use a warp-synchronous loop for better parallelism
    for (unsigned int i = threadIdx.x; i < limit; i += blockDim.x) {
        ptr[i] = pattern;
    }
    
    return;
}