#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation for x
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Simplified calculation for y
    int p = y * width + x; // Simplified index calculation
    if (x < width && y < height) // Check boundary conditions
    {
        d_Result[p] = d_Data1[p] - d_Data2[p]; // Perform subtraction
    }
    // __syncthreads() removed as it is unnecessary here
}