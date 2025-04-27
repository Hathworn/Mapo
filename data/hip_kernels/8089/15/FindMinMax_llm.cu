#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    const int b = blockDim.x;
    int p = y * pitch + x;

    // Initialize shared memory with boundary checks
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
        for (int ty = 1; ty < 16; ty++) {
            p += pitch;
            val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val;
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    } else {
        minvals[tx] = FLT_MAX;
        maxvals[tx] = FLT_MIN;
    }
    
    // Synchronize threads before reduction
    __syncthreads();

    // Reduction in shared memory
    for (int stride = b / 2; stride > 0; stride >>= 1) {
        if (tx < stride) {
            if (minvals[tx + stride] < minvals[tx]) {
                minvals[tx] = minvals[tx + stride];
            }
            if (maxvals[tx + stride] > maxvals[tx]) {
                maxvals[tx] = maxvals[tx + stride];
            }
        }
        __syncthreads();
    }

    // Write the result from block to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr + 0] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}