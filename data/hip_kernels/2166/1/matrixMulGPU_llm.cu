#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMulGPU(int *a, int *b, int *c, int N) {
    // Use shared memory to optimize memory access
    __shared__ int shared_a[TILE_DIM][TILE_DIM];
    __shared__ int shared_b[TILE_DIM][TILE_DIM];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int val = 0;

    for (int tile = 0; tile < (N + TILE_DIM - 1) / TILE_DIM; ++tile) {
        // Load data into shared memory
        if (row < N && tile * TILE_DIM + threadIdx.x < N)
            shared_a[threadIdx.y][threadIdx.x] = a[row * N + tile * TILE_DIM + threadIdx.x];
        else
            shared_a[threadIdx.y][threadIdx.x] = 0;

        if (col < N && tile * TILE_DIM + threadIdx.y < N)
            shared_b[threadIdx.y][threadIdx.x] = b[(tile * TILE_DIM + threadIdx.y) * N + col];
        else
            shared_b[threadIdx.y][threadIdx.x] = 0;

        __syncthreads();

        // Perform the multiplication
        for (int k = 0; k < TILE_DIM; ++k)
            val += shared_a[threadIdx.y][k] * shared_b[k][threadIdx.x];

        __syncthreads();
    }

    // Store the result back to global memory
    if (row < N && col < N)
        c[row * N + col] = val;
}