```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    // Calculate the initial pointer position for this block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Exit if the pointer is out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }
    
    // Calculate the effective size of the block
    unsigned int elems_per_block = BLOCKSIZE / sizeof(unsigned int);
    
    // Use thread index to parallelize writing within a block
    unsigned int thread_id = threadIdx.x;
    
    // Loop using threads to write pattern, unroll the loop for efficiency
    #pragma unroll
    for (unsigned int i = thread_id; i < elems_per_block; i += blockDim.x) {
        ptr[i] = pattern;
    }
    
    return;
}