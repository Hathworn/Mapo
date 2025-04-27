#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Simplified computation of x index
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Simplified computation of y index
    int p = y * width + x; // Simplified computation of p
    if (x < width && y < height)
    {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // No need for __syncthreads() as there's no inter-thread dependency within the block
}