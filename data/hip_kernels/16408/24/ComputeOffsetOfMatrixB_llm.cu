#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate global thread ID
    int32_t global_id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride pattern for efficiency
    for (int32_t i = global_id; i < N * gridDim.x; i += blockDim.x * gridDim.x) {
        int32_t row_index = i / N;
        int32_t col_index = i % N;
        output[i] = -row_sum[row_index];
    }
}