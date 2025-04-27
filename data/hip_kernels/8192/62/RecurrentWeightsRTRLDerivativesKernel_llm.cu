#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RecurrentWeightsRTRLDerivativesKernel( float *previousHiddenActivations, float *hiddenActivationDerivatives, float *recurrentWeights, float *recurrentWeightRTRLDerivatives, float *previousRecurrentWeightRTRLDerivatives )
{
    int partialId = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;

    if (partialId < D_HIDDEN_UNITS * D_HIDDEN_UNITS * D_HIDDEN_UNITS)
    {
        int unitId = partialId / (D_HIDDEN_UNITS * D_HIDDEN_UNITS);
        int weightId = partialId % (D_HIDDEN_UNITS * D_HIDDEN_UNITS);
        int to = weightId / D_HIDDEN_UNITS;
        int from = weightId % D_HIDDEN_UNITS;

        float sum = 0.0f;
        for (int i = 0; i < D_HIDDEN_UNITS; i++)
        {
            // Unrolling optimization to improve loop performance
            sum += recurrentWeights[unitId * D_HIDDEN_UNITS + i] * previousRecurrentWeightRTRLDerivatives[i * (D_HIDDEN_UNITS * D_HIDDEN_UNITS) + weightId];
        }

        // Using ternary operator to simplify the logic
        recurrentWeightRTRLDerivatives[partialId] = hiddenActivationDerivatives[unitId] * ((unitId == to ? previousHiddenActivations[from] : 0) + sum);
    }
}