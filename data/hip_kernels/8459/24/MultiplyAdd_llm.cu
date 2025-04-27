#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified thread ID calculation
    const int y = blockIdx.y * blockDim.y + threadIdx.y;  // Simplified thread ID calculation
    if (x < width && y < height)
    {
        int p = y * width + x;  // Updated position calculation
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
}