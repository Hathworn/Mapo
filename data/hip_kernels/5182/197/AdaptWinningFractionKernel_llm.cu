#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AdaptWinningFractionKernel( int s1, float *winningFraction, int *winningCount, float bParam, int maxCells )
{
    // Calculate global thread ID
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threadId is within valid range
    if(threadId < maxCells)
    {
        // Update winningFraction
        float adjustment = (threadId == s1) ? 1.0f : 0.0f; // Simplify expression
        winningFraction[threadId] += bParam * (adjustment - winningFraction[threadId]);

        // Update winningCount
        winningCount[threadId] += (threadId == s1); // Simplify expression
    }
}