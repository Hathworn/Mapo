#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeBiasTermKernel(float *biasTerm, float cFactor, float *winningFraction, int activeCells, int maxCells)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread ID calculation

    if(threadId < maxCells)
    {
        biasTerm[threadId] = cFactor * (1.00f / activeCells - winningFraction[threadId]);
    }
}