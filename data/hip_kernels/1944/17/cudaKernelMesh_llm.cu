#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaKernelMesh(float4* pos, unsigned int width, unsigned int height, float time)
{
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= width || y >= height) return; // Bounds check for valid indices

    // Calculate uv coordinates
    float u = 2.0f * (x / (float)width) - 1.0f;
    float v = 2.0f * (y / (float)height) - 1.0f;

    // Calculate simple sine wave pattern
    float freq = 4.0f;
    float w = sinf(u * freq + time) * cosf(v * freq + time) * 0.5f;

    // Write output vertex
    pos[y * width + x] = make_float4(u, w, v, __int_as_float(0xff00ff00)); // Color : DirectX ARGB, OpenGL ABGR
}