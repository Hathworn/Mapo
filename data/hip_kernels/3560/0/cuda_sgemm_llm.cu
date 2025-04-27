#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_sgemm(float* matrix_a, float* matrix_b, float* matrix_c, size_t M, size_t K, size_t N) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize memory access pattern by using shared memory
    __shared__ float shared_a[BLOCK_SIZE_Y][BLOCK_SIZE_X];
    __shared__ float shared_b[BLOCK_SIZE_X][BLOCK_SIZE_Y];

    float sum = 0;
    for (int tile = 0; tile < (K + BLOCK_SIZE_X - 1) / BLOCK_SIZE_X; ++tile) {
        int tiledRow = row;
        int tiledCol = tile * BLOCK_SIZE_X + threadIdx.x;
        if (tiledRow < M && tiledCol < K) {
            shared_a[threadIdx.y][threadIdx.x] = matrix_a[INDEX(tiledRow, tiledCol, M, K)];
        } else {
            shared_a[threadIdx.y][threadIdx.x] = 0;
        }

        tiledRow = tile * BLOCK_SIZE_Y + threadIdx.y;
        tiledCol = col;
        if (tiledRow < K && tiledCol < N) {
            shared_b[threadIdx.y][threadIdx.x] = matrix_b[INDEX(tiledRow, tiledCol, K, N)];
        } else {
            shared_b[threadIdx.y][threadIdx.x] = 0;
        }
        
        __syncthreads();

        // Perform computation over tile
        for (int k = 0; k < BLOCK_SIZE_X; ++k) {
            sum += shared_a[threadIdx.y][k] * shared_b[k][threadIdx.x];
        }
        __syncthreads();
    }

    if (col < N && row < M) {
        matrix_c[INDEX(row, col, M, N)] = sum;
    }
}