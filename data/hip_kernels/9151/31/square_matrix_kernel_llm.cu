#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Use shared memory to reduce global memory accesses
    __shared__ float shared_feats[1024]; // Adjust size as needed based on occupancy and architecture

    int tid = threadIdx.y * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Prefetch data into shared memory if within bounds
    if (i < num_rows && j < num_cols) {
        shared_feats[tid] = feats[i * ldf + j];
        __syncthreads(); // Ensure all threads have loaded their data

        // Use shared memory for computation
        float f = shared_feats[tid];
        feats_sq[i * lds + j] = f * f;
    }
}