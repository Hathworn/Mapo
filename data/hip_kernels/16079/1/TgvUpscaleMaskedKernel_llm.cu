```cuda
#include "hip/hip_runtime.h"
#include "includes.h"

/// scalar field to upscale
texture<float, hipTextureType2D, hipReadModeElementType> texCoarse;
texture<float2, hipTextureType2D, hipReadModeElementType> texCoarseFloat2;

__global__
__global__ void TgvUpscaleMaskedKernel(float * mask, int width, int height, int stride, float scale, float *out)
{
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure thread is within bounds
    if (ix >= width || iy >= height) return;

    int pos = ix + iy * stride;
    
    // Interpolate texture value and scale
    float x = ((float)ix + 0.5f) / (float)width;
    float y = ((float)iy + 0.5f) / (float)height;
    out[pos] = tex2D(texCoarse, x, y) * scale;
}