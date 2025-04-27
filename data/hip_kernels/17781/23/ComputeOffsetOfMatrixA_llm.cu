#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Calculate global index and stride based on block and grid
    int32_t index = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t stride = blockDim.x * gridDim.x;

    // Use stride-based loop to effectively utilize all threads
    for (int32_t i = index; i < N; i += stride) {
        output[blockIdx.x * N + i] = -col_sum[i];
    }
}