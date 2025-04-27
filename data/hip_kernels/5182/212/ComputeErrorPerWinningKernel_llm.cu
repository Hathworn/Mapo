#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeErrorPerWinningKernel(float *localError, int *winningCount, float *errorPerWinning, int *activityFlag, int maxCells)
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x // rows preceding current row in grid
                 + blockDim.x * blockIdx.x             // blocks preceding current block
                 + threadIdx.x;

    if (threadId < maxCells && activityFlag[threadId] == 1) // Combine conditions to minimize branching
    {
        float count = winningCount[threadId];
        errorPerWinning[threadId] = (count != 0) ? localError[threadId] / count : 0.00f; // Use ternary operator for compactness
    }
}