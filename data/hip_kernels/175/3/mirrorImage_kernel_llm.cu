#include "hip/hip_runtime.h"
#include "includes.h"
// vim: ts=4 syntax=cpp comments=


#define XBLOCK 16
#define YBLOCK 16

__global__ void mirrorImage_kernel(uint width, uint height, uint border, uint borderWidth, uint borderHeight, float* devInput, float* devOutput) {
    int x0 = blockDim.x * blockIdx.x + threadIdx.x;
    int y0 = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if within bounds
    if (x0 >= borderWidth || y0 >= borderHeight)
        return;

    // Calculate mirrored x1, y1 using conditional expressions
    int x1 = (x0 < border) ? (border - x0 - 1) : (x0 < border + width ? x0 - border : border + 2 * width - x0 - 1);
    int y1 = (y0 < border) ? (border - y0 - 1) : (y0 < border + height ? y0 - border : border + 2 * height - y0 - 1);

    // Write output
    devOutput[y0 * borderWidth + x0] = devInput[y1 * width + x1];
}