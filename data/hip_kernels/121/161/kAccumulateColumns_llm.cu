#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAccumulateColumns(float* mat, float* indices, float* target, int mat_width, int target_width, int height, float mult, int avg) {
    const int row = gridDim.x * blockIdx.y + blockIdx.x;
    const int column = threadIdx.x;
    
    if (row < height && column < target_width) {
        float cur_sum = 0.0f;
        unsigned int count = 0;

        // Use shared memory to reduce global memory access
        extern __shared__ float shared_indices[];
        if (threadIdx.x < mat_width) {
            shared_indices[threadIdx.x] = indices[threadIdx.x];
        }
        __syncthreads();

        for (unsigned int i = 0; i < mat_width; i++) {
            float idx = shared_indices[i];
            float value = mat[row + i * height];
            if ((int)idx == column) {
                count++;
                cur_sum += value;
            }
        }

        // Use a ternary operator for concise division
        target[row + height * column] = mult * cur_sum / (avg ? max(count, 1) : 1);
    }
}