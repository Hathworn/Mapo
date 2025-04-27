#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TwoNodesDifferenceKernel(int nodeOne, int nodeTwo, int vectorLength, float *referenceVector, float *twoNodesDifference)
{
    // Use a 1D grid of 1D blocks for simplified thread indexing
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Only compute if threadId is within bounds
    if (threadId < vectorLength)
    {
        // Calculate difference for the corresponding elements in referenceVector
        twoNodesDifference[threadId] = referenceVector[nodeOne * vectorLength + threadId] - referenceVector[nodeTwo * vectorLength + threadId];
    }
}