#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* __restrict__ feats, int32_t ldf, float* __restrict__ feats_sq, int32_t lds) {
    int i = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate global row index
    int j = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global column index

    // Ensure indices are within bounds
    if (i < num_rows && j < num_cols) {
        float f = feats[i * ldf + j];  // Load feature element
        feats_sq[i * lds + j] = f * f; // Store squared value
    }
}