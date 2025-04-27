#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    int32_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    int32_t stride = blockDim.x * gridDim.x;
    // Optimize loop to handle larger data sets by iterating with stride
    for (int32_t i = idx; i < N; i += stride) {
        *(output + blockIdx.x * N + i) = -col_sum[i];
    }
}