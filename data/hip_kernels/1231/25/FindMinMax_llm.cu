#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;  // Simplified index calculation
    const int y = blockIdx.y * 16;
    int p = y * width + x;
    
    // Initialize shared arrays to the first value or a valid value from data
    float val = (x < width) ? d_Data[p] : d_Data[p - x];
    minvals[tx] = val;
    maxvals[tx] = val;

    // Loop to compute min/max values for each thread
    for (int ty = 1; ty < 16; ty++) {
        p += width;
        if (tx < width) {
            val = d_Data[p];
            minvals[tx] = min(minvals[tx], val);  // Use min() for clarity
            maxvals[tx] = max(maxvals[tx], val);  // Use max() for clarity
        }
    }
    __syncthreads();

    // Reduce operation to find block-level min and max
    for (int d = 1; d < blockDim.x; d <<= 1) {
        int mask = 2 * d - 1;  // Computation for striding
        if ((tx & mask) == 0 && (tx + d) < blockDim.x) {
            minvals[tx] = min(minvals[tx], minvals[tx + d]);
            maxvals[tx] = max(maxvals[tx], maxvals[tx + d]);
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}