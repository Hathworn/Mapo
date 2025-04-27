#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TgvComputeOpticalFlowVectorKernel(const float *u, const float2 *tv2, int width, int height, int stride, float2 *warpUV)
{
    // Calculate global thread indices
    const int ix = blockIdx.x * blockDim.x + threadIdx.x;
    const int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds before calculating position
    if (ix < width && iy < height) 
    {
        const int pos = ix + iy * stride;
         
        // Load values from global memory
        float us = u[pos];
        float2 tv2s = tv2[pos];
        
        // Write results back to global memory
        warpUV[pos].x = us * tv2s.x;
        warpUV[pos].y = us * tv2s.y;
    }
}