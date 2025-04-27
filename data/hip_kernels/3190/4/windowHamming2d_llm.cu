#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void windowHamming2d(float* idata, int length, int height)
{
    int tidx = threadIdx.x + blockIdx.x * blockDim.x;
    int tidy = threadIdx.y + blockIdx.y * blockDim.y;
    
    if (tidx < length && tidy < height)
    {
        // Precalculate values to avoid redundant calculations
        float tidy_term = 0.54 - 0.46 * cosf(2 * tidy * PI_F / (height - 1));
        float tidx_term = 0.54 - 0.46 * cosf(2 * tidx * PI_F / (length - 1));
        
        // Store the computed result in the idata array 
        idata[tidy * length + tidx] = tidy_term * tidx_term;
    }
}