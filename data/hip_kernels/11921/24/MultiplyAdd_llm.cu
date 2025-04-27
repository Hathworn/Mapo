#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Use blockDim.x and blockDim.y for more readability and flexibility
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate linear index
    int p = y * width + x;

    // Check if within bounds and compute
    if (x < width && y < height)
    {
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
    // Remove unnecessary __syncthreads() as there's no inter-thread dependency
}