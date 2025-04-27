#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using more efficient memory access
__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    int32_t row_value = row_sum[blockIdx.x]; // Load row sum for the current block
    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        int32_t col_value = col_sum[i]; // Load column sum for the current index
        output[blockIdx.x * N + i] = K_A_B - row_value - col_value; // Calculate offset
    }
}