#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InputWeightsRTRLDerivativesKernel(float *input, float *hiddenActivationDerivatives, float *recurrentWeights, float *inputWeightRTRLDerivatives, float *previousInputWeightRTRLDerivatives)
{
    int partialId = blockDim.x * blockIdx.y * gridDim.x  // Calculate unique thread ID
                  + blockDim.x * blockIdx.x
                  + threadIdx.x;

    if (partialId < D_HIDDEN_UNITS * D_HIDDEN_UNITS * D_INPUT_UNITS)
    {
        int unitId = partialId / (D_HIDDEN_UNITS * D_INPUT_UNITS);
        int weightId = partialId % (D_HIDDEN_UNITS * D_INPUT_UNITS);
        int to = weightId / D_INPUT_UNITS;
        int from = weightId % D_INPUT_UNITS;

        // Optimized memory access by avoiding bank conflicts and using local registers
        float sum = 0;
        for (int i = 0; i < D_HIDDEN_UNITS; i++)
        {
            // Load values into local registers
            float recWeight = recurrentWeights[unitId * D_HIDDEN_UNITS + i];
            float prevInputWeight = previousInputWeightRTRLDerivatives[i * (D_HIDDEN_UNITS * D_INPUT_UNITS) + weightId];
            sum += recWeight * prevInputWeight;
        }

        // Calculate the RTRL derivative
        inputWeightRTRLDerivatives[partialId] = hiddenActivationDerivatives[unitId] * ((unitId == to) * input[from] + sum);
    }
}