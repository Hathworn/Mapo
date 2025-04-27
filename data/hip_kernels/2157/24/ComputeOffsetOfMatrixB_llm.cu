#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Cache row_sum[blockIdx.x] in a shared variable to reduce global memory access
    __shared__ int32_t cached_row_sum;
    if (threadIdx.x == 0) {
        cached_row_sum = row_sum[blockIdx.x];
    }
    __syncthreads();

    // Use the cached value for the entire block
    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        output[blockIdx.x * N + i] = -cached_row_sum;
    }
}