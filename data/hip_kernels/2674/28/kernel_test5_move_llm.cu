#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    // Calculate starting pointer for this block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Exit if the pointer exceeds the end boundary
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Compute half of the required count of elements
    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Loop unrolling for improved efficiency: Moving the first array to the second
    #pragma unroll
    for (unsigned int i = 0; i < half_count; i++) {
        ptr_mid[i] = ptr[i];
    }

    // Loop unrolling for moving back elements with an 8-element shift
    #pragma unroll
    for (unsigned int i = 0; i < half_count - 8; i++) {
        ptr[i + 8] = ptr_mid[i];
    }

    // Copy the last remaining 8 elements back to the start
    #pragma unroll
    for (unsigned int i = 0; i < 8; i++) {
        ptr[i] = ptr_mid[half_count - 8 + i];
    }

    return;
}