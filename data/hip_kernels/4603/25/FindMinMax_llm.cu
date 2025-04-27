#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * blockDim.x + tx; // Simplified index calculation
    const int y = blockIdx.y * 16; // Fixed block height
    const int p_base = y * width + x;
    
    if (x < width) {
        float val = d_Data[p_base];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLT_MAX; // Set default values to infinity for non-participating threads
        maxvals[tx] = -FLT_MAX;
    }
    
    for (int ty = 1; ty < 16; ty++) {
        const int p = p_base + ty * width; // Linear address calculation
        if (x < width && ty + y < height) {
            float val = d_Data[p];
            minvals[tx] = fminf(minvals[tx], val);
            maxvals[tx] = fmaxf(maxvals[tx], val);
        }
    }
    __syncthreads();

    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tx < stride) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + stride]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + stride]);
        }
        __syncthreads();
    }
    
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}