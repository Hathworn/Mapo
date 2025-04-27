#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(unsigned char *ptr, int ticks) {
    // Efficiently calculate pixel positions
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Calculate distance from the center
    float fx = x - DIM / 2;
    float fy = y - DIM / 2;
    float d = rsqrtf(fx * fx + fy * fy);  // Use reciprocal square root for efficiency

    // Calculate grey value
    float value = cosf(d * 10.0f - ticks / 7.0f) / (1.0f / d + 1.0f);
    unsigned char grey = (unsigned char)(128.0f + 127.0f * value);

    // Assign grey value to each channel, set alpha to fully opaque
    int pixelIndex = offset * 4;
    ptr[pixelIndex + 0] = grey;
    ptr[pixelIndex + 1] = grey;
    ptr[pixelIndex + 2] = grey;
    ptr[pixelIndex + 3] = 255;
}