#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height) {
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    const int b = blockDim.x;
    int p = y * width + x;
    
    // Load initial values and handle boundary conditions
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        float val = -1.0e10; // Use a very large negative number
        minvals[tx] = val;
        maxvals[tx] = val;
    }
    
    // Update min and max values within the block
    for (int ty = 1; ty < 16; ty++) {
        p += width;
        if (x < width && (y + ty) < height) {
            float val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val;
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    }
    
    __syncthreads();
    
    // Reduction to find block minimum and maximum values
    for (int d = b >> 1; d > 0; d >>= 1) {
        if (tx < d) {
            if (minvals[tx + d] < minvals[tx]) minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx]) maxvals[tx] = maxvals[tx + d];
        }
        __syncthreads();
    }
    
    // Store results in global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}