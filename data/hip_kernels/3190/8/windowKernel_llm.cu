#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void windowKernel(float* idata, float* window, int width, int height)
{
    int tidx = threadIdx.x + blockIdx.x * blockDim.x;
    int tidy = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Use a single index to reduce arithmetic operations
    int index = tidy * width + tidx;

    // Check once and reduce operations, using if statement only for valid indices
    if (tidx < width && tidy < height)
    {
        idata[index] *= window[tidx];
    }
}