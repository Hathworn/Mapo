#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) { // Ensure index is within bounds
        output[blockIdx.x * N + idx] = -row_sum[blockIdx.x]; // Linear indexing for better coalescing
    }
}