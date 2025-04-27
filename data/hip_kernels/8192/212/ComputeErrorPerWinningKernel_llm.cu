#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeErrorPerWinningKernel(float *localError, int *winningCount, float *errorPerWinning, int *activityFlag, int maxCells)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Simplified logic using sequential conditions
    if (threadId < maxCells && activityFlag[threadId] == 1)
    {
        errorPerWinning[threadId] = (winningCount[threadId] != 0) ? localError[threadId] / (float)winningCount[threadId] : 0.0f;
    }
}