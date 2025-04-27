#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    // Calculate the starting pointer for the block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if pointer exceeds end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use a stride loop to ensure memory coalescing and reduce divergent warps
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = pattern;
    }
}