#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Return early if out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    const unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Use a single loop with register variables to reduce memory accesses
    for (unsigned int i = 0; i < half_count; i++) {
        unsigned int temp = ptr[i];
        if (i < half_count - 8) {
            ptr[i + 8] = temp;
        }
        if (i < 8) {
            ptr[i] = ptr_mid[half_count - 8 + i];
        }
        ptr_mid[i] = temp;
    }
}