#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Cache row_sum in a local variable
    int32_t row_sum_value = row_sum[blockIdx.x];
    
    // Use grid stride loop for better memory access
    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        *(output + blockIdx.x * N + i) = -row_sum_value;
    }
}