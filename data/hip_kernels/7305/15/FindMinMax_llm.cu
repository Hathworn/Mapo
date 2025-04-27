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
    float val;

    if (x < width) {
        val = d_Data[p];
    } else {
        val = d_Data[p - x];
    }
    
    minvals[tx] = val; // Initialize shared memory
    maxvals[tx] = val;
    __syncthreads();
    
    for (int ty = 1; ty < 16; ty++) {
        p += pitch;
        if (x < width) {
            val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val; // Update for new row
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    }
    __syncthreads();

    // Unrolled reduction to improve efficiency
    int mod = 1;
    for (int d = b / 2; d > 0; d >>= 1) {
        if (tx < d) {
            if (minvals[tx + d] < minvals[tx]) minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx]) maxvals[tx] = maxvals[tx + d];
        }
        __syncthreads();
    }
    
    if (tx == 0) { // Write the result for this block
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}