#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_mult(int *a, int *b, int *c, int N) {
    // Calculate row and column index based on block and thread indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int sum = 0;

    // Ensure within bounds before computating
    if (col < N && row < N) {
        // Use shared memory to store matrices for faster access
        __shared__ int shared_a[16][16];
        __shared__ int shared_b[16][16];

        for (int i = 0; i < (N + 15) / 16; ++i) {
            // Load data into shared memory
            if (i * 16 + threadIdx.x < N && row < N)
                shared_a[threadIdx.y][threadIdx.x] = a[row * N + i * 16 + threadIdx.x];
            else
                shared_a[threadIdx.y][threadIdx.x] = 0;

            if (i * 16 + threadIdx.y < N && col < N)
                shared_b[threadIdx.y][threadIdx.x] = b[(i * 16 + threadIdx.y) * N + col];
            else
                shared_b[threadIdx.y][threadIdx.x] = 0;

            __syncthreads();

            // Calculate partial sum
            for (int j = 0; j < 16; ++j) {
                sum += shared_a[threadIdx.y][j] * shared_b[j][threadIdx.x];
            }
            __syncthreads();
        }
        // Store result in global memory
        c[row * N + col] = sum;
    }
}