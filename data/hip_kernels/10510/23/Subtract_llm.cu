#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Calculate x and y using blockDim instead of hardcoding 16
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;

    // Check bounds within valid range
    if (x < width && y < height)
    {
        // Perform subtraction only if within bounds
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // Remove unnecessary __syncthreads as no shared memory is used
}