#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x*128 + tx;
    const int y = blockIdx.y*16;
    int p = y*pitch + x;

    // Load initial values into shared memory
    if (x < width) {
        float val = d_Data[p];
        minvals[tx] = val;
        maxvals[tx] = val;
    } else {
        minvals[tx] = FLT_MAX; // Ensure no influence from invalid index
        maxvals[tx] = -FLT_MAX;
    }
    
    // Reduce within the block to find local min and max
    int stride = pitch;
    for (int ty = 1; ty < 16; ty++, p += stride) {
        if (x < width) {
            float val = d_Data[p];
            minvals[tx] = fminf(minvals[tx], val);
            maxvals[tx] = fmaxf(maxvals[tx], val);
        }
    }
    __syncthreads();

    // Parallel reduction to find global block min and max
    for (int offset = blockDim.x/2; offset > 0; offset >>= 1) {
        if (tx < offset) {
            minvals[tx] = fminf(minvals[tx], minvals[tx + offset]);
            maxvals[tx] = fmaxf(maxvals[tx], maxvals[tx + offset]);
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