#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_matrix_kernel(int32_t num_rows, int32_t num_cols, const float* feats, int32_t ldf, float* feats_sq, int32_t lds) {
    // Use shared memory to improve access speed
    extern __shared__ float shared_feats[];
    
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (row < num_rows && col < num_cols) {
        // Load element into shared memory
        shared_feats[threadIdx.y * blockDim.x + threadIdx.x] = feats[row * ldf + col];
        __syncthreads();
        
        // Calculate square using shared memory
        feats_sq[row * lds + col] = shared_feats[threadIdx.y * blockDim.x + threadIdx.x] * shared_feats[threadIdx.y * blockDim.x + threadIdx.x];
    }
}