#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AdaptRefVectorKernel(int cell, float *referenceVector, float oldErrorFraction, float youngErrorFraction, float decayFactor, int *winningCount, float *difference, int inputSize)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the unique thread ID

    if (threadId < inputSize)
    {
        // Precompute exponential decay factor outside the loop
        float decayedError = expf(-decayFactor * winningCount[cell]);
        float errorFraction = (youngErrorFraction - oldErrorFraction) * decayedError + oldErrorFraction;

        // Use pointer arithmetic for accessing elements
        float *refVecElement = referenceVector + cell * inputSize + threadId;
        float *diffElement = difference + cell * inputSize + threadId;

        // Update the reference vector
        *refVecElement += errorFraction * (*diffElement);
    }
}