#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify indexing
    const int y = blockIdx.y * blockDim.y + threadIdx.y;  // Simplify indexing
    int p = y * width + x;  // Calculate linear index

    if (x < width && y < height) {
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
}