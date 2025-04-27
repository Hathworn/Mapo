#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        // Optimize access by removing multiplication from the loop
        int offset = -row_sum[blockIdx.x];
        
        for (int i = idx; i < N; i += blockDim.x) {
            *(output + blockIdx.x * N + i) = offset;
        }
    }
}