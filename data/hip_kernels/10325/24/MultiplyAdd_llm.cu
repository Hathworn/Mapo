#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for better readability
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Use blockDim.y for better readability
    int p = y * width + x; // Simplify index calculation

    if (x < width && y < height) // Conditionally execute only if within bounds
    {
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
    // Remove unnecessary __syncthreads() as it is not required here
}