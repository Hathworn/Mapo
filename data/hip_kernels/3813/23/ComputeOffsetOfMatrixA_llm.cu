#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index
    if (idx < N) {  // Check if index is within bounds
        output[blockIdx.x * N + idx] = -col_sum[idx];  // Direct indexing for optimization
    }
}