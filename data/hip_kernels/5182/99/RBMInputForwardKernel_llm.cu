#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RBMInputForwardKernel(float *inputPtr, float *outputPtr, float *biasPtr, bool applyBias, int thisLayerSize)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread is within bounds
    if (i < thisLayerSize)
    {
        float result = inputPtr[i];
        
        // Conditionally add the bias
        if (applyBias)
        {
            result += biasPtr[i];
        }
        
        // Store the result in output
        outputPtr[i] = result;  // Correct the output assignment
    }
}