#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rmspropKernel(int numberIterations, int* parameterIndices, int* counts, int dimension, float* parameters, float* gradient, float learningRate, float decay, float oneMinusDecay, float epsilon, float* accumulation) {

    int updateIndex = blockIdx.x;
    int parameterIndex = parameterIndices[updateIndex];
    int count = counts[updateIndex];

    // Check if update is necessary
    if (parameterIndex != -1 && count > 0) {

        // Use shared memory for faster access
        extern __shared__ float sharedGrad[];

        float scalingFactor = 1.0f / (float)count;
        int firstParameterEntryIndex = parameterIndex * dimension;
        int startEntryIndex = (blockIdx.y * blockDim.x + threadIdx.x) * numberIterations;
        int startParameterEntryIndex = firstParameterEntryIndex + startEntryIndex;
        int startGradientEntryIndex = updateIndex * dimension + startEntryIndex;
        int exclusiveEndParameterEntryIndex = min(startParameterEntryIndex + numberIterations, firstParameterEntryIndex + dimension);

        // Load gradient to shared memory; assuming numberIterations <= blockDim.x for simplicity
        if (threadIdx.x < numberIterations) {
            sharedGrad[threadIdx.x] = gradient[startGradientEntryIndex + threadIdx.x];
        }
        __syncthreads(); // Ensure all threads have loaded the gradients

        for (int offset = 0; offset < numberIterations; offset++) {
            int parameterEntryIndex = startParameterEntryIndex + offset;
            if (parameterEntryIndex < exclusiveEndParameterEntryIndex) {
                float scaledDerivative = scalingFactor * sharedGrad[offset]; // Use shared memory
                float updatedAccumulation = decay * accumulation[parameterEntryIndex] + oneMinusDecay * (scaledDerivative * scaledDerivative);
                accumulation[parameterEntryIndex] = updatedAccumulation;

                float adaptiveLearningRate = learningRate / sqrtf(updatedAccumulation + epsilon);
                float update = -adaptiveLearningRate * scaledDerivative;
                parameters[parameterEntryIndex] += update;
            }
        }
    }
}