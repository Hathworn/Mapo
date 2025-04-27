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

    float val = 0.0f;

    if (x < width) {
        val = d_Data[p];
    } else {
        val = d_Data[p - x]; // Avoid reading out of bounds
    }
    minvals[tx] = val;
    maxvals[tx] = val;

    // Unrolling loop for efficiency
    for (int ty = 0; ty < 15; ty++) { // Process 16 elements in steps
        p += pitch;
        if (x < width) {
            val = d_Data[p];
            if (val < minvals[tx])
                minvals[tx] = val;
            if (val > maxvals[tx])
                maxvals[tx] = val;
        }
    }
    
    __syncthreads();

    for (int d = b / 2; d > 0; d >>= 1) { // Reduce using shared memory
        if (tx < d) {
            if (minvals[tx + d] < minvals[tx])
                minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx])
                maxvals[tx] = maxvals[tx + d];
        }
        __syncthreads();
    }

    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr + 0] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}