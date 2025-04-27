#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    const int b = blockDim.x;
    int p = y * pitch + x;

    // Load data into shared memory with boundary check
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLT_MAX;  // Initialize to max value for min calc
        maxvals[tx] = FLT_MIN;  // Initialize to min value for max calc
    }

    // Find min and max values across 16 rows
    for (int ty = 1; ty < 16; ty++) {
        p += pitch;
        if (x < width) {
            float val = d_Data[p];
            minvals[tx] = fminf(minvals[tx], val);
            maxvals[tx] = fmaxf(maxvals[tx], val);
        }
    }
    __syncthreads();

    // Reduction within shared memory
    for (int stride = b >> 1; stride > 0; stride >>= 1) {
        if (tx < stride) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + stride]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + stride]);
        }
        __syncthreads();
    }

    // Store result from each block's shared memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}