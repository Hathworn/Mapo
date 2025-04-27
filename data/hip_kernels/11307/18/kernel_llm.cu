#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(unsigned char *ptr, int ticks) {
    // Calculate global thread position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Avoid unnecessary memory operations if out of bounds
    if (x >= DIM || y >= DIM) return;

    int offset = x + y * blockDim.x * gridDim.x;
    
    // Pre-compute constant values to reduce redundant calculations
    float fx = x - DIM * 0.5f;
    float fy = y - DIM * 0.5f;
    float distance = sqrtf(fx * fx + fy * fy);
    float cosine_value = cosf(distance * 0.1f - ticks * 0.142857f); // Precompute 1/7

    // Compute pixel color
    unsigned char grey = (unsigned char)(128.0f + 127.0f * cosine_value / (distance * 0.1f + 1.0f));
    ptr[offset * 4 + 0] = grey;
    ptr[offset * 4 + 1] = grey;
    ptr[offset * 4 + 2] = grey;
    ptr[offset * 4 + 3] = 255;
}