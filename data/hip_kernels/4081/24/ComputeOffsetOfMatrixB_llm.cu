#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    int32_t i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < N) {
        // Calculate the offset and store it in the output array
        output[i] = -row_sum[blockIdx.x];
    }
}