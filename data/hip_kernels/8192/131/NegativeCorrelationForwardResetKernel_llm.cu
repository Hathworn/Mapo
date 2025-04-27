#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NegativeCorrelationForwardResetKernel(float* outputPtr, int thisLayerSize)
{
    // Calculate the global thread index
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds and reset output
    if (j < thisLayerSize)
    {
        outputPtr[j] = 0;
    }
}