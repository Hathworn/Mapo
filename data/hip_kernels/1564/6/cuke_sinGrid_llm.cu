#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuke_sinGrid(unsigned char *surface, int width, int height, size_t pitch, float t)
{
    // Calculate pixel coordinates
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Skip invalid thread indices
    if (x >= width || y >= height) return;

    // Compute stride and pixel offset
    float* pixel = reinterpret_cast<float*>(surface + y * pitch) + 4 * x;

    // Calculate color values
    float cos_x = cos(t + 10.0f * (2.0f * x / width - 1.0f));
    float cos_y = cos(t + 10.0f * (2.0f * y / height - 1.0f));

    // Update pixel colors with precomputed values
    pixel[0] = 0.5f * pixel[0] + 0.5f * __powf(0.5f + 0.5f * cos_x, 3.0f); // Red
    pixel[1] = 0.5f * pixel[1] + 0.5f * __powf(0.5f + 0.5f * cos_y, 3.0f); // Green
    pixel[2] = 0.5f + 0.5f * cos(t); // Blue
    pixel[3] = 1.0f; // Alpha
}