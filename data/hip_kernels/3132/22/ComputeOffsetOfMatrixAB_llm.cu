#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    // Calculate a unique index for each thread
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x; 
    
    // Use a stride loop to efficiently cover the array
    for (int32_t i = idx; i < N; i += blockDim.x * gridDim.x) {
        output[blockIdx.x * N + i] = K_A_B - row_sum[blockIdx.x] - col_sum[i];
    }
}