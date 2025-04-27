#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * blockDim.x + tx;
    const int y = blockIdx.y * blockDim.y;
    const int b = blockDim.x;
    int p = y * pitch + x;

    // Initialize shared memory with data values conditionally
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = INFINITY;  // Set to infinity for comparison
        maxvals[tx] = -INFINITY; // Set to negative infinity for comparison
    }

    // Loop unroll optimization
    #pragma unroll
    for (int ty = 1; ty < 16; ++ty) {
        p += pitch;
        if (x < width) {
            float val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val;
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    }
    __syncthreads();

    // Shared memory reduction with loop unrolling
    int mod = 1;
    for (int d = 1; d < b; d <<= 1) {
        if ((tx & mod) == 0) {
            if (minvals[tx + d] < minvals[tx])
                minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx])
                maxvals[tx] = maxvals[tx + d];
        }
        mod = mod * 2 + 1;
        __syncthreads();
    }

    // Output final min and max values
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}