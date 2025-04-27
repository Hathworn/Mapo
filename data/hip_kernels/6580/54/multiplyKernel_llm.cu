#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiplyKernel(float* Z, float* A, float* B, int size) {
    int id = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for better memory access patterns
    __shared__ float sharedA[BLOCK_SIZE];
    __shared__ float sharedB[BLOCK_SIZE];

    if (id < size) {
        // Load data into shared memory
        sharedA[threadIdx.x] = A[id];
        sharedB[threadIdx.x] = B[id];
        __syncthreads();  // Ensure all data is loaded

        // Perform multiplication using shared memory
        Z[id] = sharedA[threadIdx.x] * sharedB[threadIdx.x];
    }
}