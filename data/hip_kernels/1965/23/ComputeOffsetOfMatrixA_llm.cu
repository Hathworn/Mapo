#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to handle large data sets
    for (int i = idx; i < N; i += gridDim.x * blockDim.x) {
        output[blockIdx.x * N + i] = -col_sum[i];
    }
}