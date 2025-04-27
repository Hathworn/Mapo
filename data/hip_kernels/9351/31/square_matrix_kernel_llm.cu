#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Calculate global indices for the current thread
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Process by rows and columns using grid stride loops
    for (; i < num_rows; i += blockDim.y * gridDim.y) {
        for (int col = j; col < num_cols; col += blockDim.x * gridDim.x) {
            float f = feats[i * ldf + col];
            feats_sq[i * lds + col] = f * f;
        }
    }
}