#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using 2D grid and block dimensions
__global__ void ResetLayerKernel(float *layer, float value, int count) 
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x 
                 + (blockIdx.y * gridDim.x * blockDim.x); // Simplified thread index calculation

    if (threadId < count) 
    {
        layer[threadId] = value; // Set the layer value
    }
}