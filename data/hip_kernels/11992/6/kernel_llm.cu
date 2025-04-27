#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(unsigned char *ptr, int ticks) {
    // Calculate x, y positions
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Combine multiplications into a single offset computation
    int offset = x + y * (blockDim.x * gridDim.x);

    // Precompute reused values to avoid redundant calculations
    float fx = x - DIM / 2;
    float fy = y - DIM / 2;
    float dist = sqrtf(fx * fx + fy * fy);
    float cosineValue = cosf(dist / 10.0f - ticks / 7.0f);
    unsigned char grey = static_cast<unsigned char>(128.0f + 127.0f * cosineValue / (dist / 10.0f + 1.0f));

    // Consolidate memory writes 
    ptr[offset * 4] = grey;
    ptr[offset * 4 + 1] = grey;
    ptr[offset * 4 + 2] = grey;
    ptr[offset * 4 + 3] = 255;
}