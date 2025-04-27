#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    // Obtain unique global thread ID
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread operates within matrix size
    if (globalIndex < N) {
        output[blockIdx.x * N + globalIndex] = -col_sum[globalIndex];
    }
}