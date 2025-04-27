#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    int32_t idx = blockIdx.x * N + threadIdx.x;
    int32_t stride = blockDim.x;
    
    // Loop unrolling for coalesced memory access optimization
    for (int32_t i = idx; i < blockIdx.x * N + N; i += stride) {
        output[i] = -col_sum[i - blockIdx.x * N];
    }
}