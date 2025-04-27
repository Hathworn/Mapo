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
    
    // Initialize shared memory to avoid branch divergence
    float val = (x < width) ? d_Data[p] : d_Data[p - x];
    minvals[tx] = val;
    maxvals[tx] = val;

    // Unroll loop for better performance
    #pragma unroll
    for (int ty = 1; ty < 16; ty++) {
        p += pitch;
        if (x < width) {
            val = d_Data[p];
            minvals[tx] = min(minvals[tx], val);
            maxvals[tx] = max(maxvals[tx], val);
        }
    }
    __syncthreads();

    // Use warp reduction to minimize synchronization
    for (int d = b / 2; d > 0; d >>= 1) {
        if (tx < d) {
            minvals[tx] = min(minvals[tx], minvals[tx + d]);
            maxvals[tx] = max(maxvals[tx], maxvals[tx + d]);
        }
        __syncthreads();
    }

    // Only one thread writes the result
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr + 0] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}