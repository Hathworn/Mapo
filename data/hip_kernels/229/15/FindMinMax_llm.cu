```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * blockDim.x + tx; // Use blockDim.x instead of fixed value
    const int y = blockIdx.y * 16;
    int p = y * pitch + x;

    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
        for (int ty = 1; ty < 16; ty++) {
            p += pitch;
            val = d_Data[p];
            minvals[tx] = fminf(minvals[tx], val); // Use fminf for readability
            maxvals[tx] = fmaxf(maxvals[tx], val); // Use fmaxf for readability
        }
    } else {
        minvals[tx] = FLT_MAX;  // Avoid reading out of bounds, use FLT_MAX
        maxvals[tx] = FLT_MIN;  // Use FLT_MIN
    }
    __syncthreads();
    
    for (int d = blockDim.x / 2; d > 0; d >>= 1) { // Iterate from half blockDim.x downward
        if (tx < d && (tx + d) < blockDim.x) { // Avoid out of bounds
            minvals[tx] = fminf(minvals[tx], minvals[tx + d]); // Use fminf
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + d]); // Use fmaxf
        }
        __syncthreads();
    }
    
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}