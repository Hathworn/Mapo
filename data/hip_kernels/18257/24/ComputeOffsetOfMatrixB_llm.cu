#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    int32_t globalIdx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    int32_t totalThreads = gridDim.x * blockDim.x; // Total number of threads in the grid
    int32_t rowOffset = blockIdx.x * N; // Precompute row offset

    for (int32_t i = globalIdx; i < N; i += totalThreads) {
        output[rowOffset + i] = -row_sum[blockIdx.x];
    }
}