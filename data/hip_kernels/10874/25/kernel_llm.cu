#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(unsigned char *ptr, int ticks) {
    // map from threadIdx/BlockIdx to pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;
    
    // now calculate the value at that position
    float fx = x - DIM / 2;
    float fy = y - DIM / 2;
    float d = sqrtf(fx * fx + fy * fy);

    // optimize repetitive calculation
    float f = cos(d / 10.0f - ticks / 7.0f) / (d / 10.0f + 1.0f);
    unsigned char grey = (unsigned char)(128.0f + 127.0f * f);

    // merge writes to global memory to avoid multiple accesses
    int pixel = (grey << 24) | (grey << 16) | (grey << 8) | 255;
    reinterpret_cast<int*>(ptr)[offset] = pixel;
}