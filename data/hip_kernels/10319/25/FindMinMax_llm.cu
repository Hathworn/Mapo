#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;  // Replace deprecated __mul24 with regular multiplication
    const int y = blockIdx.y * 16;
    int p = y * width + x;
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = maxvals[tx] = FLT_MAX;  // Initiate with neutral values for reduction
    }
    __syncthreads();

    for (int ty = 1; ty < 16; ty++) {
        p += width;
        if (x < width) {
            float val = d_Data[p];
            if (val < minvals[tx])
                minvals[tx] = val;
            if (val > maxvals[tx])
                maxvals[tx] = val;
        }
    }
    __syncthreads();

    for (int stride = 64; stride > 0; stride >>= 1) {  // Use stride-based reduction
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