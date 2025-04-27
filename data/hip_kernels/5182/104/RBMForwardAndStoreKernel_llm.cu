#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float activationProbability(float x, float sigma)
{
    return 1.0 / (1.0 + expf(-sigma * x));
}

__global__ void RBMForwardAndStoreKernel(float *inputPtr, float *outputPtr, float *weightPtr, float *biasPtr, 
                                         float *storedOutputPtr, float sigma, int prevLayerSize, int thisLayerSize, 
                                         bool useDropout, float *dropoutMask)
{
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index

    if (j < thisLayerSize)
    {
        if (useDropout && !dropoutMask[j]) // Check dropout condition
        {
            outputPtr[j] = 0;
            storedOutputPtr[j] = 0;
        }
        else
        {
            float sum = 0.0f;
            for (int i = 0, index = j; i < prevLayerSize; i++, index += thisLayerSize) // Optimize loop with index increment
            {
                sum += weightPtr[index] * inputPtr[i]; // Accumulate weighted input
            }
            sum += biasPtr[j]; // Add bias
            float result = activationProbability(sum, sigma); // Apply activation function
            outputPtr[j] = result; // Set output value
            storedOutputPtr[j] = result; // Store output value
        }
    }
}