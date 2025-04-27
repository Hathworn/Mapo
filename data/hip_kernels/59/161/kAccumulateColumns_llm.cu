#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAccumulateColumns(float* mat, float* indices, float* target, int mat_width, int target_width, int height, float mult, int avg) {
    const int row = blockIdx.x + blockIdx.y * gridDim.x;
    const int column = threadIdx.x;

    // Ensure the current thread is within bounds
    if (row < height && column < target_width) {
        float cur_sum = 0.0f;
        unsigned int count = 0;

        // Unroll loop to improve memory access efficiency
        for (unsigned int i = 0; i < mat_width; i++) {
            int idx_match = (__float_as_int(indices[i]) == column);
            count += idx_match;
            cur_sum += idx_match * mat[row + i * height];
        }

        // Prevent division by zero and apply multiplication
        target[row + height * column] = mult * cur_sum / ((avg && count > 0) ? count : 1);
    }
}