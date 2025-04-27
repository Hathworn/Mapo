#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void imageSplitKernel(float3 *ptr, float *dst, int width, int height)
{
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Check if within image bounds
    if (x < width && y < height) {
        int idx = y * width + x; // Calculate base index once
        float3 color = ptr[idx]; // Optimize memory access
        
        dst[idx] = color.x; // Store R channel
        dst[idx + width * height] = color.y; // Store G channel
        dst[idx + 2 * width * height] = color.z; // Store B channel
    }
}