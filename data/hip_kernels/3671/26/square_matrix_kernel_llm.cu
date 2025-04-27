#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Use shared memory for faster data access
    __shared__ float block_feats[32][32];  // Assuming block size 32x32

    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < num_rows && j < num_cols) {
        // Load data into shared memory
        block_feats[threadIdx.y][threadIdx.x] = feats[i * ldf + j];
        __syncthreads();  // Ensure all threads have loaded their data

        // Compute and store result
        float f = block_feats[threadIdx.y][threadIdx.x];
        feats_sq[i * lds + j] = f * f;
    }
}