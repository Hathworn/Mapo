```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Compute linear index for row and column
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread operates within matrix dimensions
    if (row < num_rows && col < num_cols) {
        float f = feats[row * ldf + col];
        feats_sq[row * lds + col] = f * f;
    }
}