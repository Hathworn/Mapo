#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sinewave(float *heightMap, unsigned int width, unsigned int height, float time)
{
    const float freq = 4.0f;

    // Pre-calculate values used multiple times
    const float invWidth = 2.0f / width;
    const float invHeight = 2.0f / height;

    // Iterate through the entire array in a way that is independent of the grid configuration
    for (size_t tid = blockIdx.x * blockDim.x + threadIdx.x; tid < width * height; tid += blockDim.x * gridDim.x) {
        // Calculate the x, y coordinates
        const size_t y = tid / width;
        const size_t x = tid % width;

        // Normalize x, y to [-1,1]
        const float u = x * invWidth - 1.0f;
        const float v = y * invHeight - 1.0f;

        // Calculate the new height value and store it
        heightMap[tid] = 0.5f * sinf(u * freq + time) * cosf(v * freq + time);
    }
}