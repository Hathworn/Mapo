#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Optimize to use shared memory for better performance
    extern __shared__ float shared_feats[];

    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < num_rows && j < num_cols) {
        // Load data into shared memory
        int shared_index = threadIdx.y * blockDim.x + threadIdx.x;
        shared_feats[shared_index] = feats[i * ldf + j];
        __syncthreads();  // Ensure all threads have written to shared memory

        // Compute square
        float f = shared_feats[shared_index];
        feats_sq[i * lds + j] = f * f;
    }
}