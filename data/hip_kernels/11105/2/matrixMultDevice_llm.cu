#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultDevice(float* d_A, float* d_B, float* d_C, int width) {
    int Row = blockDim.y * blockIdx.y + threadIdx.y;
    int Col = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for tile optimization
    __shared__ float shared_A[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float shared_B[BLOCK_SIZE][BLOCK_SIZE];

    float ans = 0.0;

    // Iterate over tiles
    for (int i = 0; i < width / BLOCK_SIZE; ++i) {
        // Load tiles into shared memory
        shared_A[threadIdx.y][threadIdx.x] = d_A[Row * width + (i * BLOCK_SIZE + threadIdx.x)];
        shared_B[threadIdx.y][threadIdx.x] = d_B[(i * BLOCK_SIZE + threadIdx.y) * width + Col];

        // Synchronize threads to ensure all data is loaded
        __syncthreads();

        // Matrix multiplication on the block
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            ans += shared_A[threadIdx.y][k] * shared_B[k][threadIdx.x];
        }

        // Synchronize before loading new tiles
        __syncthreads();
    }

    if (Row < width && Col < width) {
        d_C[Row * width + Col] = ans;
    }
}