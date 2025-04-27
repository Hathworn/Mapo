#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate index using block and thread id for coalesced memory access
    int32_t idx = blockIdx.x * N + threadIdx.x;
    if (threadIdx.x < N) {
        // Assign offset computation directly using calculated index
        output[idx] = -row_sum[blockIdx.x];
    }
}