#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    int idx = blockIdx.x * N + threadIdx.x; // Calculate global index
    int stride = blockDim.x; // Define stride as blockDim
    // Loop through elements with stride
    for (int32_t i = idx; i < blockIdx.x * N + N; i += stride) {
        output[i] = K_A_B - row_sum[blockIdx.x] - col_sum[i - blockIdx.x * N];
    }
}