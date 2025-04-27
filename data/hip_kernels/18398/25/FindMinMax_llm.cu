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

    // Initialize shared memory with conditionally assigned values
    float val = (x < width) ? d_Data[p] : d_Data[p - x];
    minvals[tx] = val;
    maxvals[tx] = val;

    // Process remaining rows in the block
    for (int ty = 1; ty < 16; ty++) {
        p += width;
        if (x < width) {
            val = d_Data[p];
            // Update min and max values
            if (val < minvals[tx]) minvals[tx] = val;
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    }
    __syncthreads();

    // Reduce min and max values within the block
    int mod = 1;
    for (int d = 1; d < b; d <<= 1) {
        if ((tx & mod) == 0) {
            float minCandidate = minvals[tx + d];
            float maxCandidate = maxvals[tx + d];
            if (minCandidate < minvals[tx]) minvals[tx] = minCandidate;
            if (maxCandidate > maxvals[tx]) maxvals[tx] = maxCandidate;
        }
        mod = (mod << 1) | 1;
        __syncthreads();
    }

    // Write the block's min and max to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}