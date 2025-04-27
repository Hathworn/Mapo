#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Use a single global memory access per output element
    int32_t idx = blockIdx.x * N + threadIdx.x;  // Calculate global index once
    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        output[idx + i] = -row_sum[blockIdx.x];  // Use updated index
    }
}