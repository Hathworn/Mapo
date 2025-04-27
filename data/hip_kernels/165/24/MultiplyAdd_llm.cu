#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate unique thread index for 2D blocks
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;

    // Check bounds condition
    if (x < width && y < height)
    {
        // Perform multiply-add operation
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
}