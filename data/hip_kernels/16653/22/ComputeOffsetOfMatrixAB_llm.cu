#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* __restrict__ row_sum, const int32_t* __restrict__ col_sum, int32_t* __restrict__ output, int32_t K_A_B, int32_t N) {
    int32_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        // Precalculate row_offset to avoid redundant computation
        int32_t row_offset = K_A_B - row_sum[blockIdx.x];
        output[blockIdx.x * N + idx] = row_offset - col_sum[idx];
    }
}