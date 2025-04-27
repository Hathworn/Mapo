#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* __restrict__ row_sum, int32_t* __restrict__ output, int32_t N) {
    int32_t i = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    int32_t offset = blockIdx.x * N; // Pre-calculate offset for each block

    // Use grid-stride loop to cover all elements
    while (i < N) {
        output[offset + i] = -row_sum[blockIdx.x]; // Use pre-calculated offset
        i += blockDim.x * gridDim.x; // Advance in grid-stride
    }
}