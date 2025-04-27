#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate global thread index
    int index = blockIdx.x * N + threadIdx.x;
    if (threadIdx.x < N) { // Ensure within bounds
        output[index] = -row_sum[blockIdx.x];
    }
}