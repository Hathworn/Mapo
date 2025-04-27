#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_v1(float* a, float* b, int n) {
    // Use shared memory for faster access within a block
    __shared__ float tile[32][32+1]; // +1 to avoid bank conflicts

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int indexIn = x + y * n;

    if (x < n && y < n) {
        // Load data from global to shared memory
        tile[threadIdx.y][threadIdx.x] = a[indexIn];
    }
    __syncthreads();

    // Transpose coordinates within shared memory
    int transposedX = blockIdx.y * blockDim.y + threadIdx.x;
    int transposedY = blockIdx.x * blockDim.x + threadIdx.y;
    int indexOut = transposedX + transposedY * n;

    if (transposedX < n && transposedY < n) {
        // Write transposed data back to global memory
        b[indexOut] = tile[threadIdx.x][threadIdx.y];
    }
}