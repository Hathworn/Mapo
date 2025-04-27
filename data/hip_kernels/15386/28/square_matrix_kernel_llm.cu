#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Calculate row and column index for this thread
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread accesses valid indices
    if (i < num_rows && j < num_cols) {
        // Perform the square and assign
        float f = feats[i * ldf + j];
        feats_sq[i * lds + j] = f * f;
    }
}