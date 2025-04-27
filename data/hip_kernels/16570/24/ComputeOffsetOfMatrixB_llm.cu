#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate the global thread index
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the index is within bounds
    if (idx < N) {
        output[blockIdx.x * N + idx] = -row_sum[blockIdx.x];
    }
}