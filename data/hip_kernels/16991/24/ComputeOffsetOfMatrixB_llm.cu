#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficiently iterate over the entire range with stride
    for (int32_t i = idx; i < N * gridDim.x; i += blockDim.x * gridDim.x) {
        int matrixRow = i / N;
        int matrixCol = i % N;
        *(output + i) = -row_sum[matrixRow];
    }
}