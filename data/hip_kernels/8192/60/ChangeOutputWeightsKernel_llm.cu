#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ChangeOutputWeightsKernel( float *outputWeights, float *outputWeightDeltas, float *outputDeltas, float *hiddenActivations,  float trainingRate, float momentum )
{
    // Compute a unique weightId using a 2D grid and 3D block
    int weightId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Using integer division and modulus to calculate indices to and from
    int to = weightId / D_HIDDEN_UNITS; 
    int from = weightId % D_HIDDEN_UNITS;

    // Check if within bounds
    if (weightId < D_OUTPUT_UNITS * D_HIDDEN_UNITS) 
    {
        // Compute the gradient and weight delta, then update deltas and weights
        float gradient = outputDeltas[to] * hiddenActivations[from];
        float weightDelta = trainingRate * gradient + momentum * outputWeightDeltas[weightId];
        outputWeightDeltas[weightId] = weightDelta;
        outputWeights[weightId] += weightDelta;
    }
}