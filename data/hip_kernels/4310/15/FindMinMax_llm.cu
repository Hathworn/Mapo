#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMinMax(float *d_MinMax, float *d_Data, int width, int pitch, int height) {
    __shared__ float minvals[128];
    __shared__ float maxvals[128];
    
    const int tx = threadIdx.x;
    const int x = blockIdx.x * 128 + tx;
    const int y = blockIdx.y * 16;
    const int p_offset = y * pitch + x;
    int p = p_offset;
    
    float val = (x < width) ? d_Data[p] : d_Data[p - x];
    minvals[tx] = val;
    maxvals[tx] = val;
    
    for (int ty = 1; ty < 16; ty++, p += pitch) {
        if (x < width) {
            val = d_Data[p];
            if (val < minvals[tx]) minvals[tx] = val; // Update minimum
            if (val > maxvals[tx]) maxvals[tx] = val; // Update maximum
        }
    }
    
    __syncthreads();
    
    // Reduction to find min and max
    for (int d = 1; d < blockDim.x; d <<= 1) {
        int mask = 2 * d - 1;
        if ((tx & mask) == 0) {
            float min_pair = minvals[tx + d];
            if (min_pair < minvals[tx]) minvals[tx] = min_pair;
            
            float max_pair = maxvals[tx + d];
            if (max_pair > maxvals[tx]) maxvals[tx] = max_pair;
        }
        __syncthreads();
    }
    
    if (tx == 0) {
        int ptr = 2 * (gridDim.x * blockIdx.y + blockIdx.x);
        d_MinMax[ptr] = minvals[0]; // Write min result
        d_MinMax[ptr + 1] = maxvals[0]; // Write max result
    }
}