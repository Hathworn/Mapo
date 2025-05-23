#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sinewave(float *heightMap, unsigned int width, unsigned int height, float time)
{
const float freq = 4.0f;
const size_t stride = gridDim.x * blockDim.x;

// Iterate through the entire array in a way that is
// independent of the grid configuration
for (size_t tid = blockIdx.x * blockDim.x + threadIdx.x; tid < width * height; tid += stride) {
// Calculate the x, y coordinates
const size_t y = tid / width;
const size_t x = tid - y * width;
// Normalize x, y to [0,1]
const float u = ((2.0f * x) / width)  - 1.0f;
const float v = ((2.0f * y) / height) - 1.0f;
// Calculate the new height value
const float w = 0.5f * sinf(u * freq + time) * cosf(v * freq + time);
// Store this new height value
heightMap[tid] = w;
}
}