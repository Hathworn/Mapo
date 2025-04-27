#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Calculate global index for accessing arrays
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Iterate over multiple elements in case index < N
    for (int32_t i = index; i < N; i += gridDim.x * blockDim.x) {
        *(output + blockIdx.x * N + i) = -col_sum[i];
    }
}