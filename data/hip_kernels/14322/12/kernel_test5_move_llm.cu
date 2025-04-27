#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check bounds of input pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Merge copy operations to reduce loop overhead
    for (unsigned int i = 0; i < half_count; ++i) {
        if (i < half_count - 8) {
            ptr[i + 8] = ptr_mid[i];
        }
        if (i < 8) {
            ptr[i] = ptr_mid[half_count - 8 + i];
        }
        // Only perform this copy when index is valid
        ptr_mid[i] = ptr[i];
    }
}