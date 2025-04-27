#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Use blockDim.x * blockIdx.x to compute global thread index
    int32_t globalIndex = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Iterate over elements with globalIndex and stride of total threads in the grid
    int32_t stride = gridDim.x * blockDim.x;
    for (int32_t i = globalIndex; i < N; i += stride) {
        output[blockIdx.x * N + i] = -col_sum[i];
    }
}