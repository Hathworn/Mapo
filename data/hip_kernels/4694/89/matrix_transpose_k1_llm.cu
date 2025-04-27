#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrix_transpose_k1(float* input, float* output, const int nx, const int ny)
{
    // Calculate row and column indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Only execute within bounds
    if (row < ny && col < nx) {
        // Perform transpose by swapping row and column indices
        output[col * ny + row] = input[row * nx + col];
    }
}