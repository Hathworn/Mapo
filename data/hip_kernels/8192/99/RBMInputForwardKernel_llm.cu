#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RBMInputForwardKernel(float *inputPtr, float *outputPtr, float *biasPtr, bool applyBias, int thisLayerSize)
{
    // Use linear thread ID calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < thisLayerSize)
    {
        // Directly store the computed result to output
        float result = inputPtr[i];
        if (applyBias)
            result += biasPtr[i];
        outputPtr[i] = result; // Correct storing of the result
    }
}