#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_move(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check boundary condition
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate half of the count to be processed
    unsigned int half_count = BLOCKSIZE / sizeof(unsigned int) / 2;
    unsigned int* ptr_mid = ptr + half_count;

    // Use shared memory for faster data transfer
    __shared__ unsigned int shared_mem[BLOCKSIZE / sizeof(unsigned int)];

    // Load data into shared memory
    unsigned int idx = threadIdx.x;
    if (idx < half_count) {
        shared_mem[idx] = ptr[idx];
        __syncthreads();

        // Copy second half from shared memory
        ptr_mid[idx] = shared_mem[idx];
        __syncthreads();

        // Perform main operations using shared memory
        if (idx < half_count - 8) {
            shared_mem[idx + 8] = shared_mem[idx];
        }
        if (idx < 8) {
            shared_mem[idx] = shared_mem[half_count - 8 + idx];
        }
        __syncthreads();

        // Write results back to global memory
        if (idx < half_count - 8) {
            ptr[idx + 8] = shared_mem[idx + 8];
        }
        if (idx < 8) {
            ptr[idx] = shared_mem[idx];
        }
    }
}