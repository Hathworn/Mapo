#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(unsigned char *ptr, int ticks) {
    // Calculate pixel position using division to reduce arithmetic operations
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y; 
    int offset = (idy * gridDim.x * blockDim.x) + idx;

    // Simplify position value calculations and reuse computed values
    int halfDim = DIM / 2;
    float fx = idx - halfDim;
    float fy = idy - halfDim;
    float distance = sqrtf(fx * fx + fy * fy);
    float cosine = cosf(distance / 10.0f - ticks / 7.0f);

    // Use constant and scalar expression for better readability and potential caching
    unsigned char grey = (unsigned char)(128.0f + (127.0f * cosine) / (distance / 10.0f + 1.0f));

    // Set pixel values efficiently
    int pixelOffset = offset * 4;
    ptr[pixelOffset] = grey;
    ptr[pixelOffset + 1] = grey;
    ptr[pixelOffset + 2] = grey;
    ptr[pixelOffset + 3] = 255;
}