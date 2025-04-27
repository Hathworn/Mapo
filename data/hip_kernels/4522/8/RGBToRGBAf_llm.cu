#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void RGBToRGBAf(uchar3* srcImage, float4* dstImage, int width, int height)
{
    // Calculate pixel position
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit for out-of-bound threads
    if( x >= width || y >= height )
        return;

    int pixel = y * width + x;
    const float s = 1.0f;
    const uchar3 px = srcImage[pixel];
    
    // Directly assign values with scale
    dstImage[pixel] = make_float4(px.x * s, px.y * s, px.z * s, 255.0f * s);
}