#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    int32_t i = threadIdx.x + blockIdx.x * blockDim.x;
    // Launch as many threads as elements to ensure all elements are processed
    if (i < N) {
        output[blockIdx.x * N + i] = -col_sum[i];
    }
}