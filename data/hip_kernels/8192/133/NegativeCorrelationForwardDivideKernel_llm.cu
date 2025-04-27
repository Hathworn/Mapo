#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NegativeCorrelationForwardDivideKernel(float* outputPtr, int thisLayerSize, int inputModelCount)
{
    // Calculate global thread index
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (j < thisLayerSize)
    {
        // Divide the output by inputModelCount for the corresponding element
        outputPtr[j] /= static_cast<float>(inputModelCount);
    }
}