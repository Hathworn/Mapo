#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    int32_t globalIdx = blockDim.x * blockIdx.x + threadIdx.x; // Calculate global index
    if (globalIdx < N) { // Check index range
        output[blockIdx.x * N + globalIdx] = -col_sum[globalIdx]; // Direct assignment
    }
}