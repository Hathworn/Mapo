#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;  // Simplified arithmetic
    const int y = blockIdx.y * 16;
    const int b = blockDim.x;
    int p = y * width + x;
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLT_MAX;  // Use FLT_MAX and FLT_MIN to avoid unnecessary read
        maxvals[tx] = -FLT_MAX;
    }

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
    for (int d = b / 2; d > 0; d >>= 1) {  // Use a single loop for reduction
        if (tx < d) {
            if (minvals[tx + d] < minvals[tx])
                minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx])
                maxvals[tx] = maxvals[tx + d];
        }
        __syncthreads();
    }

    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}