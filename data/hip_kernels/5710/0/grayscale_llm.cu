#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grayscale(float4* imagem, int width, int height)
{
    // Calculate the unique thread index using 2D grid and block indices
    const int i = blockIdx.y * blockDim.y * width + blockIdx.x * blockDim.x
                + threadIdx.y * width + threadIdx.x;

    if (i < width * height)
    {
        // Compute grayscale value
        float v = 0.3f * imagem[i].x + 0.6f * imagem[i].y + 0.1f * imagem[i].z;
        // Assign grayscale value to all color channels
        imagem[i] = make_float4(v, v, v, imagem[i].w);
    }
}