#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate a unique index for each thread across all blocks
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        // Use the unique index to perform calculations directly
        output[idx] = -row_sum[blockIdx.x];
    }
}