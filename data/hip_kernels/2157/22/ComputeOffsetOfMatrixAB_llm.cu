#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (idx < N) { // Check if within array bounds
        output[blockIdx.x * N + idx] = K_A_B - row_sum[blockIdx.x] - col_sum[idx]; // Compute offset
    }
}