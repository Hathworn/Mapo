#include "hip/hip_runtime.h"
#include "includes.h"

#define W 4000
#define H 20530

__global__ void calcmean(float *matrix, float *mean) {
    // Calculate row index using blockIdx.y and threadIdx.y
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate column index using blockIdx.x and threadIdx.x
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the kernel has a valid row and column index based on the size
    if (row < H && col < W) {
        // Atomic operation to increment the mean for the current row
        atomicAdd(&mean[row], matrix[row * W + col] / W);
    }
}