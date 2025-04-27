#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTriUpper(float *a, int m, int n) {
    // Use block and thread index for parallelism
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure indices are within matrix bounds
    if (row < m && col < n) {
        // Set elements below the main diagonal to zero
        if (row > col) {
            a[row * n + col] = 0;
        }
    }
}