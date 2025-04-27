```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_vbo_kernel(float4 *pos, unsigned int width, unsigned int height, float time)
{
    // Calculate global thread ID
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within bounds
    if (x < width && y < height) {
        // Calculate uv coordinates
        float u = (x / (float)width) * 2.0f - 1.0f;
        float v = (y / (float)height) * 2.0f - 1.0f;

        // Calculate simple sine wave pattern
        float freq = 4.0f;
        float w = sinf(u * freq + time) * cosf(v * freq + time) * 0.5f;

        // Write output vertex
        pos[y * width + x] = make_float4(u, w, v, 1.0f);
    }
}