```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    int p = y * pitch + x;

    // Initialize shared memory with data
    if (x < width && p < pitch * height) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLT_MAX; // Edge case: initialize to max possible
        maxvals[tx] = -FLT_MAX; // Edge case: initialize to min possible
    }

    // Iterate over the rest of the rows
    for (int ty = 1; ty < 16 && y + ty < height; ty++) {
        p += pitch;
        if (x < width) {
            float val = d_Data[p];
            minvals[tx] = min(minvals[tx], val);
            maxvals[tx] = max(maxvals[tx], val);
        }
    }
    __syncthreads();

    // Reduce min and max values within the block
    for (int d = blockDim.x / 2; d > 0; d >>= 1) {
        if (tx < d) {
            minvals[tx] = min(minvals[tx], minvals[tx + d]);
            maxvals[tx] = max(maxvals[tx], maxvals[tx + d]);
        }
        __syncthreads();
    }

    // Write results to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}