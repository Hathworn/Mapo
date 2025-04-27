#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RGBToRGBAf(uchar3* srcImage, float4* dstImage, uint32_t width, uint32_t height)
{
    // Calculate the x and y coordinates
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    // Check if the coordinates are within bounds
    if (x < width && y < height) 
    {
        int pixel = y * width + x;

        // Load the pixel and convert to float4
        const uchar3 px = srcImage[pixel];
        dstImage[pixel] = make_float4(px.x, px.y, px.z, 255.0f);
    }
}