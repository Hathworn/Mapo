#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if pointer reaches or exceeds the end boundary
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate half_count once
    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Combine two loops to reduce kernel launch iterations
    for (unsigned int i = 0; i < half_count; i++) {
        if (i < half_count - 8) {
            ptr[i + 8] = ptr_mid[i];
        }
        if (i >= half_count - 8) {
            ptr[i - (half_count - 8)] = ptr_mid[i];
        }
    }

    return;
}