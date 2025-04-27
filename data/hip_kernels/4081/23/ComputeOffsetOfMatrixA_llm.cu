#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Calculate global index to handle more threads than N
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Stride loop to cover all elements with given number of threads
    for (int32_t i = idx; i < N; i += blockDim.x * gridDim.x) {
        output[blockIdx.x * N + i] = -col_sum[i];
    }
}