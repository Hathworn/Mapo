#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RGBToBGRA8(float3* srcImage, uchar4* dstImage, int width, int height, float scaling_factor)
{
    const int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    const int y = (blockIdx.y * blockDim.y) + threadIdx.y;
    
    if (x < width && y < height)  // Single boundary check
    {
        const int pixel = y * width + x;
        const float3 px = srcImage[pixel];

        // Direct assignment with make_uchar4
        dstImage[pixel] = make_uchar4(
            __fmul_rn(px.z, scaling_factor),
            __fmul_rn(px.y, scaling_factor),
            __fmul_rn(px.x, scaling_factor),
            255.0f * scaling_factor);
    }
}