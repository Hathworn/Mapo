#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ChangeInputWeightsKernel(float *inputWeights, float *inputWeightDeltas, float *outputWeights, float *outputDeltas, float *inputWeightRTRLDerivatives, float trainingRate, float momentum)
{
    int weightId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    
    if (weightId < D_HIDDEN_UNITS * D_INPUT_UNITS)
    {
        float gradient = 0.0f;

        // Using shared memory for outputWeights part of calculation to reduce global memory access
        __shared__ float sharedOutputWeights[D_HIDDEN_UNITS];
        
        for (int i = 0; i < D_OUTPUT_UNITS; i++)
        {
            float sum = 0.0f;
            
            for (int j = 0; j < D_HIDDEN_UNITS; j++)
            {
                if (threadIdx.x < D_HIDDEN_UNITS)
                {
                    sharedOutputWeights[threadIdx.x] = outputWeights[i * D_HIDDEN_UNITS + j];
                }
                __syncthreads(); // Synchronize threads within block

                sum += sharedOutputWeights[j] * inputWeightRTRLDerivatives[j * D_HIDDEN_UNITS * D_INPUT_UNITS + weightId];
            }
            gradient += outputDeltas[i] * sum;
        }

        float weightDelta = trainingRate * gradient + momentum * inputWeightDeltas[weightId];
        inputWeightDeltas[weightId] = weightDelta;
        inputWeights[weightId] += weightDelta;
    }
}