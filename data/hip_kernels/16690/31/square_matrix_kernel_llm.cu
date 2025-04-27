#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Calculate global index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to avoid out of range memory access
    if (row < num_rows && col < num_cols) {
        float f = feats[row * ldf + col];
        feats_sq[row * lds + col] = f * f;
    }
}