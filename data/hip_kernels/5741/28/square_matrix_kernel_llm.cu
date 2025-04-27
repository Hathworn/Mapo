#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate global row index
    int col = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global column index

    if (row < num_rows && col < num_cols) {  // Ensure indexes are within bounds
        float f = feats[row * ldf + col];  // Optimized memory access
        feats_sq[row * lds + col] = f * f;  // Compute square and store
    }
}