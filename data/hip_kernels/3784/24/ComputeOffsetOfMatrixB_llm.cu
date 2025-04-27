#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate global thread index
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (i < N) {
        // Compute and store the offset
        output[blockIdx.x * N + i] = -row_sum[blockIdx.x];
    }
}