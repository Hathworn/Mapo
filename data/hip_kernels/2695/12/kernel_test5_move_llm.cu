#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCKSIZE 256 // Update as needed

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the pointer is out of bounds
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Use shared memory for optimization
    __shared__ unsigned int shared_memory[BLOCKSIZE / sizeof(unsigned int)];

    // Load data into shared memory
    for (unsigned int i = 0; i < half_count; i++) {
        shared_memory[i] = ptr[i];
    }

    __syncthreads(); // Sync before using shared memory data

    // First transformation
    for (unsigned int i = 0; i < half_count - 8; i++) {
        ptr[i + 8] = shared_memory[i];
    }

    // Second transformation
    for (unsigned int i = 0; i < 8; i++) {
        ptr[i] = shared_memory[half_count - 8 + i];
    }

    return;
}