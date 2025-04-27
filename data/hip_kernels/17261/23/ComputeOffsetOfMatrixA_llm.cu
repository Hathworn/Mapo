#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    int32_t idx = blockIdx.x * N + threadIdx.x;
    // Using grid-stride loop to handle larger N
    for (int32_t i = idx; i < (blockIdx.x + 1) * N; i += blockDim.x) {
        output[i] = -col_sum[i % N];
    }
}