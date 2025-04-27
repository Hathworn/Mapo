#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16

__global__ void squareMatrixMult(float *d_a, float *d_b, float *d_result, int n)
{
    __shared__ float tile_a[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float tile_b[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * BLOCK_SIZE + threadIdx.y;
    int col = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    float tmp = 0;
    int idx;

    for (int sub = 0; sub < gridDim.x; ++sub) {
        // Load tiles efficiently
        idx = row * n + sub * BLOCK_SIZE + threadIdx.x;
        tile_a[threadIdx.y][threadIdx.x] = (idx < n * n) ? d_a[idx] : 0.0f;

        idx = (sub * BLOCK_SIZE + threadIdx.y) * n + col;
        tile_b[threadIdx.y][threadIdx.x] = (idx < n * n) ? d_b[idx] : 0.0f;

        __syncthreads();

        // Unroll loop to improve performance
        #pragma unroll
        for (int k = 0; k < BLOCK_SIZE; ++k) {
            tmp += tile_a[threadIdx.y][k] * tile_b[k][threadIdx.x];
        }

        __syncthreads();
    }

    // Write back the result if within bounds
    if (row < n && col < n) {
        d_result[row * n + col] = tmp;
    }
}