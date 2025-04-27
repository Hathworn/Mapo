#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_move_inv_write(char* _ptr, char* end_ptr, unsigned int pattern)
{
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate pointer for this thread
    unsigned int* ptr = (unsigned int*) (_ptr + idx * sizeof(unsigned int));
    
    // Ensure pointer is within bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }
    
    // Write pattern to memory
    *ptr = pattern;
}