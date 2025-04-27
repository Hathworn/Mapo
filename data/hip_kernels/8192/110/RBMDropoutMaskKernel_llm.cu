#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RBMDropoutMaskKernel(float *maskPtr, float dropout, int thisLayerSize)
{
    int index = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Flattened linear index calculation

    if (index < thisLayerSize)
    {
        maskPtr[index] = dropout < maskPtr[index]; // Apply dropout mask
    }
}