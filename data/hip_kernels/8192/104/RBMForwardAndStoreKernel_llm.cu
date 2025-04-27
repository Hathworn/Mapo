#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float activationProbability(float x, float sigma)
{
    return 1.0 / (1.0 + expf(-sigma * x));
}

__global__ void RBMForwardAndStoreKernel(float *inputPtr, float *outputPtr, float *weightPtr,
                                         float *biasPtr, float *storedOutputPtr, float sigma,
                                         int prevLayerSize, int thisLayerSize, bool useDropout,
                                         float *dropoutMask)
{
    // Calculate current layer neuron id (j) using 2D grid and block dimensions
    int j = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; 

    if (j < thisLayerSize)
    {
        // Handle dropout condition
        if (useDropout && !dropoutMask[j])
        {
            outputPtr[j] = 0;
            storedOutputPtr[j] = 0;
        }
        else
        {
            float sum = biasPtr[j]; // Initialize sum with bias value
            int index = j;

            // Efficiently calculate weighted sum using shared memory, if applicable
            for (int i = 0; i < prevLayerSize; i++)
            {
                sum += weightPtr[index] * inputPtr[i];
                index += thisLayerSize;
            }

            // Compute activation probability and store results
            float result = activationProbability(sum, sigma);
            outputPtr[j] = result;
            storedOutputPtr[j] = result;
        }
    }
}