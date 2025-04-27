#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    // Cache the row sum for the current block to reduce global memory access
    int32_t row_sum_value = row_sum[blockIdx.x];
    
    // Use grid-stride loop to handle larger datasets
    for (int32_t i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += blockDim.x * gridDim.x) {
        output[blockIdx.x * N + i] = K_A_B - row_sum_value - col_sum[i];
    }
}