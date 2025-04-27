#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    // Early exit if the pointer is beyond the end
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use a single loop with conditional logic to reduce branching
    unsigned int idx = threadIdx.x; // Use thread index to parallelize
    unsigned int step_size = BLOCKSIZE / sizeof(unsigned int);
    unsigned int limit = min(step_size, MOD_SZ); // Ensure we don't overrun

    for (unsigned int i = idx; i < step_size; i += blockDim.x) {
        ptr[i] = (i % MOD_SZ == offset) ? p1 : p2;
    }
}