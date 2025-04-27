#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Use shared memory for better performance
    extern __shared__ int32_t shared_col_sum[];

    // Calculate global index
    int32_t globalIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Load into shared memory
    if (threadIdx.x < N) {
        shared_col_sum[threadIdx.x] = col_sum[threadIdx.x];
    }
    __syncthreads();

    // Perform computation
    for (int32_t i = globalIdx; i < N; i += blockDim.x * gridDim.x) {
        output[blockIdx.x * N + i] = -shared_col_sum[i % N];
    }
}