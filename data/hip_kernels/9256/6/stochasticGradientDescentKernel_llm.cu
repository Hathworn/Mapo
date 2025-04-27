#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void stochasticGradientDescentKernel (int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float learningRate) {

    int updateIndex = blockIdx.x;
    int parameterIndex = parameterIndices[updateIndex];
    int count = counts[updateIndex];

    if(parameterIndex != -1 && count > 0) {

        float scalingFactor = 1.0f / (float)count;

        int startEntryIndex = (blockIdx.y * blockDim.x + threadIdx.x) * numberIterations;

        int firstParameterEntryIndex = parameterIndex * dimension;
        int startParameterEntryIndex = firstParameterEntryIndex + startEntryIndex;
        int startGradientEntryIndex = updateIndex * dimension + startEntryIndex;

        int exclusiveEndParameterEntryIndex = min(startParameterEntryIndex + numberIterations, firstParameterEntryIndex + dimension);

        // Unroll the loop for better warp utilization
        for(int parameterEntryIndex = startParameterEntryIndex, gradientEntryIndex = startGradientEntryIndex;
            parameterEntryIndex < exclusiveEndParameterEntryIndex; parameterEntryIndex++, gradientEntryIndex++) {
            
            float scaledDerivative = scalingFactor * gradient[gradientEntryIndex];
            parameters[parameterEntryIndex] -= learningRate * scaledDerivative;
        }
    }
}