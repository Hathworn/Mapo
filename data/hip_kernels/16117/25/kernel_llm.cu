#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(unsigned char *ptr, int ticks) {
    // map from threadIdx/BlockIdx to pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;
    
    // Pre-compute constants outside the loop
    const float dim_half = DIM / 2.0f;
    const float ticks_factor = ticks / 7.0f;

    // now calculate the value at that position
    float fx = x - dim_half;
    float fy = y - dim_half;
    float d = sqrtf(fx * fx + fy * fy);
    float d_div_10 = d / 10.0f;
    
    // Optimize the cosine and division computation
    float grey_f = 128.0f + 127.0f * cosf(d_div_10 - ticks_factor) / (d_div_10 + 1.0f);
    unsigned char grey = static_cast<unsigned char>(grey_f);
    
    ptr[offset * 4 + 0] = grey;
    ptr[offset * 4 + 1] = grey;
    ptr[offset * 4 + 2] = grey;
    ptr[offset * 4 + 3] = 255;
}