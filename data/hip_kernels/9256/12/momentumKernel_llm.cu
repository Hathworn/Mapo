#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void momentumKernel(int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float learningRate, float momentum, float* history) {

    int updateIndex = blockIdx.x;
    int parameterIndex = parameterIndices[updateIndex];
    int count = counts[updateIndex];

    if (parameterIndex != -1 && count > 0) {
        float scalingFactor = 1.0f / count;

        int startEntryIndex = (blockIdx.y * blockDim.x + threadIdx.x) * numberIterations;

        int firstParameterEntryIndex = parameterIndex * dimension;
        int startParameterEntryIndex = firstParameterEntryIndex + startEntryIndex;
        int startGradientEntryIndex = updateIndex * dimension + startEntryIndex;

        int exclusiveEndParameterEntryIndex = min(startParameterEntryIndex + numberIterations, firstParameterEntryIndex + dimension);

        // Use stride to handle parameter and gradient updates for multiple steps in one iteration 
        for (int i = startEntryIndex; i < exclusiveEndParameterEntryIndex; i += numberIterations) {
            float derivative = gradient[startGradientEntryIndex + i - startEntryIndex]; // Offset index calculation
            float scaledDerivative = scalingFactor * derivative;

            float update = momentum * history[startParameterEntryIndex + i - startEntryIndex] - learningRate * scaledDerivative;

            history[startParameterEntryIndex + i - startEntryIndex] = update;
            parameters[startParameterEntryIndex + i - startEntryIndex] += update;
        }
    }
}