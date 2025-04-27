#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void float_to_color(uchar4 * pixels, float* in) {
    // Calculate global thread index
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Load input value
    float num = in[offset];

    // Pre-calculate terms used multiple times
    int scaledNum = static_cast<int>(num * 255);
    int scaledMaxTemp = static_cast<int>((MAX_TEMP - num) * 255);

    // Assign to pixel
    pixels[offset].x = scaledNum;
    pixels[offset].y = 0;
    pixels[offset].z = scaledMaxTemp;
    pixels[offset].w = 255;
}