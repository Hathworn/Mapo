#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float applysRGBGamma(float valIn)
{
    if (valIn <= 0.0031308f)
    {
        return 12.92f * valIn;
    }
    else
    {
        return (1.0f + 0.055f) * powf(valIn, 1.0f / 2.4f) - 0.055f;
    }
}

__global__ void GammasRGB(float3* __restrict__ inOutImg, int imgWidth, int imgHeight, int imgPitch)
{
    int pxX = blockIdx.x * blockDim.x + threadIdx.x;
    int pxY = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit for out-of-bounds pixels
    if (pxX >= imgWidth || pxY >= imgHeight) return;

    // Load and process pixel value
    float3* pixelPtr = (float3*)((char*)inOutImg + imgPitch * pxY) + pxX;
    float3 val = *pixelPtr;

    // Apply gamma correction with NaN handling and clamping
    val.x = applysRGBGamma(fmaxf(fminf(isnan(val.x) ? 0 : val.x, 1.0f), 0.0f));
    val.y = applysRGBGamma(fmaxf(fminf(isnan(val.y) ? 0 : val.y, 1.0f), 0.0f));
    val.z = applysRGBGamma(fmaxf(fminf(isnan(val.z) ? 0 : val.z, 1.0f), 0.0f));

    // Store the result
    *pixelPtr = val;
}