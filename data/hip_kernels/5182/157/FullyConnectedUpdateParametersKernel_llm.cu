```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FullyConnectedUpdateParametersKernel(
    float *weightPtr, float *biasPtr, 
    float *weightLearningRatePtr, float *biasLearningRatePtr, 
    float *weightGradientPtr, float *biasGradientPtr, 
    float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize)
{
    // Global thread index in the j-dimension
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread operates only within valid range
    if (j < thisLayerSize)
    {
        // Check dropout mask for the current neuron
        if (!dropoutMaskPtr[j])
        {
            // Use separate variable to reduce conditional complexity
            float *wPtr = weightPtr + j;
            float *wlrPtr = weightLearningRatePtr + j;
            float *wgPtr = weightGradientPtr + j;

            // Vectorialize the weight update loop
            for (int i = 0; i < prevLayerSize; ++i)
            {
                *wPtr -= *wlrPtr * *wgPtr;
                wPtr += thisLayerSize;
                wlrPtr += thisLayerSize;
                wgPtr += thisLayerSize;
            }

            // Update bias for the current neuron
            biasPtr[j] -= biasLearningRatePtr[j] * biasGradientPtr[j];
        }
    }
}