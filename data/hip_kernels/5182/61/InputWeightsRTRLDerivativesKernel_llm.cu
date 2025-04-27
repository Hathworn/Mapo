#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InputWeightsRTRLDerivativesKernel(float *input, float *hiddenActivationDerivatives, float *recurrentWeights, float *inputWeightRTRLDerivatives, float *previousInputWeightRTRLDerivatives)
{
    // Optimize calculation of global unique thread index
    int partialId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    if (partialId < D_HIDDEN_UNITS * D_HIDDEN_UNITS * D_INPUT_UNITS)
    {
        // Precompute indices derived from partialId
        int unitId = partialId / (D_HIDDEN_UNITS * D_INPUT_UNITS);
        int weightId = partialId % (D_HIDDEN_UNITS * D_INPUT_UNITS);
        int to = weightId / D_INPUT_UNITS;
        int from = weightId % D_INPUT_UNITS;

        // Use register to store the sum
        float sum = 0;

        // Use constant stride access pattern for memory coalescing
        for (int i = 0; i < D_HIDDEN_UNITS; i++)
        {
            sum += recurrentWeights[unitId * D_HIDDEN_UNITS + i] * previousInputWeightRTRLDerivatives[i * (D_HIDDEN_UNITS * D_INPUT_UNITS) + weightId];
        }

        // Directly compute final result
        inputWeightRTRLDerivatives[partialId] = hiddenActivationDerivatives[unitId] * ((unitId == to ? input[from] : 0) + sum);
    }
}