#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(unsigned char *ptr, int ticks) {
    // Calculate thread and block indices
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Precompute repeated values for efficiency
    float fx = x - DIM / 2;
    float fy = y - DIM / 2;
    float d = sqrtf(fx * fx + fy * fy);
    float cosine_value = cosf(d / 10.0f - ticks / 7.0f);
    unsigned char grey = (unsigned char)(128.0f + 127.0f * cosine_value / (d / 10.0f + 1.0f));

    // Minimize redundant calculations and branching
    int base_offset = offset * 4;
    ptr[base_offset + 0] = grey;
    ptr[base_offset + 1] = grey;
    ptr[base_offset + 2] = grey;
    ptr[base_offset + 3] = 255;
}