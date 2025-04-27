#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void imagePaddingKernel(float3 *ptr, float3 *dst, int width, int height, int top, int bottom, int left, int right)
{
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Check if the thread is within bounds of the padded image
    if (x >= left && x < (width - right) && y >= top && y < (height - bottom)) {
        
        // Calculate the source position considering padding
        int srcX = x - left;
        int srcY = y - top;
        int paddedWidth = width - right - left;

        // Load the color from source and store in destination
        float3 color = ptr[srcY * paddedWidth + srcX];
        dst[y * width + x] = color;
    }
}