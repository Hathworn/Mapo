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

    // Initialize shared memory with comparison for x < width
    float val = (x < width) ? d_Data[p] : d_Data[p - x];
    minvals[tx] = val;
    maxvals[tx] = val;

    // Use stride loop for memory access to reduce divergence
    for (int ty = 1; ty < 16; ty++) {
        p += pitch;
        if (x < width) {
            val = d_Data[p];
            minvals[tx] = fminf(minvals[tx], val);  // Use fminf for min values
            maxvals[tx] = fmaxf(maxvals[tx], val);  // Use fmaxf for max values
        }
    }

    __syncthreads(); // Synchronize threads before reduction

    // Use binary tree reduction pattern
    for (int d = 64; d > 0; d >>= 1) {
        if (tx < d) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + d]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + d]);
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}