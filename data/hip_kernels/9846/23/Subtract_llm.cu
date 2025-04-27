#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Calculate x and y using optimized formula 
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate linear index
    int p = y * width + x;

    // Check bounds and perform subtraction
    if (x < width && y < height)
        d_Result[p] = d_Data1[p] - d_Data2[p];
}