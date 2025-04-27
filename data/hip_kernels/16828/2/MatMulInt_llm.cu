#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatMulInt(int *a, int b, int *c, int ROW, int COLUMNS) {
    // Cache row and column limits to reduce global memory access
    int rowLimit = ROW, columnLimit = COLUMNS;

    // Compute linear index
    int idx = blockIdx.y * blockDim.y * columnLimit + blockIdx.x * blockDim.x + threadIdx.y * columnLimit + threadIdx.x;

    // Check bounds before computation
    if (blockIdx.x * blockDim.x + threadIdx.x < rowLimit && blockIdx.y * blockDim.y + threadIdx.y < columnLimit) {
        c[idx] = a[idx] * b; 
    }
}