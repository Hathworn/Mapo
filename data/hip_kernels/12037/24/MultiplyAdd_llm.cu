#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate the global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;

    // Check boundaries and perform computation
    if (x < width && y < height)
    {
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
}