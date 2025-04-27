#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized FindMinMax kernel
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    int p = y * width + x;
    
    float val = (x < width) ? d_Data[p] : d_Data[p - x];
    minvals[tx] = val;
    maxvals[tx] = val;

    // Loop unrolling for better performance
    #pragma unroll
    for (int ty = 1; ty < 16; ++ty) {
        p += width;
        if (x < width) {
            val = d_Data[p];
            minvals[tx] = fminf(minvals[tx], val); // Use intrinsic for min
            maxvals[tx] = fmaxf(maxvals[tx], val); // Use intrinsic for max
        }
    }
    __syncthreads();

    // Reduction with loop unrolling
    for (int offset = b >> 1; offset > 0; offset >>= 1) {
        if (tx < offset) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + offset]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + offset]);
        }
        __syncthreads();
    }
    
    // Write results
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr + 0] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}