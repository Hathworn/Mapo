#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];

    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;

    if (x < width) {
        float val = d_Data[y * width + x];
        minvals[tx] = val;
        maxvals[tx] = val;

        // Loop unrolling to reduce branch instructions
        #pragma unroll
        for (int ty = 1; ty < 16; ty++) {
            val = d_Data[(y + ty) * width + x];
            if (val < minvals[tx]) minvals[tx] = val;
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    } else {
        // Handle x out of bounds with minimal impact
        minvals[tx] = FLT_MAX;
        maxvals[tx] = -FLT_MAX;
    }

    __syncthreads();

    // Parallel reduction for min and max
    for (int d = 64; d > 0; d >>= 1) {
        if (tx < d) {
            if (minvals[tx + d] < minvals[tx]) minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx]) maxvals[tx] = maxvals[tx + d];
        }
        __syncthreads();
    }

    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}