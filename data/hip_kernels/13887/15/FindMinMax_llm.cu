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

    // Load data into shared memory, handle out-of-bounds case
    float val = (x < width) ? d_Data[p] : 0.0f; // Initialize as 0 for consistency
    minvals[tx] = val; 
    maxvals[tx] = val;

    // Loop unrolling for faster convergence, reduce condition checks
    for (int ty = 1; ty < 16; ty += 2) {
        p += pitch;
        if (tx < width) {
            val = d_Data[p];
            minvals[tx] = min(minvals[tx], val);
            maxvals[tx] = max(maxvals[tx], val);

            // Unrolled second iteration
            if (ty + 1 < 16) {
                p += pitch;
                val = d_Data[p];
                minvals[tx] = min(minvals[tx], val);
                maxvals[tx] = max(maxvals[tx], val);
            }
        }
    }
    __syncthreads();

    // Use efficient reduction within block
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (tx < offset) {
            minvals[tx] = min(minvals[tx], minvals[tx + offset]);
            maxvals[tx] = max(maxvals[tx], maxvals[tx + offset]);
        }
        __syncthreads();
    }

    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr + 0] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}