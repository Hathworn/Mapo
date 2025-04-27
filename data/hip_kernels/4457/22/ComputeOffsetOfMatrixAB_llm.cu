#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    int32_t index = blockIdx.x * N + threadIdx.x; // Calculate unique index for each thread
    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        output[index + i] = K_A_B - row_sum[blockIdx.x] - col_sum[i];
    }
}