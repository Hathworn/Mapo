#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaKernelTexture2D(unsigned char* surface, int width, int height, size_t pitch, float t)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check for thread bounds and return early if out of bounds
    if (x >= width || y >= height) return;

    unsigned char* pixel = (unsigned char*)(surface + y * pitch) + 4 * x;

    // Precompute trigonometric terms to optimize performance
    float cos_t = cos(t);
    float cos_tx = cos(t + 10.0f * ((2.0f * x) / width - 1.0f));
    float cos_ty = cos(t + 10.0f * ((2.0f * y) / height - 1.0f));

    // Populate pixel colors
    float value_x = 0.5f + 0.5f * cos_tx;
    float value_y = 0.5f + 0.5f * cos_ty;

    // Use precomputed cos_t
    pixel[0] = 255 * (0.5f + 0.5f * cos_t);                   // blue
    pixel[1] = 255 * (0.5f * pixel[1] / 255.0f + 0.5f * pow(value_y, 3.0f)); // green
    pixel[2] = 255 * (0.5f * pixel[0] / 255.0f + 0.5f * pow(value_x, 3.0f)); // red
    pixel[3] = 255;                                           // alpha
}
```
