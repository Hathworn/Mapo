#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Calculate row and column index for each thread
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that thread indices are within matrix bounds
    if(row < num_rows && col < num_cols) {
        // Directly calculate and store the squared value
        float f = feats[row * ldf + col];
        feats_sq[row * lds + col] = f * f;
    }
}