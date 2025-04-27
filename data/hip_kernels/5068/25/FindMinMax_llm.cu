#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * blockDim.x + tx; // Use blockDim.x instead of 128
    const int y = blockIdx.y * blockDim.y; // Use blockDim.y instead of 16
    const int b = blockDim.x;
    int p = y * width + x;

    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLT_MAX;
        maxvals[tx] = -FLT_MAX;
    }

    for (int ty = 1; ty < blockDim.y; ty++) { // Replace the hardcoded 16 with blockDim.y for scalability
        p += width;
        if (x < width) {
            float val = d_Data[p];
            minvals[tx] = fminf(minvals[tx], val); // Use fminf for better performance
            maxvals[tx] = fmaxf(maxvals[tx], val); // Use fmaxf for better performance
        }
    }
    __syncthreads();

    for (int d = b / 2; d > 0; d >>= 1) {
        if (tx < d) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + d]); // Use fminf for better performance
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + d]); // Use fmaxf for better performance
        }
        __syncthreads();
    }

    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr + 0] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
    __syncthreads();
}