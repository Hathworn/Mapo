#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Calculate global thread coordinates without deprecated __mul24.
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate index and ensure thread is within bounds.
    int p = y * width + x;
    if (x < width && y < height)
    {
        // Perform subtraction only if within bounds.
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // Remove __syncthreads() as it's unnecessary here.
}