#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stochasticGradientDescentKernel(int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float learningRate) {

    int updateIndex = blockIdx.x;
    int parameterIndex = parameterIndices[updateIndex];
    int count = counts[updateIndex];

    // Check if parameterIndex is valid and count is greater than zero
    if (parameterIndex != -1 && count > 0) {
        // Pre-compute scaling factor
        float scalingFactor = 1.0f / (float)count;

        // Calculate starting indexes
        int startEntryIndex = (blockIdx.y * blockDim.x + threadIdx.x) * numberIterations;
        int firstParameterEntryIndex = parameterIndex * dimension;
        int startParameterEntryIndex = firstParameterEntryIndex + startEntryIndex;
        int startGradientEntryIndex = updateIndex * dimension + startEntryIndex;

        // Use min to ensure we do not exceed the dimension
        int exclusiveEndParameterEntryIndex = min(startParameterEntryIndex + numberIterations, firstParameterEntryIndex + dimension);

        // Loop through each entry while performing the update
        for (int i = startParameterEntryIndex, j = startGradientEntryIndex; i < exclusiveEndParameterEntryIndex; ++i, ++j) {
            float scaledDerivative = scalingFactor * gradient[j];
            parameters[i] -= learningRate * scaledDerivative;
        }
    }
}