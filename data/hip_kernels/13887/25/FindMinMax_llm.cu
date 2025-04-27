#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];

    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx; // Simplified index calculation
    const int y = blockIdx.y * 16;
    const int b = blockDim.x;
    int p = y * width + x;

    // Initialize shared memory
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        float val = d_Data[p - x];
        minvals[tx] = val;
        maxvals[tx] = val;
    }

    // Unroll loop to improve performance
    #pragma unroll
    for (int ty = 1; ty < 16; ty++) {
        p += width;
        if (x < width) { // Fix index check to use x instead of tx
            float val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val;
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    }

    __syncthreads();

    // Parallel reduction to find min and max
    for (int d = b >> 1; d > 0; d >>= 1) {
        if (tx < d) {
            if (minvals[tx + d] < minvals[tx]) minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx]) maxvals[tx] = maxvals[tx + d];
        }
        __syncthreads();
    }

    // Output results
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr + 0] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}