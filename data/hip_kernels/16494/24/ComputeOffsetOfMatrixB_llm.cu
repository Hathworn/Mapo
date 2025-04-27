#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate unique thread index in grid
    int32_t global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds
    if (global_idx < N) {
        output[global_idx] = -row_sum[blockIdx.x];
    }
}