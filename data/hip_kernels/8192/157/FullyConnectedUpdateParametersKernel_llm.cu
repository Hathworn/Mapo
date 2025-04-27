#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FullyConnectedUpdateParametersKernel( float *weightPtr, float *biasPtr, float *weightLearningRatePtr, float *biasLearningRatePtr, float *weightGradientPtr, float *biasGradientPtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize )
{
    // Calculate neuron id (j) in this layer
    int j = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure the current thread is within the bounds
    if (j < thisLayerSize)
    {
        if (!dropoutMaskPtr[j])
        {
            // Prefetch common offset calculations
            float *wPtr = weightPtr + j;
            float *wLrPtr = weightLearningRatePtr + j;
            float *wGPtr = weightGradientPtr + j;

            // Update weights using stride pointer arithmetic
            for (int i = 0; i < prevLayerSize; i++, wPtr += thisLayerSize, wLrPtr += thisLayerSize, wGPtr += thisLayerSize) 
            {
                *wPtr -= *wLrPtr * *wGPtr;
            }

            // Update bias
            biasPtr[j] -= biasLearningRatePtr[j] * biasGradientPtr[j];
        }
    }
}