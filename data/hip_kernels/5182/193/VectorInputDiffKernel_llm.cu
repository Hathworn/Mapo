#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VectorInputDiffKernel(float *input, int inputSize, float *referenceVector, int maxCells, float *difference)
{
    // Calculate global thread index
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds
    if (threadId < maxCells * inputSize)
    {
        // Compute the difference
        difference[threadId] = input[threadId % inputSize] - referenceVector[threadId];
    }
}