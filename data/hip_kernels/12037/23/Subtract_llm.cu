#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Use blockDim.x/y instead of hardcoded 16 for better flexibility
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < width && y < height) {
        int p = y * width + x; // Simplify to standard integer multiplication
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // Remove __syncthreads() as it is unnecessary in this context
}