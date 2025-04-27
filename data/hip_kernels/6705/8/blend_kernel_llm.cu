#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blend_kernel(float *outSrc, const float *inSrc) {
    // Calculate global thread ID directly
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Use ternary operators for boundary checks
    int left = (x > 0) ? offset - 1 : offset;
    int right = (x < DIM - 1) ? offset + 1 : offset;
    int top = (y > 0) ? offset - DIM : offset;
    int bottom = (y < DIM - 1) ? offset + DIM : offset;

    // Compute output using optimized access
    outSrc[offset] = inSrc[offset] + SPEED * (inSrc[top] + inSrc[bottom] + inSrc[left] + inSrc[right] - inSrc[offset] * 4);
}