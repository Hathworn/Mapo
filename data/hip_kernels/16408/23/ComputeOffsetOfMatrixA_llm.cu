#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Calculate global thread index
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process elements with strides of total number of threads
    for (int32_t i = idx; i < N; i += blockDim.x * gridDim.x) {
        output[blockIdx.x * N + i] = -col_sum[i];
    }
}