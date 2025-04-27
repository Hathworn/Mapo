```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Compute row and column index within the grid
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread indices are within matrix bounds
    if (i < num_rows && j < num_cols) {
        // Load element, compute its square, and store the result
        float f = feats[i * ldf + j];
        feats_sq[i * lds + j] = f * f;
    }
}