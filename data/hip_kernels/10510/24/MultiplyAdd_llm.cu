#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate the global thread index
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;

    // Ensure valid index range
    if (x < width && y < height)
    {
        // Perform multiply-add operation
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
    // Remove __syncthreads() as it is unnecessary here
}