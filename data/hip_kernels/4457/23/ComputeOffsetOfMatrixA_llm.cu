#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Optimize by calculating the global index once
    int32_t idx = blockIdx.x * N + threadIdx.x;
    
    // Use a while loop to process all necessary elements
    while (threadIdx.x < N) {
        output[idx] = -col_sum[threadIdx.x];
        threadIdx.x += blockDim.x; // Move to the next element
        idx += blockDim.x; // Update the global index accordingly
    }
}