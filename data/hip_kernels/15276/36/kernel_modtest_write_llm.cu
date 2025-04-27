#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    // Calculate thread-specific starting pointer
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the pointer exceeds the boundary
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Loop unrolling to optimize memory writes
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE/sizeof(unsigned int); i++){
        if (i % MOD_SZ == offset) {
            ptr[i] = p1;  // Assign `p1` when condition met
        } else {
            ptr[i] = p2;  // Assign `p2` otherwise
        }
    }
}