#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function for better memory access and execution efficiency
__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* __restrict__ feats, int32_t ldf, float* __restrict__ feats_sq, int32_t lds) {
    // Calculate row and column indices using block and thread indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundaries to ensure no out-of-bound access
    if (row < num_rows && col < num_cols) {
        float f = feats[row * ldf + col];
        feats_sq[row * lds + col] = f * f;
    }
}