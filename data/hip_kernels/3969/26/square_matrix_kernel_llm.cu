#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Use shared memory to improve memory access pattern
    extern __shared__ float shared_feats[];
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < num_rows && j < num_cols) {
        // Load elements into shared memory
        shared_feats[threadIdx.y * blockDim.x + threadIdx.x] = feats[i * ldf + j];
        __syncthreads();

        // Use shared memory for computation to reduce global memory access
        float f = shared_feats[threadIdx.y * blockDim.x + threadIdx.x];
        feats_sq[i * lds + j] = f * f;
    }
}