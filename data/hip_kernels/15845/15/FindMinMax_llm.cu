```c
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

    // Load initial values to shared memory
    float initial_val;
    if (x < width) {
        initial_val = d_Data[p];
    } else {
        initial_val = d_Data[y * pitch + (blockIdx.x * 128)];
    }
    minvals[tx] = initial_val;
    maxvals[tx] = initial_val;

    // Loop over rows and perform min/max reduction
    for (int ty = 1; ty < 16; ty++) {
        p += pitch;
        if (x < width) {
            float val = d_Data[p];
            if (val < minvals[tx])
                minvals[tx] = val;
            if (val > maxvals[tx])
                maxvals[tx] = val;
        }
    }
    __syncthreads();

    // Parallel reduction within block
    for (int stride = b / 2; stride > 0; stride >>= 1) {
        if (tx < stride) {
            if (minvals[tx + stride] < minvals[tx])
                minvals[tx] = minvals[tx + stride];
            if (maxvals[tx + stride] > maxvals[tx])
                maxvals[tx] = maxvals[tx + stride];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}