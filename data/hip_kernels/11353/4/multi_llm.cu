#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multi(int *a, int *b, int *c, int n) {
    // Use shared memory to reduce global memory access latency
    __shared__ int shared_a[TILE_SIZE][TILE_SIZE];
    __shared__ int shared_b[TILE_SIZE][TILE_SIZE];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int suma = 0;

    for (int t = 0; t < (n + TILE_SIZE - 1) / TILE_SIZE; ++t) {
        // Load data into shared memory
        if (row < n && t * TILE_SIZE + threadIdx.x < n) {
            shared_a[threadIdx.y][threadIdx.x] = a[row * n + t * TILE_SIZE + threadIdx.x];
        } else {
            shared_a[threadIdx.y][threadIdx.x] = 0;
        }

        if (col < n && t * TILE_SIZE + threadIdx.y < n) {
            shared_b[threadIdx.y][threadIdx.x] = b[(t * TILE_SIZE + threadIdx.y) * n + col];
        } else {
            shared_b[threadIdx.y][threadIdx.x] = 0;
        }

        __syncthreads();

        // Perform computation using shared memory
        for (int i = 0; i < TILE_SIZE; ++i) {
            suma += shared_a[threadIdx.y][i] * shared_b[i][threadIdx.x];
        }

        __syncthreads();
    }

    // Write result back to global memory
    if (row < n && col < n) {
        c[row * n + col] = suma;
    }
}