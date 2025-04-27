#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Use blockDim for thread indexing
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    const int p = y * width + x;

    // Check if within bounds
    if (x < width && y < height)
    {
        // Perform subtraction
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}