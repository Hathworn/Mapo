#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    int p = y * width + x;

    // Initializing shared memory
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {  // Handle out-of-bound access
        float val = d_Data[p - x];
        minvals[tx] = val;
        maxvals[tx] = val;
    }

    // Loop over rows to find local min/max
    for (int ty = 1; ty < 16; ty++) {
        p += width;
        if (x < width) {
            float val = d_Data[p];
            minvals[tx] = min(minvals[tx], val);
            maxvals[tx] = max(maxvals[tx], val);
        }
    }
    __syncthreads();

    // Reduction to find block min/max using binary reduction
    for (int d = 1; d < blockDim.x; d *= 2) {
        if (tx % (2 * d) == 0) {
            minvals[tx] = min(minvals[tx], minvals[tx + d]);
            maxvals[tx] = max(maxvals[tx], maxvals[tx + d]);
        }
        __syncthreads();
    }

    // Write block min/max to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr + 0] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}