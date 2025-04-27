#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TgvComputeOpticalFlowVectorMaskedKernel(const float *u, const float2 *tv2, float* mask, int width, int height, int stride, float2 *warpUV)
{
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure threads are within bounds
    if (iy < height && ix < width) {
        int pos = ix + iy * stride;
        // Only process if mask allows
        if (mask[pos] != 0.0f) {
            float us = u[pos];
            float2 tv2s = tv2[pos];
            warpUV[pos].x = us * tv2s.x;
            warpUV[pos].y = us * tv2s.y;
        }
    }
}