#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    // Using blockIdx.x only once outside the loop for efficiency
    int idx = blockIdx.x * N + threadIdx.x;
    int rowValue = row_sum[blockIdx.x];
    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        // Calculating index only once to reduce arithmetic operations
        int globalIdx = idx + i * blockDim.x;
        output[globalIdx] = K_A_B - rowValue - col_sum[i];
    }
}