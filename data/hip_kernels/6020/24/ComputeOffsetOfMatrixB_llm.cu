#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate global thread index
    int32_t globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    // Stride to handle larger arrays
    int32_t stride = blockDim.x * gridDim.x;
    for (int32_t i = globalIdx; i < N; i += stride) {
        output[blockIdx.x * N + i] = -row_sum[blockIdx.x];
    }
}