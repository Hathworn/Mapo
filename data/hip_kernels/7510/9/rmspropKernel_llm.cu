#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rmspropKernel(int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float learningRate, float decay, float oneMinusDecay, float epsilon, float* accumulation) {

  // Optimize thread index calculation using built-in variables
  int updateIndex = blockIdx.x;
  int parameterIndex = parameterIndices[updateIndex];
  int count = counts[updateIndex];

  if (parameterIndex != -1 && count > 0) {

    // Pre-calculate scaling factor outside loop
    float scalingFactor = 1.0f / (float)count;

    // Optimize entry index calculation for better readability
    int startEntryIndex = threadIdx.x + blockIdx.y * blockDim.x;
    int firstParameterEntryIndex = parameterIndex * dimension;
    int startParameterEntryIndex = firstParameterEntryIndex + startEntryIndex * numberIterations;
    int startGradientEntryIndex = updateIndex * dimension + startEntryIndex * numberIterations;

    // Optimize variable naming and indexing for clarity and performance
    int exclusiveEndParameterEntryIndex = min(startParameterEntryIndex + numberIterations, firstParameterEntryIndex + dimension);

    for (int i = 0; i < numberIterations && startParameterEntryIndex + i < exclusiveEndParameterEntryIndex; i++) {

      float scaledDerivative = scalingFactor * gradient[startGradientEntryIndex + i];

      float updatedAccumulation = decay * accumulation[startParameterEntryIndex + i] + oneMinusDecay * (scaledDerivative * scaledDerivative);
      accumulation[startParameterEntryIndex + i] = updatedAccumulation;

      float adaptiveLearningRate = learningRate / sqrtf(updatedAccumulation + epsilon);
      float update = -adaptiveLearningRate * scaledDerivative;

      parameters[startParameterEntryIndex + i] += update;
    }
  }
}