#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    int32_t tid = threadIdx.x + blockIdx.x * blockDim.x;
    // Each thread calculates its global index and checks boundaries
    if (tid < N) {
        output[tid] = -row_sum[blockIdx.x];
    }
}