#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* __restrict__ col_sum, int32_t* __restrict__ output, int32_t N) {
    // Use shared memory for col_sum to reduce global memory access
    extern __shared__ int32_t shared_col_sum[];
    
    // Load col_sum into shared memory, note that this works well for smaller N
    int32_t i = threadIdx.x;
    for (; i < N; i += blockDim.x) {
        shared_col_sum[i] = col_sum[i];
    }
    __syncthreads(); // Ensure all col_sum elements are loaded before computing

    // Compute the output using the shared memory
    i = threadIdx.x;
    for (; i < N; i += blockDim.x) {
        output[blockIdx.x * N + i] = -shared_col_sum[i];
    }
}