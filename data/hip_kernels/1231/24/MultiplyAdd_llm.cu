#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate the global index using blockDim and blockIdx directly
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Compute the linear index for the memory operation
    int p = y * width + x;
    
    // Check for boundary conditions
    if (x < width && y < height)
    {
        // Perform computation using constant memory and store the result
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
}