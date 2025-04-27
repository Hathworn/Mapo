#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nesterovKernel(int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float learningRate, float momentum, float* history, float* backup) {

    int updateIndex = blockIdx.x;
    int parameterIndex = parameterIndices[updateIndex];
    int count = counts[updateIndex];

    if (parameterIndex != -1 && count > 0) {
        float scalingFactor = 1.0f / (float)count;
        int startEntryIndex = (blockIdx.y * blockDim.x + threadIdx.x) * numberIterations;

        int firstParameterEntryIndex = parameterIndex * dimension;
        int startParameterEntryIndex = firstParameterEntryIndex + startEntryIndex;
        int exclusiveEndParameterEntryIndex = min(startParameterEntryIndex + numberIterations, firstParameterEntryIndex + dimension);

        int startGradientEntryIndex = updateIndex * dimension + startEntryIndex;

        int parameterEntryIndex = startParameterEntryIndex;
        int gradientEntryIndex = startGradientEntryIndex;

        // Loop optimization for parallel computation
        #pragma unroll
        for (int i = startParameterEntryIndex; i < exclusiveEndParameterEntryIndex; i++, gradientEntryIndex++) {
            float entryBackup = history[i];
            backup[i] = entryBackup;

            float scaledDerivative = scalingFactor * gradient[gradientEntryIndex];
            float entryUpdate = momentum * history[i] - learningRate * scaledDerivative;
            history[i] = entryUpdate;

            float removedPreviousLookAhead = parameters[i] - momentum * entryBackup;
            parameters[i] = removedPreviousLookAhead + (1.0f + momentum) * entryUpdate;
        }
    }
}