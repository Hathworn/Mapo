#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    // Calculate the global index
    unsigned int idx = blockIdx.x * BLOCKSIZE / sizeof(unsigned int);
    unsigned int* ptr = (unsigned int*)_ptr + idx;

    // Check bounds just once using current thread's workload
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    unsigned int limit = BLOCKSIZE / sizeof(unsigned int);

    // Unroll the loop for efficiency, assuming MOD_SZ is known at compile time
    for (unsigned int i = offset; i < limit; i += MOD_SZ) {
        ptr[i] = p1; // Set p1 for all offset matched positions
    }

    for (unsigned int i = 0; i < limit; i++) {
        // Use recalculated idx for correct indexing and set p2 for others
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;
        }
    }
}