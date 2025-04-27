#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height)
{
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    const int b = blockDim.x;
    int p = y * pitch + x;
    
    // Initialize shared memory with boundary check
    float val = (x < width) ? d_Data[p] : d_Data[p - x];
    minvals[tx] = val;
    maxvals[tx] = val;

    // Loop unrolling for processing 16 consecutive rows
    for (int ty = 1; ty < 16; ty++) {
        p += pitch;
        if (tx < width && p < width * height) {
            float val = d_Data[p];
            // Min/max reduction
            if (val < minvals[tx])
                minvals[tx] = val;
            if (val > maxvals[tx])
                maxvals[tx] = val;
        }
    }
    __syncthreads();

    // Parallel reduction with loop unrolling
    for (int d = b / 2; d > 0; d >>= 1) {
        if (tx < d) {
            // Avoid unnecessary checks
            if (minvals[tx + d] < minvals[tx])
                minvals[tx] = minvals[tx + d];
            if (maxvals[tx + d] > maxvals[tx])
                maxvals[tx] = maxvals[tx + d];
        }
        __syncthreads();
    }
    
    // Store final results for each block
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0];
        d_MinMax[ptr + 1] = maxvals[0];
    }
    __syncthreads();
}