#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ChangeInputWeightsKernel(float *inputWeights, float *inputWeightDeltas, float *outputWeights, float *outputDeltas, float *inputWeightRTRLDerivatives, float trainingRate, float momentum)
{
    // Calculate flat weightId directly
    int weightId = blockIdx.x * blockDim.x + threadIdx.x + gridDim.x * blockIdx.y * blockDim.x;

    if (weightId < D_HIDDEN_UNITS * D_INPUT_UNITS)
    {
        float gradient = 0.0f;

        // Combine loop iterations using a single kernel calculation for sum
        for (int i = 0; i < D_OUTPUT_UNITS; i++)
        {
            float sum = 0.0f;
            #pragma unroll  // Suggest unrolling for better performance
            for (int j = 0; j < D_HIDDEN_UNITS; j++)
            {
                sum += outputWeights[i * D_HIDDEN_UNITS + j] * inputWeightRTRLDerivatives[j * D_HIDDEN_UNITS * D_INPUT_UNITS + weightId];
            }

            gradient += outputDeltas[i] * sum;
        }

        // Use float operations consistently for delta and weight calculations
        float weightDelta = trainingRate * gradient + momentum * inputWeightDeltas[weightId];
        inputWeightDeltas[weightId] = weightDelta;
        inputWeights[weightId] += weightDelta;
    }
}