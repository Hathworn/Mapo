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

    // Initialize shared memory with boundary checks
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLT_MAX;
        maxvals[tx] = -FLT_MAX;
    }

    // Process each row in the block
    for (int ty = 1; ty < 16; ty++) {
        p += pitch;
        if (x < width) {
            float val = d_Data[p];
            // Atomic min/max to reduce warp-level conflicts
            atomicMin(&minvals[tx], val);
            atomicMax(&maxvals[tx], val);
        }
    }
    __syncthreads();

    // Reduction to find the minimum and maximum in this block
    int stride = blockDim.x / 2;
    while (stride > 0) {
        if (tx < stride) {
            minvals[tx] = min(minvals[tx], minvals[tx + stride]);
            maxvals[tx] = max(maxvals[tx], maxvals[tx + stride]);
        }
        __syncthreads();
        stride /= 2;
    }

    // Write final result for this block to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}