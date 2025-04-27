#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAccumulateColumns(float* mat, float* indices, float* target, int mat_width, int target_width, int height, float mult, int avg) {
    const int row = blockIdx.y * gridDim.x + blockIdx.x;
    const int column = threadIdx.x;
    
    // Check bounds outside the loop for efficiency
    if (row < height && column < target_width) {
        float cur_sum = 0.0f;
        unsigned int count = 0;

        // Use shared memory for fast access if needed
        for (unsigned int i = 0; i < mat_width; i++) {
            int idx_match = __float2int_rz(indices[i]) == column;
            count += idx_match;  // Increment count only if index matches
            cur_sum += idx_match * mat[row + i * height]; // Accumulate sum only if index matches
        }

        // Avoid division by zero by checking count > 0
        target[row + height * column] = mult * cur_sum / ((avg == 1 && count > 0) ? count : 1);
    }
}