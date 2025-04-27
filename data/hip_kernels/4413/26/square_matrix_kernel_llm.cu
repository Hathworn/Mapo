#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Calculate row and column indices for the current thread
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Only proceed if the indices are within matrix bounds
    if (row < num_rows && col < num_cols) {
        float f = feats[row * ldf + col]; // Access the feature value
        feats_sq[row * lds + col] = f * f; // Store squared value
    }
}