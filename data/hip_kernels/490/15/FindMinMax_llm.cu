#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * blockDim.x + tx; // Use blockDim.x for better flexibility
    const int y = blockIdx.y * blockDim.y;

    float minval = FLT_MAX;
    float maxval = -FLT_MAX;

    // Load data and find local min/max
    if (x < width) {
        for (int ty = 0; ty < 16 && (y + ty) < height; ty++) {
            int p = (y + ty) * pitch + x;
            float val = d_Data[p];
            minval = fminf(minval, val);
            maxval = fmaxf(maxval, val);
        }
    }

    minvals[tx] = minval;
    maxvals[tx] = maxval;
    __syncthreads();

    // Reduce within block
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (tx < offset) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + offset]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + offset]);
        }
        __syncthreads();
    }

    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}