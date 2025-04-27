#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void EncodeValuesInternal(float value, float& origin, float& dir, float& output, int squaredMode) {
    if (squaredMode == 1) {
        // Compute output using squared mode
        float absValue = fabs(value);
        output = (1 - absValue) * (1 - absValue) * origin + (-value * value + 2 * absValue) * dir;
    } else {
        // Compute output using linear mode
        float absValue = fabs(value);
        output = (1 - absValue) * origin + absValue * dir;
    }
}

__global__ void EncodeValues(float* values, int numOfValues, float* output, int symbolSize, int squaredMode, float* dirX, float* dirY, float* negDirX, float* negDirY, float* originX, float* originY) {
    int threadId = blockDim.x * blockIdx.y * gridDim.x // Rows preceeding current row in grid
                   + blockDim.x * blockIdx.x          // Blocks preceeding current block
                   + threadIdx.x;

    __shared__ float s_values[2];
    
    // Load values into shared memory with clamping if squaredMode is enabled
    if (threadIdx.x < 2) {
        s_values[threadIdx.x] = squaredMode == 1 ? fmaxf(fminf(values[threadIdx.x], 1), -1) : values[threadIdx.x];
    }

    __syncthreads();

    if (threadId >= symbolSize) return;

    // Process X dimension
    float* dir = (s_values[0] > 0) ? dirX : negDirX;
    EncodeValuesInternal(s_values[0], originX[threadId], dir[threadId], output[threadId], squaredMode);

    // Process Y dimension if applicable
    if (numOfValues > 1) {
        dir = (s_values[1] > 0) ? dirY : negDirY;
        EncodeValuesInternal(s_values[1], originY[threadId], dir[threadId], output[threadId], squaredMode);
    }
}