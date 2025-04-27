#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RecurrentWeightsRTRLDerivativesKernel( float *previousHiddenActivations, float *hiddenActivationDerivatives, float *recurrentWeights, float *recurrentWeightRTRLDerivatives, float *previousRecurrentWeightRTRLDerivatives )
{
    int partialId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Optimize loop calculations
    int totalHiddenUnitsSquared = D_HIDDEN_UNITS * D_HIDDEN_UNITS;
    if (partialId < totalHiddenUnitsSquared * D_HIDDEN_UNITS)
    {
        int unitId = partialId / totalHiddenUnitsSquared;
        int weightId = partialId % totalHiddenUnitsSquared;
        int to = weightId / D_HIDDEN_UNITS;
        int from = weightId % D_HIDDEN_UNITS;

        float sum = 0.0f;
        for (int i = 0; i < D_HIDDEN_UNITS; i++)
        {
            sum += recurrentWeights[unitId * D_HIDDEN_UNITS + i] * previousRecurrentWeightRTRLDerivatives[i * totalHiddenUnitsSquared + weightId];
        }

        // Optimize condition evaluation using ternary operation
        recurrentWeightRTRLDerivatives[partialId] = hiddenActivationDerivatives[unitId] * ((unitId == to ? previousHiddenActivations[from] : 0.0f) + sum);
    }
}