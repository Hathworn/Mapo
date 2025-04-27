#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(uchar4 *ptr, int ticks) {
    // Map from threadIdx/BlockIdx to pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Pre-compute constants and values used in calculations
    float center = DIM / 2.0f;
    float fx = x - center;
    float fy = y - center;
    float d = sqrtf(fx * fx + fy * fy);
    float angle = d / 10.0f - ticks / 7.0f;
    
    // Compute grey value using optimized formula
    unsigned char grey = (unsigned char)(128.0f + 127.0f * cosf(angle) / (d / 10.0f + 1.0f));
    
    // Set uchar4 values efficiently
    uchar4 pixel = make_uchar4(grey, grey, grey, 255);
    ptr[offset] = pixel;
}