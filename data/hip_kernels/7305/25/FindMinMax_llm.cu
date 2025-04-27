```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;  // Simplified index computation
    const int y = blockIdx.y * 16;
    int p = y * width + x;

    // Initialize shared memory with first data point or zero if out of bounds
    float val = (x < width) ? d_Data[p] : 0.0f;
    minvals[tx] = val;
    maxvals[tx] = val;

    // Loop over y dimension
    for (int ty = 1; ty < 16; ty++) {
        p += width; 
        if (x < width && p / width < height) {  // Ensure we're within bounds
            val = d_Data[p]; 
            if (val < minvals[tx]) minvals[tx] = val;
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    }
    __syncthreads();

    // Reduction to find block min and max
    for (int d = b / 2; d > 0; d >>= 1) {
        if (tx < d && tx + d < b) {
            if (minvals[tx + d] < minvals[tx]) minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx]) maxvals[tx] = maxvals[tx + d];
        }
        __syncthreads();
    }

    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}