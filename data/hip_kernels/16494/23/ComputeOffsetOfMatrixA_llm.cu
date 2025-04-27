#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Calculate the global thread index
    int32_t index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index is within bounds before writing to output
    if (index < N) {
        *(output + blockIdx.x * N + index) = -col_sum[index];
    }
}