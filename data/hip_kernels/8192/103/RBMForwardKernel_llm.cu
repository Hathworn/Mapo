#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float activationProbability(float x, float sigma)
{
    return 1.0 / (1.0 + expf(-sigma * x));
}

__global__ void RBMForwardKernel(float *inputPtr, float *outputPtr, float *weightPtr, float *biasPtr, float sigma, int prevLayerSize, int thisLayerSize, bool useDropoutMask, bool useDropout, float dropoutRate, float *dropoutMask)
{
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Improved index calculation

    if (j < thisLayerSize)
    {
        if (useDropout && useDropoutMask && !dropoutMask[j])
        {
            outputPtr[j] = 0;
        }
        else
        {
            float sum = biasPtr[j]; // Combine bias addition within loop
            for (int i = 0; i < prevLayerSize; i++)
            {
                sum += weightPtr[j + i * thisLayerSize] * inputPtr[i]; // Calculate weighted sum
            }

            float result = activationProbability(sum, sigma);

            if (useDropout && !useDropoutMask && dropoutRate < 1)
                result /= dropoutRate;

            outputPtr[j] = result;
        }
    }
}