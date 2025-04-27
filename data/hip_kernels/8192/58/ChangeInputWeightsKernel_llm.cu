#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ChangeInputWeightsKernel( float *inputWeights, float *inputWeightDeltas, float *outputWeights, float *outputDeltas, float *inputWeightRTRLDerivatives,  float trainingRate, float momentum )
{
    int weightId = blockDim.x * blockIdx.y * gridDim.x   // Calculate weightId considering preceding blocks and threads
                 + blockDim.x * blockIdx.x
                 + threadIdx.x;

    if (weightId < D_HIDDEN_UNITS * D_INPUT_UNITS)
    {
        float gradient = 0;

        // Implement parallel reduction pattern
        for (int i = 0; i < D_OUTPUT_UNITS; i++)
        {
            float sum = 0;
            #pragma unroll
            for (int j = 0; j < D_HIDDEN_UNITS; j++)
            {
                sum += outputWeights[i * D_HIDDEN_UNITS + j] * inputWeightRTRLDerivatives[j * D_HIDDEN_UNITS * D_INPUT_UNITS + weightId];
            }

            gradient += outputDeltas[i] * sum;
        }

        // Optimize weight update calculation
        float weightDelta = trainingRate * gradient + momentum * inputWeightDeltas[weightId];
        inputWeightDeltas[weightId] = weightDelta;
        inputWeights[weightId] += weightDelta;
    }
}