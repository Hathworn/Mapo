```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate global index
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the index is within bounds
    if (i < N) {
        *(output + blockIdx.x * N + i) = -row_sum[blockIdx.x];
    }
}