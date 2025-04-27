#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    // Calculate thread index and make pointer arithmetic safer
    unsigned int tid = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int* ptr = (unsigned int*) (_ptr + tid * BLOCKSIZE);
    unsigned int* end_ptr_uint = (unsigned int*) end_ptr;

    if (ptr >= end_ptr_uint) {
        return;
    }

    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Optimize memory copy using loop unrolling
    #pragma unroll
    for (unsigned int i = 0; i < half_count; i++) {
        ptr_mid[i] = ptr[i];
    }

    #pragma unroll
    for (unsigned int i = 0; i < half_count - 8; i++) {
        ptr[i + 8] = ptr_mid[i];
    }

    #pragma unroll
    for (unsigned int i = 0; i < 8; i++) {
        ptr[i] = ptr_mid[half_count - 8 + i];
    }
    
    return;
}