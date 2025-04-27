#include "hip/hip_runtime.h"
#include "includes.h"

// Removed unnecessary __syncthreads() for better performance
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for dynamic block size
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Use blockDim.y for dynamic block size
    int p = y * pitch + x;
    if (x < width && y < height)
        d_Result[p] = d_Data1[p] - d_Data2[p];
}