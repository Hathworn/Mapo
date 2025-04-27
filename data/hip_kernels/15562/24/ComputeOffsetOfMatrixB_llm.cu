#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel for better memory coalescing and reduce redundant calculations
__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    int rowStart = blockIdx.x * N;
    int offsetValue = -row_sum[blockIdx.x]; // Store common value for re-use

    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        *(output + rowStart + i) = offsetValue; // Use precomputed value
    }
}