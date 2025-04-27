#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    int32_t idx = blockIdx.x * N + threadIdx.x;  // Calculate the index once
    int32_t stride = blockDim.x;  // Define the stride
    
    // Iterate through indices with the calculated stride
    for (int32_t i = threadIdx.x; i < N; i += stride) {
        output[idx + i] = -row_sum[blockIdx.x];  // Directly modify the target element
    }
}