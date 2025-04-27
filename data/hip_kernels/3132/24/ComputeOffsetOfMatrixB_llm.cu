```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixB(const int32_t* row_sum, int32_t* output, int32_t N) {
    // Compute global thread index
    int32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use grid stride loop to handle all elements when number of threads is less than N
    for (int32_t i = idx; i < N * gridDim.x; i += blockDim.x * gridDim.x) {
        int32_t row = i / N;
        int32_t col = i % N;
        // Efficiently assign the negative of row_sum value to the correct position in output
        output[row * N + col] = -row_sum[row];
    }
}