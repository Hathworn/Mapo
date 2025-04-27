#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx; // Simplified index calculation
    const int y = blockIdx.y * 16;
    const int blockSize = blockDim.x;
    int p = y * width + x;

    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLOAT_MAX; // Initialize to max possible float
        maxvals[tx] = -FLOAT_MAX; // Initialize to min possible float
    }

    // Accumulate min and max values for the block
    for (int ty = 1; ty < 16; ++ty) {
        p += width;
        if (x < width && y + ty < height) {
            float val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val;
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    }
    __syncthreads();

    // Reduction using parallel tree
    for (int stride = blockSize / 2; stride > 0; stride >>= 1) {
        if (tx < stride) {
            if (minvals[tx + stride] < minvals[tx]) minvals[tx] = minvals[tx + stride];
            if (maxvals[tx + stride] > maxvals[tx]) maxvals[tx] = maxvals[tx + stride];
        }
        __syncthreads();
    }

    // Write the block's min and max to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}