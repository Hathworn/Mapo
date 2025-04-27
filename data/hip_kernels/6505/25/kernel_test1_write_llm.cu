#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void kernel_test1_write(char* _ptr, char* end_ptr, unsigned int* err) {
    unsigned long* ptr = (unsigned long*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check boundary and exit early if out of range
    if (ptr >= (unsigned long*) end_ptr) {
        return;
    }

    // Calculate the loop limit once
    unsigned int limit = BLOCKSIZE / sizeof(unsigned long);

    // Unroll the loop for better performance
    for (unsigned int i = 0; i < limit; i += 4) {
        ptr[i] = (unsigned long) &ptr[i];
        ptr[i + 1] = (unsigned long) &ptr[i + 1];
        ptr[i + 2] = (unsigned long) &ptr[i + 2];
        ptr[i + 3] = (unsigned long) &ptr[i + 3];
    }

    return;
}