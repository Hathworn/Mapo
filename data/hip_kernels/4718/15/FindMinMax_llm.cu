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

    // Load data into shared memory and handle out-of-bounds
    float val = (x < width) ? d_Data[p] : d_Data[p - tx];
    minvals[tx] = val;
    maxvals[tx] = val;

    // Loop through y-dimension within block and compute local min/max
    for (int ty = 1; ty < blockDim.y; ty++) {
        p += pitch;
        if (x < width) {
            val = d_Data[p];
            minvals[tx] = fminf(minvals[tx], val);
            maxvals[tx] = fmaxf(maxvals[tx], val);
        }
    }
    __syncthreads();

    // Reduce within block to find min and max
    for (int d = blockDim.x / 2; d > 0; d >>= 1) {
        if (tx < d) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + d]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + d]);
        }
        __syncthreads();
    }

    // Write result to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr + 0] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}