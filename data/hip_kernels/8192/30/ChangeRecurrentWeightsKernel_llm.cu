#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ChangeRecurrentWeightsKernel(float *recurrentWeights, float *recurrentWeightDeltas, float *outputWeights, float *outputDeltas, float *recurrentWeightRTRLDerivatives, float trainingRate, float momentum)
{
    int weightId = blockDim.x * blockIdx.y * gridDim.x // Calculate global thread ID
                  + blockDim.x * blockIdx.x
                  + threadIdx.x;

    if (weightId < D_HIDDEN_UNITS * D_HIDDEN_UNITS)
    {
        float gradient = 0;
        // Unroll loop to enhance performance
        for (int i = 0; i < D_OUTPUT_UNITS; i++)
        {
            float sum = 0;
            for (int j = 0; j < D_HIDDEN_UNITS; j += 4) // Loop unrolling by a factor of 4
            {
                sum += outputWeights[i * D_HIDDEN_UNITS + j] * recurrentWeightRTRLDerivatives[j * D_HIDDEN_UNITS * D_HIDDEN_UNITS + weightId];
                if (j + 1 < D_HIDDEN_UNITS)
                    sum += outputWeights[i * D_HIDDEN_UNITS + j + 1] * recurrentWeightRTRLDerivatives[(j + 1) * D_HIDDEN_UNITS * D_HIDDEN_UNITS + weightId];
                if (j + 2 < D_HIDDEN_UNITS)
                    sum += outputWeights[i * D_HIDDEN_UNITS + j + 2] * recurrentWeightRTRLDerivatives[(j + 2) * D_HIDDEN_UNITS * D_HIDDEN_UNITS + weightId];
                if (j + 3 < D_HIDDEN_UNITS)
                    sum += outputWeights[i * D_HIDDEN_UNITS + j + 3] * recurrentWeightRTRLDerivatives[(j + 3) * D_HIDDEN_UNITS * D_HIDDEN_UNITS + weightId];
            }

            gradient += outputDeltas[i] * sum;
        }

        float weightDelta = trainingRate * gradient + momentum * recurrentWeightDeltas[weightId];
        recurrentWeightDeltas[weightId] = weightDelta;
        recurrentWeights[weightId] += weightDelta;
    }
}