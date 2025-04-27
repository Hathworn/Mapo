#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeGlobalKernel(float* idata, float* odata, int width, int height)
{
    // Calculate the global row and column indexes for input and output matrices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within bounds before transposing elements
    if (x < width && y < height)
    {
        odata[x * height + y] = idata[y * width + x];
    }
}