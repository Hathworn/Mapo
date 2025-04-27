#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate the global index
    int32_t idx = blockIdx.x * N + threadIdx.x;
    
    // Unroll loops using grid-stride loop for better performance
    for (int32_t i = idx; i < (blockIdx.x + 1) * N; i += blockDim.x * gridDim.x) {
        output[i] = -row_sum[blockIdx.x];
    }
}