#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ChangeRecurrentWeightsKernel(float *recurrentWeights, float *recurrentWeightDeltas, float *outputWeights, float *outputDeltas, float *recurrentWeightRTRLDerivatives, float trainingRate, float momentum)
{
    int weightId = blockDim.x * blockIdx.y * gridDim.x // Calculate global weight index
                   + blockDim.x * blockIdx.x
                   + threadIdx.x;

    if (weightId < D_HIDDEN_UNITS * D_HIDDEN_UNITS)
    {
        float gradient = 0;

        // Optimize loop by computing address outside the loop
        int baseHiddenUnits = D_HIDDEN_UNITS * weightId;

        for (int i = 0; i < D_OUTPUT_UNITS; i++)
        {
            float sum = 0;

            // Optimize addressing by using a pointer to recurrentWeightRTRLDerivatives
            float *derivativePtr = recurrentWeightRTRLDerivatives + baseHiddenUnits;

            // Unroll loop to reduce iteration overhead
            for (int j = 0; j < D_HIDDEN_UNITS; j += 2)
            {
                sum += outputWeights[i * D_HIDDEN_UNITS + j] * derivativePtr[j];
                if (j + 1 < D_HIDDEN_UNITS)
                    sum += outputWeights[i * D_HIDDEN_UNITS + j + 1] * derivativePtr[j + 1];
            }

            gradient += outputDeltas[i] * sum;
        }

        float weightDelta = trainingRate * gradient + momentum * recurrentWeightDeltas[weightId];
        recurrentWeightDeltas[weightId] = weightDelta;
        recurrentWeights[weightId] += weightDelta;
    }
}