#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AdaptRefVectorKernel(int cell, float *referenceVector, float oldErrorFraction, float youngErrorFraction, float decayFactor, int *winningCount, float *difference, int inputSize)
{
    // Calculate thread ID in a more efficient way
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    if (threadId < inputSize)
    {
        // Precalculate exponential value to avoid recalculating inside the loop
        float expValue = expf(-decayFactor * winningCount[cell]);
        float errorFraction = (youngErrorFraction - oldErrorFraction) * expValue + oldErrorFraction;
        referenceVector[cell * inputSize + threadId] += errorFraction * difference[cell * inputSize + threadId];
    }
}