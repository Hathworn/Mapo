#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void drawHeart(int CIRCLE_SEGMENTS, float *xx, float*yy) {
    float scale = 0.5f;

    // Compute unique global thread index across the grid
    int i = blockIdx.y * blockDim.y * CIRCLE_SEGMENTS + blockIdx.x * blockDim.x + threadIdx.y * CIRCLE_SEGMENTS + threadIdx.x;

    // Ensure valid index
    if (i < CIRCLE_SEGMENTS * blockDim.y * blockDim.x) {
        float const theta = 2.0f * 3.1415926f * (float)i / (float)CIRCLE_SEGMENTS;
        xx[i] = scale * 16.0f * sinf(theta) * sinf(theta) * sinf(theta);
        yy[i] = -1 * scale * (13.0f * cosf(theta) - 5.0f * cosf(2.0f * theta) - 2 * cosf(3.0f * theta) - cosf(4.0f * theta));
    }
}