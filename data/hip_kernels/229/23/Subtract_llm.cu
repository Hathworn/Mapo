#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Replace deprecated __mul24
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Replace deprecated __mul24
    int p = y * width + x; // Simplify expression
    if (x < width && y < height) // Check boundary conditions
    {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // __syncthreads() is unnecessary here as each thread updates distinct memory
}