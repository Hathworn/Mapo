#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Calculate thread's unique index using 2D grid and block dimensions
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Compute 1D array index
    int p = y * width + x;
    
    // Perform subtraction if within bounds
    if (x < width && y < height)
        d_Result[p] = d_Data1[p] - d_Data2[p];
}