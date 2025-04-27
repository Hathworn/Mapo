#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Use shared memory for faster access
    __shared__ unsigned int shared_mem[BLOCKSIZE / sizeof(unsigned int)];

    // Load data into shared memory first
    for (unsigned int i = 0; i < half_count; i++) {
        shared_mem[i] = ptr[i];
    }
    
    // Copy from shared memory to destination
    for (unsigned int i = 0; i < half_count - 8; i++) {
        ptr[i + 8] = shared_mem[i];
    }

    // Directly write remaining 8 elements
    for (unsigned int i = 0; i < 8; i++) {
        ptr[i] = shared_mem[half_count - 8 + i];
    }
}