#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Compute global thread index for row and column
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process only if within matrix dimensions
    if (row < num_rows && col < num_cols) {
        float f = feats[row * ldf + col];
        // Squaring the element
        feats_sq[row * lds + col] = f * f;
    }
}