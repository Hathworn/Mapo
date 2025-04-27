```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    // Calculate and cache the starting pointer for the current block
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the starting pointer exceeds the end_ptr
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Use threadIdx.x to access each element in parallel
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE/sizeof(unsigned long); i += blockDim.x) {
        ptr[i] = (unsigned long) &ptr[i];
    }
}