#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ChangeOutputWeightsKernel( float *outputWeights, float *outputWeightDeltas, float *outputDeltas, float *hiddenActivations,  float trainingRate, float momentum )
{
// Using cooperative indexing for grid and block calculations
int weightId = blockIdx.x * blockDim.x + threadIdx.x;

if (weightId < D_OUTPUT_UNITS * D_HIDDEN_UNITS)
{
    // Reduce redundant calculations by storing in register variables
    int to = weightId / D_HIDDEN_UNITS;
    int from = weightId % D_HIDDEN_UNITS;
    float gradient = outputDeltas[to] * hiddenActivations[from];
    float weightDelta = trainingRate * gradient + momentum * outputWeightDeltas[weightId];
    
    // Update global memory efficiently
    outputWeightDeltas[weightId] = weightDelta;
    outputWeights[weightId] += weightDelta;
}
}