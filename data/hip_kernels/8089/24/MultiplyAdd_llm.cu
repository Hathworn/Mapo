#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Optimized calculation of x coordinate
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Optimized calculation of y coordinate
    int p = y * width + x; // Optimized calculation of linear index
    if (x < width && y < height) // Check if within bounds
    {
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0]; // Perform multiply-add operation
    }
    __syncthreads(); // Synchronize threads within the block
}