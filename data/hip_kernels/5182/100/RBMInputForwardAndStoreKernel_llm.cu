#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RBMInputForwardAndStoreKernel(float *inputPtr, float *outputPtr, float *biasPtr, float *storePtr, bool applyBias, int thisLayerSize)
{
    // Calculate unique global thread index
    int i = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Ensure within bounds
    if (i < thisLayerSize)
    {
        float result = inputPtr[i];
        // Add bias if applicable
        if (applyBias)
            result += biasPtr[i];
        // Store result in output and store arrays
        outputPtr[i] = result;
        storePtr[i] = result;
    }
}