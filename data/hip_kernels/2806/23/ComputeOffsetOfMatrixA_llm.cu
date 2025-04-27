#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Optimize using shared memory and reduce global memory accesses
    extern __shared__ int32_t shared_col_sum[];
    
    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        shared_col_sum[i] = col_sum[i];
    }
    __syncthreads();

    for (int32_t i = threadIdx.x; i < N; i += blockDim.x) {
        output[blockIdx.x * N + i] = -shared_col_sum[i];
    }
}