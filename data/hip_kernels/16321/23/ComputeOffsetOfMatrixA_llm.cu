#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixA(const int32_t* col_sum, int32_t* output, int32_t N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index
    if (idx < N) { // Ensure the global index is within bounds
        output[blockIdx.x * N + idx] = -col_sum[idx]; // Directly access using idx
    }
}