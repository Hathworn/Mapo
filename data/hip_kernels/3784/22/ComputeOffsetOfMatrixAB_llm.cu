#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* __restrict__ row_sum, const int32_t* __restrict__ col_sum, int32_t* __restrict__ output, int32_t K_A_B, int32_t N) {
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index does not exceed bounds
    if (idx < N) {
        int32_t col_index = idx % blockDim.x;
        // Pre-compute constant row offset
        int32_t row_offset = K_A_B - row_sum[blockIdx.x];
        // Calculate output
        *(output + blockIdx.x * N + col_index) = row_offset - col_sum[col_index];
    }
}