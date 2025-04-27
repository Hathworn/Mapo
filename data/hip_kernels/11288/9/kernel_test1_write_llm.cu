#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned long* ptr = (unsigned long*)(_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if the pointer exceeds the end pointer
    if (ptr >= (unsigned long*)end_ptr) {
        return;
    }

    // Use a thread-wise stride to increase memory access coalescing
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned long); i += blockDim.x) {
        ptr[i] = (unsigned long)&ptr[i];
    }
}