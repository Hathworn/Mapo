#include "hip/hip_runtime.h"
#include "includes.h"

#define PADDED_BLOCK_SIZE (block_size + 2) // Define macro for padded block size

__global__ void calculation(int *a, int *b, int *c, int constant, int vector_size) {
    int tid = (blockIdx.x * blockDim.x) + threadIdx.x; // Compute global thread ID

    __shared__ int sharedDataA[PADDED_BLOCK_SIZE]; // Shared memory with padding

    // Calculate left and right neighbor indices with wrap-around
    int leftNeighbor = (tid > 0) ? tid - 1 : vector_size - 1;
    int rightNeighbor = (tid < vector_size - 1) ? tid + 1 : 0;

    // Load data into shared memory
    if (tid < vector_size) {
        sharedDataA[threadIdx.x + 1] = a[tid]; // Center
        if (threadIdx.x == 0) {
            sharedDataA[0] = a[leftNeighbor]; // Left border
        }
        if (threadIdx.x == block_size - 1) {
            sharedDataA[PADDED_BLOCK_SIZE - 1] = a[rightNeighbor]; // Right border
        }
    }

    // Load B buffer (no shared memory needed)
    int curr_b = (tid < vector_size) ? b[tid] : 0;

    __syncthreads();

    // Perform calculation
    if (tid < vector_size) {
        int output_c = (sharedDataA[threadIdx.x] - sharedDataA[threadIdx.x + 2]) * curr_b;
        output_c += sharedDataA[threadIdx.x + 1] * constant;

        // Write result to global memory
        c[tid] = output_c;
    }
}