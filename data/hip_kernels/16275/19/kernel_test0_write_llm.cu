#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    // Calculate start pointer for each block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Exit if block is out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }
    
    // Use threadIdx.x in loop to allow parallel writing by individual threads within a block
    unsigned int idx = threadIdx.x;
    
    // Number of elements each thread writes
    unsigned int elems_per_thread = (BLOCKSIZE / sizeof(unsigned int)) / blockDim.x;
    
    // Optimization: Unroll loop for better performance
    #pragma unroll
    for (unsigned int j = 0; j < elems_per_thread; j++) {
        ptr[idx * elems_per_thread + j] = pattern;
    }

    return;
}