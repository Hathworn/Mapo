#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Calculate global thread index
    int32_t index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds and process each element
    while (index < N) {
        output[blockIdx.x * N + index] = -col_sum[index];
        index += blockDim.x * gridDim.x;  // Move to the next stripe handled by this thread
    }
}