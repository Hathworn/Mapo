#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* __restrict__ row_sum, int32_t* __restrict__ output, int32_t N) {
    // Use shared memory to reduce redundant global memory access
    __shared__ int32_t shared_row_sum;

    // Load the row_sum into shared memory once per block
    if (threadIdx.x == 0) {
        shared_row_sum = -row_sum[blockIdx.x];
    }
    
    // Synchronize threads to ensure shared memory is loaded
    __syncthreads();

    // Compute offset using shared memory data
    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        output[blockIdx.x * N + i] = shared_row_sum;
    }
}