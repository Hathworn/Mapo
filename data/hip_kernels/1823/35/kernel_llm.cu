#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(unsigned char *ptr, int ticks) {
    // Calculate thread's absolute position in 2D grid
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Exit if out of bounds
    if (x >= DIM || y >= DIM) return;

    // Calculate 1D offset index
    int offset = x + y * blockDim.x * gridDim.x;
    
    // Precompute common values for pixel calculation
    float fx = x - DIM/2;
    float fy = y - DIM/2;
    float d = sqrtf(fx * fx + fy * fy);
    float value = 128.0f + 127.0f * cosf(d/10.0f - ticks/7.0f) / (d/10.0f + 1.0f);
    unsigned char grey = (unsigned char)value;
    
    // Write result to memory with RGBA channels
    ptr[offset*4 + 0] = grey;
    ptr[offset*4 + 1] = grey;
    ptr[offset*4 + 2] = grey;
    ptr[offset*4 + 3] = 255;
}