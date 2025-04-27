#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forwardDifference2DAdjointKernel(const int cols, const int rows, const float* dx, const float* dy, float* target) {
    // Calculate the globally unique ID for the thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 1;
    int idy = blockIdx.y * blockDim.y + threadIdx.y + 1;
    
    // Calculate stride for grid
    int strideX = blockDim.x * gridDim.x;
    int strideY = blockDim.y * gridDim.y;

    // Loop through all elements assigned to this thread
    for (int y = idy; y < cols - 1; y += strideY) {
        for (int x = idx; x < rows - 1; x += strideX) {
            const int index = x + rows * y;
            // Compute the forward difference
            target[index] = -dx[index] + dx[index - 1] - dy[index] + dy[index - rows];
        }
    }
}