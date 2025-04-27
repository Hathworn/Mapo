#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeBiasTermKernel(float *biasTerm, float cFactor, float *winningFraction, int activeCells, int maxCells)
{
    // Use a single dimensional block and grid structure for simplicity
    int threadId = blockDim.x * blockIdx.x + threadIdx.x;

    if (threadId < maxCells)
    {
        // Precompute common expression outside the loop for efficiency
        float factor = cFactor / activeCells;
        biasTerm[threadId] = factor - cFactor * winningFraction[threadId];
    }
}