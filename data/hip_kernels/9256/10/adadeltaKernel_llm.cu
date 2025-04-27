#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adadeltaKernel (int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float decay, float oneMinusDecay, float epsilon, float* gradientAccumulation, float* updateAccumulation) {

    int updateIndex = blockIdx.x;
    int parameterIndex = parameterIndices[updateIndex];
    int count = counts[updateIndex];

    if (parameterIndex != -1 && count > 0) {

        // Precompute scaling factor outside the loop
        float scalingFactor = 1.0f / (float)count;

        int startEntryIndex = (blockIdx.y * blockDim.x + threadIdx.x) * numberIterations;

        int firstParameterEntryIndex = parameterIndex * dimension;
        int startParameterEntryIndex = firstParameterEntryIndex + startEntryIndex;
        int startGradientEntryIndex = updateIndex * dimension + startEntryIndex;

        int exclusiveEndParameterEntryIndex = min(startParameterEntryIndex + numberIterations, firstParameterEntryIndex + dimension);

        for (int parameterEntryIndex = startParameterEntryIndex, gradientEntryIndex = startGradientEntryIndex; 
             parameterEntryIndex < exclusiveEndParameterEntryIndex; 
             ++parameterEntryIndex, ++gradientEntryIndex) {
        
            // Load gradient once to reduce redundant memory accesses
            float scaledDerivative = scalingFactor * gradient[gradientEntryIndex];

            float newGradientAccumulation = decay * gradientAccumulation[parameterEntryIndex] + oneMinusDecay * (scaledDerivative * scaledDerivative);
            gradientAccumulation[parameterEntryIndex] = newGradientAccumulation;

            float rootMeanSquaredOfDerivatives = rsqrtf(newGradientAccumulation + epsilon); // Use rsqrt for better performance

            float pastUpdateAccumulation = updateAccumulation[parameterEntryIndex];
            float rootMeanSquaredOfPastUpdates = sqrtf(pastUpdateAccumulation + epsilon);

            float learningRate = rootMeanSquaredOfPastUpdates * rootMeanSquaredOfDerivatives; // Avoid division for performance

            float update = -learningRate * scaledDerivative;

            updateAccumulation[parameterEntryIndex] = decay * pastUpdateAccumulation + oneMinusDecay * (update * update);

            parameters[parameterEntryIndex] += update;
        }
    }
}