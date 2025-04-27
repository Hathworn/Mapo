#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);

    // Check if pointer exceeds end pointer early
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Unrolled loop for better performance
    #pragma unroll
    for (unsigned int i = 0; i < half_count; i++) {
        ptr_mid[i] = ptr[i];
    }

    // Unrolled loop for better performance
    #pragma unroll
    for (unsigned int i = 0; i < half_count - 8; i++) {
        ptr[i + 8] = ptr_mid[i];
    }

    // Unrolled loop for better performance
    #pragma unroll
    for (unsigned int i = 0; i < 8; i++) {
        ptr[i] = ptr_mid[half_count - 8 + i];
    }
}