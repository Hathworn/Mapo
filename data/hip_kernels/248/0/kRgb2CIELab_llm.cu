#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRgb2CIELab(uchar4* inputImg, float4* outputImg, int width, int height)
{
    // Calculate the offset using optimized block and thread indexing
    int offset = (blockIdx.y * blockDim.y + threadIdx.y) * width + blockIdx.x * blockDim.x + threadIdx.x;

    uchar4 nPixel = inputImg[offset];

    // Normalize the RGB values
    float _b = static_cast<float>(nPixel.x) / 255.0f;
    float _g = static_cast<float>(nPixel.y) / 255.0f;
    float _r = static_cast<float>(nPixel.z) / 255.0f;

    // Convert RGB to XYZ
    float x = _r * 0.412453f + _g * 0.357580f + _b * 0.180423f;
    float y = _r * 0.212671f + _g * 0.715160f + _b * 0.072169f;
    float z = _r * 0.019334f + _g * 0.119193f + _b * 0.950227f;

    x /= 0.950456f;
    float y3 = powf(y, 1.0f / 3.0f);
    z /= 1.088754f;

    // Improved condition checks for L*a*b conversion
    x = x > 0.008856f ? powf(x, 1.0f / 3.0f) : (7.787f * x + 0.13793f);
    y = y > 0.008856f ? y3 : 7.787f * y + 0.13793f;
    z = z > 0.008856f ? powf(z, 1.0f / 3.0f) : (7.787f * z + 0.13793f);

    // Calculate Lab values
    float l = y > 0.008856f ? (116.0f * y3 - 16.0f) : 903.3f * y;
    float a = (x - y) * 500.0f;
    float b = (y - z) * 200.0f;

    // Store the result in the output image
    float4 fPixel;
    fPixel.x = l;
    fPixel.y = a;
    fPixel.z = b;

    outputImg[offset] = fPixel;
}