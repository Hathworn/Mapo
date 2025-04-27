```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SolveSmoothMedianGlobalKernel3(float* u, float* v, float* bku, float* bkv, int width, int height, int stride, float *outputu, float *outputv, float *outputbku, float* outputbkv)
{
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix >= width || iy >= height) return;  // Exit early if out of bounds

    const int pos = ix + iy * stride;
    float mu[9], mv[9];

    // Load 3x3 neighborhood
    #pragma unroll  // Unroll loops for performance
    for (int j = 0; j < 3; j++) {
        for (int i = 0; i < 3; i++) {
            int col = ix + i - 1;
            int row = iy + j - 1;
            int index = j * 3 + i;

            if (col < 0) col = 0;  // Clamp to border
            if (col >= width) col = width - 1;
            if (row < 0) row = 0;
            if (row >= height) row = height - 1;

            mu[index] = u[col + stride * row];
            mv[index] = v[col + stride * row];
        }
    }

    // Sort using selection sort - Optimized
    #pragma unroll  // Unroll loops for performance
    for (int j = 0; j < 9; j++) {
        for (int i = j + 1; i < 9; i++) {
            if (mu[j] > mu[i]) {
                float tmp = mu[j];
                mu[j] = mu[i];
                mu[i] = tmp;
            }
            if (mv[j] > mv[i]) {
                float tmp = mv[j];
                mv[j] = mv[i];
                mv[i] = tmp;
            }
        }
    }

    // Compute output values
    outputu[pos] = mu[4];
    outputv[pos] = mv[4];
    outputbku[pos] = bku[pos] + u[pos] - mu[4];
    outputbkv[pos] = bkv[pos] + v[pos] - mv[4];
}