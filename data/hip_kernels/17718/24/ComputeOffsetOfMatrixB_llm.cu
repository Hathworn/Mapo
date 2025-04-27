#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Use shared memory to reduce redundant reads
    __shared__ int32_t shared_row_sum;
    
    // Load row_sum[blockIdx.x] into shared memory
    if (threadIdx.x == 0) {
        shared_row_sum = row_sum[blockIdx.x];
    }
    __syncthreads();

    // Compute the offset using the loaded shared data
    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        output[blockIdx.x * N + i] = -shared_row_sum;
    }
}