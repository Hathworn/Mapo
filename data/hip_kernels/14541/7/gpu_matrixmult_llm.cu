```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_matrixmult(int *gpu_a, int *gpu_b, int *gpu_c, int N) {
    // Calculate global row and column indices
    int col = threadIdx.x + blockDim.x * blockIdx.x;
    int row = threadIdx.y + blockDim.y * blockIdx.y;

    // Ensure within matrix bounds
    if(col < N && row < N) {
        int sum = 0; // Initialize sum to zero

        // Use shared memory for tile storage
        __shared__ int tile_a[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ int tile_b[BLOCK_SIZE][BLOCK_SIZE];

        for(int m = 0; m < (N + BLOCK_SIZE - 1) / BLOCK_SIZE; ++m) {
            // Load tiles into shared memory
            if (row < N && m * BLOCK_SIZE + threadIdx.x < N) {
                tile_a[threadIdx.y][threadIdx.x] = gpu_a[row * N + m * BLOCK_SIZE + threadIdx.x];
            } else {
                tile_a[threadIdx.y][threadIdx.x] = 0;
            }

            if (col < N && m * BLOCK_SIZE + threadIdx.y < N) {
                tile_b[threadIdx.y][threadIdx.x] = gpu_b[(m * BLOCK_SIZE + threadIdx.y) * N + col];
            } else {
                tile_b[threadIdx.y][threadIdx.x] = 0;
            }

            __syncthreads();

            // Compute partial product
            for(int k = 0; k < BLOCK_SIZE; ++k) {
                sum += tile_a[threadIdx.y][k] * tile_b[k][threadIdx.x];
            }

            __syncthreads();
        }

        // Write the result to gpu_c
        gpu_c[row * N + col] = sum;
    }
}
```
