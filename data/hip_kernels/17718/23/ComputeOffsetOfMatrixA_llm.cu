#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* __restrict__ col_sum, int32_t* __restrict__ output, int32_t N) {
    // Calculate global index
    int32_t global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll the loop using stride
    for (int32_t i = global_idx; i < N; i += blockDim.x * gridDim.x) {
        // Use pointer offset for output
        output[blockIdx.x * N + i] = -col_sum[i];
    }
}