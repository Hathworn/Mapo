#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    // Optimize by reducing global memory accesses and increasing parallelism using block and grid dimensions.
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N * gridDim.x) {
        int row = idx / N;
        int col = idx % N;
        output[idx] = K_A_B - row_sum[row] - col_sum[col];
    }
}