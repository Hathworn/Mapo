#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    int32_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) {
        // Efficiently calculate the output offset using linear indexing.
        *(output + blockIdx.x * N + i) = -row_sum[blockIdx.x];
    }
}