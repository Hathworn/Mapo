#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ChangeRecurrentWeightsKernel( float *recurrentWeights, float *recurrentWeightDeltas, float *outputWeights, float *outputDeltas, float *recurrentWeightRTRLDerivatives,  float trainingRate, float momentum )
{
    int weightId = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;

    if (weightId < D_HIDDEN_UNITS * D_HIDDEN_UNITS)
    {
        float gradient = 0;

        // Unrolling the inner loop for better performance
        for (int i = 0; i < D_OUTPUT_UNITS; i++)
        {
            float sum = 0;
            int baseIdx = i * D_HIDDEN_UNITS;
            int rtrlOffset = weightId;

            for (int j = 0; j < D_HIDDEN_UNITS; j++)
            {
                sum += outputWeights[baseIdx + j] * recurrentWeightRTRLDerivatives[j * D_HIDDEN_UNITS * D_HIDDEN_UNITS + rtrlOffset];
            }

            gradient += outputDeltas[i] * sum;
        }

        // Combining operations to reduce memory access
        float weightDelta = trainingRate * gradient + momentum * recurrentWeightDeltas[weightId];
        recurrentWeights[weightId] += weightDelta;
        recurrentWeightDeltas[weightId] = weightDelta;
    }
}