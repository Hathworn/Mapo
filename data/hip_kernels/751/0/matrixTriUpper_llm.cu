#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixTriUpper(float *a, int m, int n) {
    // Calculate row and column using block and thread indices
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds
    if (i < m && j < n) {
        // Only process lower triangle elements
        if (i > j) {
            a[i * n + j] = 0;
        }
    }
}