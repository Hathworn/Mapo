#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate the unique index for each thread
    int32_t index = blockIdx.x * N + threadIdx.x;
    // Use a stride loop to process all elements
    for (int32_t i = index; i < N * (blockIdx.x + 1); i += blockDim.x) {
        output[i] = -row_sum[blockIdx.x];
    }
}