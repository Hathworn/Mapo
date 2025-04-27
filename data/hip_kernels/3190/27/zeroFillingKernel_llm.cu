#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zeroFillingKernel(float* idata, int row, int length, int height)
{
    // Calculate the unique thread index within the grid
    int tidx = blockIdx.x * blockDim.x + threadIdx.x;
    int tidy = blockIdx.y * blockDim.y + threadIdx.y; // Added threadIdx.y for 2D

    // Check if the thread is within bounds
    if(tidx < length && tidy < height)
    {
        // Index calculation performed once to minimize arithmetic operations
        int index1 = tidx + (row + tidy) * length;
        int index2 = tidx + (row - tidy) * length;

        // Set data to zero using precomputed indices
        idata[index1] = 0;
        if (tidy != 0) idata[index2] = 0; // Conditional to prevent redundant write
    }
}