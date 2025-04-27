#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    
    int p = y * width + x;
    
    float val = (x < width) ? d_Data[p] : d_Data[p - x];
    
    minvals[tx] = val;
    maxvals[tx] = val;
    
    for (int ty = 1; ty < 16; ty++)
    {
        p += width;
        val = (x < width) ? d_Data[p] : val;
        if (val < minvals[tx]) minvals[tx] = val;
        if (val > maxvals[tx]) maxvals[tx] = val;
    }
    
    __syncthreads();
    
    for (int d = 1; d < blockDim.x; d <<= 1)
    {
        int mod = 2 * d;
        if (tx % mod == 0)
        {
            if (minvals[tx + d] < minvals[tx]) minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx]) maxvals[tx] = maxvals[tx + d];
        }
        __syncthreads();
    }
    
    if (tx == 0)
    {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}