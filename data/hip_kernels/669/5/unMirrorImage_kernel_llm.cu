#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unMirrorImage_kernel(uint width, uint height, uint border, uint borderWidth, uint borderHeight, float* devInput, float* devOutput) {
    // Calculate global thread indices
    int x0 = blockIdx.x * blockDim.x + threadIdx.x;
    int y0 = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check boundaries
    if (x0 < borderWidth && y0 < borderHeight) {
        // Calculate mirrored indices
        int x1 = x0 + border;
        int y1 = y0 + border;
        
        // Perform memory operation
        devOutput[y0 * borderWidth + x0] = devInput[y1 * width + x1];
    }
}