#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adadeltaKernel (int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float decay, float oneMinusDecay, float epsilon, float* gradientAccumulation, float* updateAccumulation) {

    int updateIndex = blockIdx.x;
    int parameterIndex = parameterIndices[updateIndex];
    int count = counts[updateIndex];

    if(parameterIndex != -1 && count > 0) {

        float scalingFactor = 1.0f / (float)count;

        // Calculate start entry indices
        int startEntryIndex = (blockIdx.y * blockDim.x + threadIdx.x) * numberIterations;
        int firstParameterEntryIndex = parameterIndex * dimension;
        int startParameterEntryIndex = firstParameterEntryIndex + startEntryIndex;
        int startGradientEntryIndex = updateIndex * dimension + startEntryIndex;

        // Determine exclusive end index, avoiding read out of bounds
        int exclusiveEndParameterEntryIndex = min(startParameterEntryIndex + numberIterations, firstParameterEntryIndex + dimension);

        // Loop using appropriate indices to update parameters
        for(int i = startParameterEntryIndex, j = startGradientEntryIndex; i < exclusiveEndParameterEntryIndex; ++i, ++j) {
            float scaledDerivative = scalingFactor * gradient[j];

            // Update gradient accumulation
            float newGradientAccumulation = decay * gradientAccumulation[i] + oneMinusDecay * (scaledDerivative * scaledDerivative);
            gradientAccumulation[i] = newGradientAccumulation;

            // Compute RMS values
            float rootMeanSquaredOfDerivatives = sqrtf(newGradientAccumulation + epsilon);
            float pastUpdateAccumulation = updateAccumulation[i];
            float rootMeanSquaredOfPastUpdates = sqrtf(pastUpdateAccumulation + epsilon);

            // Compute learning rate and update value
            float learningRate = rootMeanSquaredOfPastUpdates / rootMeanSquaredOfDerivatives;
            float update = -learningRate * scaledDerivative;

            // Update the accumulation and parameter
            updateAccumulation[i] = decay * pastUpdateAccumulation + oneMinusDecay * (update * update);
            parameters[i] += update;
        }
    }
}