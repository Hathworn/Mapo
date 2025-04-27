#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adagradKernel (int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float learningRate, float* history, float epsilon) {

    // Precompute common values
    int updateIndex = blockIdx.x;
    int parameterIndex = parameterIndices[updateIndex];
    if (parameterIndex == -1) return;  // Optimize conditional check

    int count = counts[updateIndex];
    if (count <= 0) return;  // Optimize conditional check

    float scalingFactor = 1.0f / (float)count;
    int firstParameterEntryIndex = parameterIndex * dimension;
    int startEntryIndex = (blockIdx.y * blockDim.x + threadIdx.x) * numberIterations;

    int startParameterEntryIndex = firstParameterEntryIndex + startEntryIndex;
    int startGradientEntryIndex = updateIndex * dimension + startEntryIndex;
    int exclusiveEndParameterEntryIndex = min(startParameterEntryIndex + numberIterations, firstParameterEntryIndex + dimension);

    // Use local variables to avoid repeated memory accesses
    int parameterEntryIndex = startParameterEntryIndex;
    int gradientEntryIndex = startGradientEntryIndex;

    while (parameterEntryIndex < exclusiveEndParameterEntryIndex) {
        float scaledDerivative = scalingFactor * gradient[gradientEntryIndex];
        float updatedHistory = history[parameterEntryIndex] + scaledDerivative * scaledDerivative;
        history[parameterEntryIndex] = updatedHistory;

        float adaptedLearningRate = learningRate / (sqrtf(updatedHistory) + epsilon);
        float update = adaptedLearningRate * scaledDerivative;  // Avoid redundant scaling multiplication
        parameters[parameterEntryIndex] -= update;

        // Increment indices efficiently
        parameterEntryIndex++;
        gradientEntryIndex++;
    }
}