#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void resetArrayKernel(hipSurfaceObject_t dst, size_t width, size_t height) {
    // Calculate global thread ID for x and y dimensions
    unsigned x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread accesses are within bounds
    if (x < width && y < height) {
        // Optimize memory write with warp-level memory operation (if applicable)
        surf2Dwrite(0, dst, x * sizeof(uint32_t), y);
    }
}