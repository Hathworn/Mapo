#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NegativeCorrelationForwardDivideKernel(float* outputPtr, int thisLayerSize, int inputModelCount)
{
    // Calculate global thread ID with optimized grid-stride loop
    int j = blockIdx.x * blockDim.x + threadIdx.x; 
    int stride = blockDim.x * gridDim.x; // Total number of threads

    for (; j < thisLayerSize; j += stride)
    {
        outputPtr[j] /= (float)inputModelCount; // Perform division for each element
    }
}