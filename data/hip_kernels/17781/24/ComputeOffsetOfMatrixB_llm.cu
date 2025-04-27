#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Precompute row offset to avoid redundant computation
    int32_t rowOffset = -row_sum[blockIdx.x];

    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        // Use direct indexing to improve readability and potential cache performance
        output[blockIdx.x * N + i] = rowOffset;
    }
}