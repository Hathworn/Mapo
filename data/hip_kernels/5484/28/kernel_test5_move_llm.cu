#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int tid = threadIdx.x; // Utilize thread index for parallel processing
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x*BLOCKSIZE);

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Parallelize operations using threadIdx
    if (tid < half_count) {
        ptr_mid[tid] = ptr[tid];
    }
    __syncthreads(); // Ensure ptr_mid is completely written

    if (tid < half_count - 8) {
        ptr[tid + 8] = ptr_mid[tid];
    }
    __syncthreads(); // Ensure first operation phase is complete

    if (tid < 8) {
        ptr[tid] = ptr_mid[half_count - 8 + tid];
    }
}