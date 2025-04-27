#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kernel_test0_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int* err, unsigned long* err_addr, unsigned long* err_expect, unsigned long* err_current, unsigned long* err_second_read)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Early exit if pointer is out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Optimized loop using thread-level parallelism
    unsigned int tid = threadIdx.x;
    unsigned int stride = blockDim.x;
    for (unsigned int i = tid; i < BLOCKSIZE / sizeof(unsigned int); i += stride) {
        ptr[i] = pattern;
    }
}