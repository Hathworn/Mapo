#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err)
{
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Exit early if pointer is beyond end
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Use threadIdx.x to parallelize memory writes within block
    unsigned int idx = threadIdx.x;
    while (idx < BLOCKSIZE / sizeof(unsigned long)) {
        ptr[idx] = (unsigned long)&ptr[idx];
        idx += blockDim.x;
    }
}