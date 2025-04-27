#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    const int p = y * width + x;

    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
        for (int ty = 1; ty < 16; ty++) {
            val = d_Data[p + ty * width];
            minvals[tx] = fminf(val, minvals[tx]); // Use fminf for min comparison
            maxvals[tx] = fmaxf(val, maxvals[tx]); // Use fmaxf for max comparison
        }
    } else {
        minvals[tx] = maxvals[tx] = d_Data[p - x];
    }

    __syncthreads();

    // Use warp shuffle to perform reduction within a warp
    for (int d = b / 2; d > 0; d >>= 1) {
        if (tx < d) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + d]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + d]);
        }
        __syncthreads();
    }

    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}