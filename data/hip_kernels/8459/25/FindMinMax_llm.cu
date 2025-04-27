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
    
    // Ensure threads work on valid data
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
        // Iterate over the rows within the block
        for (int ty = 1; ty < 16; ty++) {
            p += width;
            val = d_Data[p];
            if (val < minvals[tx])
                minvals[tx] = val;
            if (val > maxvals[tx])
                maxvals[tx] = val;
        }
    } else {
        float dummyVal = d_Data[p - x];  // Use dummy value for threads outside boundary
        minvals[tx] = dummyVal;
        maxvals[tx] = dummyVal;
    }

    __syncthreads();
    
    // Perform reduction to obtain block-wise min/max
    for (int d = b / 2; d >= 1; d >>= 1) {
        if (tx < d) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + d]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + d]);
        }
        __syncthreads();
    }
    
    // Write block results to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
    __syncthreads();
}