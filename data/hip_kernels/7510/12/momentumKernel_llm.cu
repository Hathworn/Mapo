#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void momentumKernel (int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float learningRate, float momentum, float* history) {
    int updateIndex = blockIdx.x;
    int parameterIndex = parameterIndices[updateIndex];
    int count = counts[updateIndex];

    if (parameterIndex != -1 && count > 0) {
        float scalingFactor = 1.0f / (float)count;

        int startEntryIndex = (blockIdx.y * blockDim.x + threadIdx.x) * numberIterations;
        int firstParameterEntryIndex = parameterIndex * dimension;
        
        int startParameterEntryIndex = firstParameterEntryIndex + startEntryIndex;
        int startGradientEntryIndex = updateIndex * dimension + startEntryIndex;

        int exclusiveEndParameterEntryIndex = min(startParameterEntryIndex + numberIterations, firstParameterEntryIndex + dimension);

        // Loop unrolling and using threadIdx for step increment to improve performance
        for (int i = startParameterEntryIndex, j = startGradientEntryIndex; i < exclusiveEndParameterEntryIndex; i++, j++) {
            float derivative = gradient[j];
            float scaledDerivative = scalingFactor * derivative;

            float update = momentum * history[i] - learningRate * scaledDerivative;

            history[i] = update;
            parameters[i] += update;
        }
    }
}