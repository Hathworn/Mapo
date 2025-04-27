#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void TwoNodesDifferenceKernel(int nodeOne, int nodeTwo, int vectorLength, float *referenceVector, float *twoNodesDifference)
{
    // Calculate unique thread ID using 1D grid
    int threadId = blockDim.x * blockIdx.x + threadIdx.x;

    // Process only if threadId is within bounds
    if(threadId < vectorLength)
    {
        // Compute index offsets directly
        int indexOne = nodeOne * vectorLength + threadId;
        int indexTwo = nodeTwo * vectorLength + threadId;
        
        // Calculate difference
        twoNodesDifference[threadId] = referenceVector[indexOne] - referenceVector[indexTwo];
    }
}