```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(unsigned char *ptr, int ticks)
{
    // Calculate global x and y indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Compute offset once to avoid redundant calculations
    int offset = x + y * blockDim.x * gridDim.x;

    // Calculate distance from the center
    float fx = x - DIM / 2;
    float fy = y - DIM / 2;
    float d = rsqrtf(fx * fx + fy * fy);  // Use fast inverse square root

    // Compute cosine value for grey level
    float cosine_value = cosf(d / 10.0f - ticks / 7.0f);
    unsigned char grey = (unsigned char)(128.0f + 127.0f * cosine_value / (1.0f / 10.0f * d + 1.0f));

    // Set pixel value in buffer
    int pixel_index = offset * 4;
    ptr[pixel_index + 0] = grey;
    ptr[pixel_index + 1] = grey;
    ptr[pixel_index + 2] = grey;
    ptr[pixel_index + 3] = 255;
}