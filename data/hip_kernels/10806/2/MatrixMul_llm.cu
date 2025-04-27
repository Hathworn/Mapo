#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *A, float *B, float *C, int n)
{
    // Compute row and column indices
    int row = blockIdx.y*blockDim.y + threadIdx.y;
    int col = blockIdx.x*blockDim.x + threadIdx.x;

    // Initialize sum
    float sum = 0.0f;

    // Perform the computation only if within matrix bounds
    if (row < n && col < n) {
        // Use shared memory for a and b submatrices
        __shared__ float A_shared[32][32];
        __shared__ float B_shared[32][32];

        for (int i = 0; i < n; i += 32) {
            // Collaboratively load A and B tiles into shared memory
            A_shared[threadIdx.y][threadIdx.x] = A[row*n + i + threadIdx.x];
            B_shared[threadIdx.y][threadIdx.x] = B[(i+threadIdx.y)*n + col];
            __syncthreads(); // Ensure all threads have loaded the tiles

            // Calculate partial sum for the tile
            for (int j = 0; j < 32; ++j) {
                sum += A_shared[threadIdx.y][j] * B_shared[j][threadIdx.x];
            }
            __syncthreads(); // Ensure all threads have completed the compute
        }

        // Write the result to the output matrix
        C[row*n + col] = sum;

        // Debug print
        printf("\n Block[%d][%d] : Thread[%d][%d] : Product = %.2f\n", blockIdx.x, blockIdx.y, threadIdx.x, threadIdx.y, sum);
    }
}