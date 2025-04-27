#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    // Calculate starting pointer for this block
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if pointer is within the valid range
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Use threadIdx.x to write data in parallel
    int idx = threadIdx.x;
    int stride = blockDim.x;
    
    // Loop through data in steps of warp size for coalesced memory access
    for (int i = idx; i < BLOCKSIZE / sizeof(unsigned long); i += stride) {
        ptr[i] = (unsigned long)&ptr[i];
    }
}