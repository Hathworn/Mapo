#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMulCUDA2(float *C, float *A, float *B, int n) {
    // Calculate the row and column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check to avoid accessing outside of matrix boundaries
    if (row < n && col < n) {
        float C_val = 0;

        // Use shared memory for better cache utilization
        extern __shared__ float sharedMem[];
        float* As = sharedMem;
        float* Bs = As + blockDim.x * blockDim.y;

        // Loop through tiles
        for (int tile = 0; tile < (n + blockDim.x - 1) / blockDim.x; ++tile) {
            // Load elements into shared memory
            if (tile * blockDim.x + threadIdx.x < n && row < n) {
                As[threadIdx.y * blockDim.x + threadIdx.x] = A[row * n + tile * blockDim.x + threadIdx.x];
            } else {
                As[threadIdx.y * blockDim.x + threadIdx.x] = 0.0f;
            }
            if (tile * blockDim.y + threadIdx.y < n && col < n) {
                Bs[threadIdx.y * blockDim.x + threadIdx.x] = B[(tile * blockDim.y + threadIdx.y) * n + col];
            } else {
                Bs[threadIdx.y * blockDim.x + threadIdx.x] = 0.0f;
            }

            // Synchronize before computation
            __syncthreads();

            // Perform partial matrix multiplication
            for (int k = 0; k < blockDim.x; ++k) {
                C_val += As[threadIdx.y * blockDim.x + k] * Bs[k * blockDim.x + threadIdx.x];
            }

            // Synchronize before loading the next tile
            __syncthreads();
        }

        // Write the result back to global memory
        C[row * n + col] = C_val;
    }
}