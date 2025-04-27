```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RBMCopyFilterKernel(float *weightPtr, float *filterPtr, int weightCount, int i, int thisLayerSize)
{
    // Calculate weightIndex in a more efficient manner using linear indexing.
    int weightIndex = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x; 

    // Ensure we do not perform out of bounds memory operations.
    if (weightIndex < weightCount)
    {
        // Directly copy the transformed weight to the filter pointer.
        filterPtr[weightIndex] = weightPtr[i + weightIndex * thisLayerSize];
    }
}