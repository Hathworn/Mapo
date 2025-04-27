#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMulKernel(float* d_M, float* d_N, float* d_P, int width) {

    // Compute row and column of the target element to compute
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure row and column are within bounds
    if (row < width && col < width) {
        float sum = 0.0f;

        // Optimize memory access by using shared memory for matrix tiles
        __shared__ float M_shared[32][32];
        __shared__ float N_shared[32][32];

        // Iterate over tiles
        for (int tile = 0; tile < width / 32; ++tile) {
            
            // Load tiles into shared memory
            M_shared[threadIdx.y][threadIdx.x] = d_M[row * width + tile * 32 + threadIdx.x];
            N_shared[threadIdx.y][threadIdx.x] = d_N[(tile * 32 + threadIdx.y) * width + col];
            __syncthreads(); // Synchronize to ensure all threads have loaded their data

            // Compute partial dot product
            for (int k = 0; k < 32; ++k) {
                sum += M_shared[threadIdx.y][k] * N_shared[k][threadIdx.x];
            }
            __syncthreads(); // Synchronize before loading the next tile
        }

        // Assign computed value
        d_P[row * width + col] = sum;
    }
}