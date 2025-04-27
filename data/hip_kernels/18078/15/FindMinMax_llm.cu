#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * blockDim.x + tx;
    const int y = blockIdx.y * 16;
    int p = y * pitch + x;

    float local_min = FLT_MAX;
    float local_max = -FLT_MAX;

    // Ensure threads within bounds to avoid reading invalid memory
    for (int ty = 0; ty < 16 && y + ty < height; ty++) {
        float val = (x < width) ? d_Data[p] : d_Data[p - x];
        local_min = fminf(local_min, val);
        local_max = fmaxf(local_max, val);
        p += pitch;
    }

    minvals[tx] = local_min;
    maxvals[tx] = local_max;
    __syncthreads();

    // Reduction to find min/max using binary tree approach
    for (int d = blockDim.x / 2; d > 0; d >>= 1) {
        if (tx < d) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + d]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + d]);
        }
        __syncthreads();
    }

    // Store result in global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}