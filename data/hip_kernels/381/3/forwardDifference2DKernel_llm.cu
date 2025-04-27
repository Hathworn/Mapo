#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forwardDifference2DKernel(const int cols, const int rows, const float* data, float* dx, float* dy) {
    // Calculate global thread indices
    int idy = blockIdx.y * blockDim.y + threadIdx.y + 1;
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 1;

    // Ensure thread indices within bounds
    if (idy < cols - 1 && idx < rows - 1) {
        // Compute linear index
        const auto index = idx + rows * idy;
        
        // Calculate forward differences
        dx[index] = data[index + 1] - data[index];
        dy[index] = data[index + rows] - data[index];
    }
}