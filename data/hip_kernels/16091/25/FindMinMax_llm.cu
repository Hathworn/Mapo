#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height) {
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    
    int tx = threadIdx.x;
    int x = blockIdx.x * 128 + tx;
    int y = blockIdx.y * 16;
    int p = y * width + x;
    
    // Load initial min/max values into shared memory
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLT_MAX;
        maxvals[tx] = -FLT_MAX;
    }
    
    // Collaborative loading of data by threads in the block
    for (int ty = 1; ty < 16; ty++) {
        p += width;
        if (x < width) {
            float val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val;
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    }
    __syncthreads();
    
    // Parallel reduction for min/max values
    for (unsigned int s = warpSize / 2; s > 0; s >>= 1) {
        if (tx < s && tx + s < 128) {
            if (minvals[tx + s] < minvals[tx]) minvals[tx] = minvals[tx + s];
            if (maxvals[tx + s] > maxvals[tx]) maxvals[tx] = maxvals[tx + s];
        }
        __syncthreads();
    }
    
    // Write the results from shared to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}