#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Calculate coordinates using block and thread index
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;

    // Check if within bounds and perform subtraction
    if (x < width && y < height) {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}