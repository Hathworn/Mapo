```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int i;
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);

    // Check boundary once, no iteration needed if out of bounds
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Use a single loop with conditionals to reduce iterations
    for (i = 0; i < BLOCKSIZE / sizeof(unsigned int); i++) {
        if (i % MOD_SZ == offset) {
            ptr[i] = p1;  // Set to p1 when condition met
        } else {
            ptr[i] = p2;  // Set to p2 otherwise
        }
    }

    return;
}