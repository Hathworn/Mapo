#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void imageNormalizationKernel(float3 *ptr, int width, int height)
{
    // Calculate global thread index
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Exit if thread is out of bounds
    if (x >= width || y >= height) {
        return;
    }

    // Pre-compute pixel index
    int pixelIdx = y * width + x;

    // Load color at pixelIdx
    float3 color = ptr[pixelIdx];

    // Normalize color components
    float normalizationFactor = 0.0078125;
    color.x = (color.x - 127.5) * normalizationFactor;
    color.y = (color.y - 127.5) * normalizationFactor;
    color.z = (color.z - 127.5) * normalizationFactor;

    // Store normalized color back to memory
    ptr[pixelIdx] = color;
}