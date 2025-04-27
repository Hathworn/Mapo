#include "hip/hip_runtime.h"
#include "includes.h"
#define H 5
#define W 5

using namespace std;

__global__ void mult_dist(int *d_A, int *d_B, int *d_C) {
    // Calculate global row and column index for A and B
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundaries to prevent out of bounds memory access
    if (i < H && j < W) {
        int Pvalue = 0;

        // Use shared memory for A and B sub-matrices
        __shared__ int sh_A[H][W];
        __shared__ int sh_B[H][W];

        // Load data into shared memory
        for (int k = 0; k < H; k += blockDim.x) {
            // Load current row of A and current column of B into shared memory
            if (k + threadIdx.x < W) {
                sh_A[i][k + threadIdx.x] = d_A[i * W + (k + threadIdx.x)];
                sh_B[k + threadIdx.y][j] = d_B[(k + threadIdx.y) * W + j];
            }
            __syncthreads(); // Synchronize to ensure all data is loaded

            // Perform partial computation
            for (int kk = 0; kk < blockDim.x && k + kk < W; ++kk) {
                Pvalue += sh_A[i][k + kk] * sh_B[k + kk][j];
            }
            __syncthreads(); // Synchronize before loading new data
        }

        // Write the computed value to the output matrix
        d_C[i * W + j] = Pvalue;
    }
}