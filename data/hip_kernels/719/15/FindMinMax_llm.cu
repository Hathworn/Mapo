#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];

    const int tx = threadIdx.x;
    const int x = blockIdx.x * blockDim.x + tx;
    const int y = blockIdx.y * blockDim.y;
    int p = y * pitch + x;

    float min_val = FLT_MAX;
    float max_val = -FLT_MAX;

    // Load data into registers to reduce global memory access
    for (int ty = 0; ty < 16 && (y + ty) < height; ty++) {
        if (x < width) {
            float val = d_Data[p];
            if (val < min_val) min_val = val;
            if (val > max_val) max_val = val;
        }
        p += pitch;
    }

    minvals[tx] = min_val;
    maxvals[tx] = max_val;
    __syncthreads();

    // Reduce within block
    for (int d = blockDim.x / 2; d > 0; d >>= 1) {
        if (tx < d) {
            if (minvals[tx + d] < minvals[tx]) minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx]) maxvals[tx] = maxvals[tx + d];
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