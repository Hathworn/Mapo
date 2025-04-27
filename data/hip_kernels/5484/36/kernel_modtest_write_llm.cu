#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    // Pre-calculate useful constants for loop conditions
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int total_elements = BLOCKSIZE / sizeof(unsigned int);
    
    // Early exit if pointer exceeds the end address
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use single loop with conditional for write efficiency
    for (unsigned int i = 0; i < total_elements; i++) {
        if (i % MOD_SZ == offset) {
            ptr[i] = p1;  // Write p1 at positions matching offset
        } else {
            ptr[i] = p2;  // Otherwise write p2
        }
    }

    return;
}