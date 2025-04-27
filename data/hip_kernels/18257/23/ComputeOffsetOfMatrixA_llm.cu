#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* __restrict__ col_sum, int32_t* __restrict__ output, int32_t N) {
    int32_t idx = blockIdx.x * N + threadIdx.x;
    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        // Directly access memory with calculated index for each block
        output[idx] = -col_sum[i];
        idx += blockDim.x; // Increment index considering stride
    }
}