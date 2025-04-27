#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_matrix_mul(int *a, int *b, int *c) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int sum = 0;

    // Check if within matrix bounds
    if (col < N && row < N) {
        // Use shared memory for better memory access patterns
        __shared__ int shared_a[BLOCK_SIZE][BLOCK_SIZE];
        __shared__ int shared_b[BLOCK_SIZE][BLOCK_SIZE];

        for (int i = 0; i < N/BLOCK_SIZE; i++) {
            // Load matrices into shared memory
            shared_a[threadIdx.y][threadIdx.x] = a[row * N + i * BLOCK_SIZE + threadIdx.x];
            shared_b[threadIdx.y][threadIdx.x] = b[(i * BLOCK_SIZE + threadIdx.y) * N + col];
            __syncthreads();

            // Perform partial multiplication
            for (int j = 0; j < BLOCK_SIZE; j++) {
                sum += shared_a[threadIdx.y][j] * shared_b[j][threadIdx.x];
            }
            __syncthreads();
        }
        // Write back the accumulated sum to the result matrix
        c[row * N + col] = sum;
    }
}