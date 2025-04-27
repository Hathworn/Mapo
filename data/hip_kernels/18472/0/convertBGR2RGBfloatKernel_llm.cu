#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertBGR2RGBfloatKernel(uchar3 *src, float3 *dst, int width, int height)
{
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Use a single condition check to cover both x and y bounds
    if (x < width && y < height) {
        int idx = y * width + x;  // Calculate index once
        uchar3 color = src[idx];
        dst[idx] = make_float3(color.z, color.y, color.x);
    }
}