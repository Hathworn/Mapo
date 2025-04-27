```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RBMCopyFilterKernel(float *weightPtr, float *filterPtr, int weightCount, int i, int thisLayerSize)
{
    // Calculate the linear thread index in grid
    int weightIndex = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Ensure computation only within bounds
    if (weightIndex < weightCount)
    {
        filterPtr[weightIndex] = weightPtr[i + weightIndex * thisLayerSize];
    }
}