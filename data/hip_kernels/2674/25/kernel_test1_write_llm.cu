#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    // Calculate the start pointer for this block
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Quick check if the current block's pointer is out of range
    if (ptr >= (unsigned long*)end_ptr) {
        return;
    }

    // Use threadIdx.x to iterate over elements within the block to maximize parallelism
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned long); i += blockDim.x) {
        ptr[i] = (unsigned long)&ptr[i];
    }
}