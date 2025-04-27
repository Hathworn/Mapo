#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Calculate row index
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Calculate column index
    if (i < num_rows && j < num_cols) { // Ensure indices are within bounds
        float f = feats[i * ldf + j]; // Load element
        feats_sq[i * lds + j] = f * f; // Square the element and store
    }
}