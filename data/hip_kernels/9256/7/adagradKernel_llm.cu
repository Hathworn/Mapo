#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adagradKernel (int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float learningRate, float* history, float epsilon) {

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

        // Unroll loop for performance
        for (int i = startParameterEntryIndex, j = startGradientEntryIndex; i < exclusiveEndParameterEntryIndex; ++i, ++j) {
            float scaledDerivative = scalingFactor * gradient[j];
            float updatedHistory = history[i] + scaledDerivative * scaledDerivative;
            history[i] = updatedHistory;
            float adaptedLearningRate = learningRate / (sqrtf(updatedHistory) + epsilon);
            float update = adaptedLearningRate * scaledDerivative;
            parameters[i] -= update;
        }
    }
}