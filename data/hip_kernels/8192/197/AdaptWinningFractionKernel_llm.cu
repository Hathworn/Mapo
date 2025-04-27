#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize grid and block indexing calculation
__global__ void AdaptWinningFractionKernel(int s1, float *winningFraction, int *winningCount, float bParam, int maxCells)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread ID calculation

    if(threadId < maxCells)
    {
        float wf = winningFraction[threadId];
        float increment = bParam * ((float)(threadId == s1) - wf); // Cache repetitive calculation
        winningFraction[threadId] += increment; // Use compound assignment to modify in place
        winningCount[threadId] += (threadId == s1); // Simplified increment logic
    }
}