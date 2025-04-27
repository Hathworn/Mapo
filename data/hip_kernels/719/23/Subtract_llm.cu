#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block and thread indexing
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < width && y < height) {
        int p = y * width + x;
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // Removed __syncthreads() as it's unnecessary in the current context
}