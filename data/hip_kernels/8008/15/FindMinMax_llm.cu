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

    // Load the initial values into shared memory
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLT_MAX;
        maxvals[tx] = -FLT_MAX;
    }

    // Process each row
    for (int ty = 1; ty < 16 && (y + ty) < height; ty++) {
        p += pitch;
        if (x < width) {
            float val = d_Data[p];
            minvals[tx] = fminf(minvals[tx], val);
            maxvals[tx] = fmaxf(maxvals[tx], val);
        }
    }
    __syncthreads();

    // Reduce within the block
    for (int d = b >> 1; d > 0; d >>= 1) {
        if (tx < d) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + d]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + d]);
        }
        __syncthreads();
    }

    // Write the result for this block
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}