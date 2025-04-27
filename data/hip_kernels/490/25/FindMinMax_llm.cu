#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    const int b = blockDim.x;
    int p = y * width + x;

    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
        for (int ty = 1; ty < 16; ++ty) {
            p += width;
            val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val; // Update minimum
            if (val > maxvals[tx]) maxvals[tx] = val; // Update maximum
        }
    } else {
        minvals[tx] = FLT_MAX;
        maxvals[tx] = -FLT_MAX;
    }

    __syncthreads();

    // Perform reduction within the block to find global min/max
    for (int d = b / 2; d > 0; d >>= 1) {
        if (tx < d) {
            float tempMin = minvals[tx + d];
            float tempMax = maxvals[tx + d];
            if (tempMin < minvals[tx]) minvals[tx] = tempMin; // Reduce min
            if (tempMax > maxvals[tx]) maxvals[tx] = tempMax; // Reduce max
        }
        __syncthreads();
    }

    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}