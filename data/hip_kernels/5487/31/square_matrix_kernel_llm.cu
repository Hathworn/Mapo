```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    int i = blockIdx.y * blockDim.y + threadIdx.y; // compute row index
    int j = blockIdx.x * blockDim.x + threadIdx.x; // compute column index

    // Ensure i and j are within bounds
    if (i < num_rows && j < num_cols) {
        float f = feats[i * ldf + j];  // load feature value
        feats_sq[i * lds + j] = f * f; // store squared value
    }
}