#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ChangeOutputWeightsKernel( float *outputWeights, float *outputWeightDeltas, float *outputDeltas, float *hiddenActivations,  float trainingRate, float momentum )
{
    int weightId = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    if (weightId < D_OUTPUT_UNITS * D_HIDDEN_UNITS)
    {
        int to = weightId / D_HIDDEN_UNITS;
        int from = weightId % D_HIDDEN_UNITS;

        float gradient = outputDeltas[to] * hiddenActivations[from];
        float weightDelta = trainingRate * gradient + momentum * outputWeightDeltas[weightId];
        outputWeightDeltas[weightId] = weightDelta;
        outputWeights[weightId] += weightDelta;
    }
}