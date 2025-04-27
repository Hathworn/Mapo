#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * blockDim.x + tx;
    const int y = blockIdx.y * 16;  // Optimized block size for stride access.
    int p = y * pitch + x;
    float val = FLT_MAX;  // Initialize to handle edge cases.
    
    // Load data into shared memory and handle out of bounds in unified manner.
    if (x < width) {
        val = d_Data[p];
    }
    minvals[tx] = val;
    maxvals[tx] = val;

    // Loop unrolled to reduce loop overhead.
    #pragma unroll
    for (int ty = 1; ty < 16; ty++) {
        p += pitch;
        if (x < width) {
            val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val;
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    }
    __syncthreads();

    // Reduction to find minimum and maximum using binary reduction.
    for (int d = blockDim.x >> 1; d > 0; d >>= 1) {
        if (tx < d) {
            if (minvals[tx + d] < minvals[tx]) minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx]) maxvals[tx] = maxvals[tx + d];
        }
        __syncthreads();
    }

    // Store result back to global memory.
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}