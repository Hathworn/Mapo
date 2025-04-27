#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    const int tx = threadIdx.x;
    const int x = blockIdx.x * blockDim.x + tx; // Use blockDim.x
    const int y = blockIdx.y * blockDim.y; // Consistent usage of blockDim.y
    int p = y * pitch + x;

    // Use early return to reduce indentation
    if (x >= width) {
        return;
    }

    float val = d_Data[p];
    minvals[tx] = val;
    maxvals[tx] = val;
    
    for (int ty = 1; ty < blockDim.y; ty++) { // Use blockDim.y
        p += pitch;
        if (x < width) { // Maintain bounds check
            val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val; // Unroll conditions
            if (val > maxvals[tx]) maxvals[tx] = val;
        }
    }
    __syncthreads();

    // Optimize reduction loop with iteration limiting
    for (int d = b / 2; d > 0; d >>= 1) { // Use bitwise shift for division
        if (tx < d) {
            float temp_min = minvals[tx + d]; // Use temporary variables
            float temp_max = maxvals[tx + d];
            if (temp_min < minvals[tx]) minvals[tx] = temp_min;
            if (temp_max > maxvals[tx]) maxvals[tx] = temp_max;
        }
        __syncthreads();
    }

    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr + 0] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
}