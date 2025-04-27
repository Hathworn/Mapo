#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate 2D index using block and thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate 1D index efficiently
    int p = y * width + x;

    // Perform operation only if indices are within bounds
    if (x < width && y < height)
    {
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
}