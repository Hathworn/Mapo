#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRgb2XYZ(uchar4* inputImg, float4* outputImg, int width, int height)
{
    // Optimize offset calculation using a single linear index
    int offset = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x * blockDim.y 
                 + threadIdx.y * blockDim.x + threadIdx.x;

    // Ensure the thread is within image bounds
    if (offset >= width * height) return;

    uchar4 nPixel = inputImg[offset];

    float _b = (float)nPixel.x / 255.0f;
    float _g = (float)nPixel.y / 255.0f;
    float _r = (float)nPixel.z / 255.0f;

    // Utilize registers for computation
    float x = _r * 0.412453f + _g * 0.357580f + _b * 0.180423f;
    float y = _r * 0.212671f + _g * 0.715160f + _b * 0.072169f;
    float z = _r * 0.019334f + _g * 0.119193f + _b * 0.950227f;

    // Store results directly in float4
    outputImg[offset] = make_float4(x, y, z, 0.0f);
}