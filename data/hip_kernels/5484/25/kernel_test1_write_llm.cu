#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Ensure that the pointer calculation is within valid range
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Use threadIdx.x for parallel writes if possible
    int idx = threadIdx.x;
    for (int i = idx; i < BLOCKSIZE / sizeof(unsigned long); i += blockDim.x){
        ptr[i] = (unsigned long) &ptr[i];
    }

    return;
}