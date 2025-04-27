#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    // Calculate the starting position for this block
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Quickly check if this block is out of bounds
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Use idx to eliminate recalculation of address offset
    unsigned int idx = threadIdx.x;
    int stride = blockDim.x;

    // Loop with thread-stride to maximize parallel execution
    for (unsigned int i = idx; i < BLOCKSIZE / sizeof(unsigned long); i += stride){
        ptr[i] = (unsigned long) &ptr[i];
    }
    
    return;
}