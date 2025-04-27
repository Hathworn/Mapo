#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VectorInputDiffKernel( float *input, int inputSize, float *referenceVector, int maxCells, float *difference )
{
    // Calculate global thread index
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Ensure threadId is within valid range
    if (threadId < maxCells * inputSize)
    {
        // Compute the difference by leveraging modular arithmetic.
        int inputIdx = threadId % inputSize; // Compute index for input
        difference[threadId] = input[inputIdx] - referenceVector[threadId];
    }
}