#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RBMInputForwardAndStoreKernel(float *inputPtr, float *outputPtr, float *biasPtr, float *storePtr, bool applyBias, int thisLayerSize)
{
    // Calculate global index directly
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (i < thisLayerSize)
    {
        float result = inputPtr[i];
        if (applyBias)
            result += biasPtr[i];

        // Simultaneous writing to output and store
        outputPtr[i] = result;
        storePtr[i] = result;
    }
}