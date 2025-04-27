#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    int32_t globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int32_t stride = gridDim.x * blockDim.x;
    // Loop over all elements using a grid-stride loop
    for (int32_t i = globalIdx; i < N; i += stride) {
        output[blockIdx.x * N + i] = -col_sum[i];
    }
}