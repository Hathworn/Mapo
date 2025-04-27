#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Use blockDim to calculate global x and y coordinates
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x; // Simplify index calculation
    if (x < width && y < height)
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    // Remove unnecessary __syncthreads() as there are no shared memory operations
}