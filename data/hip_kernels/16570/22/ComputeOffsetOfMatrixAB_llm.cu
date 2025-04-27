#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel to compute matrix offset using shared memory for efficiency
__global__ void ComputeOffsetOfMatrixAB(const int32_t* __restrict__ row_sum, const int32_t* __restrict__ col_sum, int32_t* __restrict__ output, int32_t K_A_B, int32_t N) {
    // Shared memory for row_sum to reduce global memory reads
    __shared__ int32_t shared_row_sum;
    
    if (threadIdx.x == 0) {
        shared_row_sum = row_sum[blockIdx.x];
    }
    __syncthreads();

    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        output[blockIdx.x * N + i] = K_A_B - shared_row_sum - col_sum[i];
    }
}