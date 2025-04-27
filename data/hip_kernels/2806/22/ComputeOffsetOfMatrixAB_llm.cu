#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use 1D grid-stride loop to ensure all elements are processed
    for (int i = idx; i < blockDim.x * gridDim.x && i < N; i += blockDim.x * gridDim.x) {
        output[i] = K_A_B - row_sum[blockIdx.x] - col_sum[i];
    }
}