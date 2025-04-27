#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    int p = y * width + x;

    // Initialize shared memory and compute initial min/max
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLT_MAX;
        maxvals[tx] = -FLT_MAX;
    }

    // Accumulate min and max values over 16 rows
    for (int ty = 1; ty < 16; ty++) {
        p += width;
        if (x < width) {
            float val = d_Data[p];
            minvals[tx] = min(minvals[tx], val);
            maxvals[tx] = max(maxvals[tx], val);
        }
    }
    __syncthreads();

    // Reduce within block using parallel reduction
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (tx < offset) {
            minvals[tx] = min(minvals[tx], minvals[tx + offset]);
            maxvals[tx] = max(maxvals[tx], maxvals[tx + offset]);
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}