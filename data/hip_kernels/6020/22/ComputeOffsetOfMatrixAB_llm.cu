#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (idx < N) {
        // Optimized computation with pre-computed indexes
        int32_t value = K_A_B - row_sum[blockIdx.x] - col_sum[idx];
        output[blockIdx.x * N + idx] = value;
    }
}