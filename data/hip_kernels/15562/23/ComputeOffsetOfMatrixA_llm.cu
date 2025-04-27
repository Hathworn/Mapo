#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Calculate the index for each thread
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a stride loop to ensure access across the entire array
    for (int32_t i = idx; i < blockIdx.x * N + N; i += blockDim.x * gridDim.x) {
        output[i] = -col_sum[i % N]; // Use modulo to correctly index col_sum
    }
}