#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Calculate global thread index without using deprecated __mul24
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;

    // Ensure indexing is within array bounds
    if (x < width && y < height) {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }

    // Remove unnecessary __syncthreads() as it's not needed here
}