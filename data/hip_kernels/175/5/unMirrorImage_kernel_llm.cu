#include "hip/hip_runtime.h"
#include "includes.h"
// vim: ts=4 syntax=cpp comments=

#define XBLOCK 16
#define YBLOCK 16

// Optimized kernel function
__global__ void unMirrorImage_kernel(uint width, uint height, uint border, uint borderWidth, uint borderHeight, float* devInput, float* devOutput) {
    int x0 = blockIdx.x * blockDim.x + threadIdx.x;
    int y0 = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory for coalesced memory access (if necessary)
    // __shared__ float sharedData[...];

    if ((x0 < borderWidth) && (y0 < borderHeight)) {
        int x1 = x0 + border;
        int y1 = y0 + border;

        // Direct memory access with reduced arithmetic operations
        devOutput[y0 * borderWidth + x0] = devInput[y1 * width + x1];
    }
}