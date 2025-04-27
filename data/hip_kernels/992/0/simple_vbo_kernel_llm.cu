#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void simple_vbo_kernel(float4 *pos, unsigned int width, unsigned int height, float time)
{
    // Calculate global thread index
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x >= width || y >= height) return; // Boundary check to avoid out-of-bounds access

    // Calculate uv coordinates
    float u = x / (float)width;
    float v = y / (float)height;
    u = u * 2.0f - 1.0f;
    v = v * 2.0f - 1.0f;

    // Calculate simple sine wave pattern
    float freq = 4.0f;
    float w = __sinf(u * freq + time) * __cosf(v * freq + time) * 0.5f; // Use fast math intrinsics

    // Write output vertex
    pos[y * width + x] = make_float4(u, -0.55f, v, 1.0f);
}