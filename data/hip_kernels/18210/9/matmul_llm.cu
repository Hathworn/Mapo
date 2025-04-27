#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul(const float *a, const float *b, float *c, int n, int m) {
    // Assign thread indices for current computation
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int j = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Ensure thread is within matrix bounds
    if (i < n and j < m) {
        // Use shared memory for input matrices
        __shared__ float shared_a[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ float shared_b[BLOCK_SIZE][BLOCK_SIZE];

        float sum = 0;

        // Loop over sub-matrices
        for (int tileIdx = 0; tileIdx < (n - 1) / BLOCK_SIZE + 1; ++tileIdx) {
            // Load data into shared memory
            if (j < m && tileIdx * BLOCK_SIZE + threadIdx.x < n)
                shared_a[threadIdx.y][threadIdx.x] = a[j * n + tileIdx * BLOCK_SIZE + threadIdx.x];
            if (i < n && tileIdx * BLOCK_SIZE + threadIdx.y < m)
                shared_b[threadIdx.y][threadIdx.x] = b[(tileIdx * BLOCK_SIZE + threadIdx.y) * n + i];
            
            __syncthreads(); // Synchronize threads to ensure data is loaded

            // Perform matrix multiplication on shared data
            for (int k = 0; k < BLOCK_SIZE; ++k) {
                sum += shared_a[threadIdx.y][k] * shared_b[k][threadIdx.x];
            }

            __syncthreads(); // Synchronize before loading new block
        }
        c[j * n + i] = sum; // Write result to global memory
    }
}