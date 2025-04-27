#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if the current block's start pointer exceeds the end pointer
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Iterate over each element in the block and write its address for the whole block
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned long); i += blockDim.x) {
        ptr[i] = (unsigned long) &ptr[i];
    }
}