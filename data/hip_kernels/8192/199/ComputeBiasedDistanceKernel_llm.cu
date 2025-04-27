#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeBiasedDistanceKernel(float *distance, float *biasedDistance, float *biasTerm, int maxCells)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Calculate global thread ID

    if (threadId < maxCells)
    {
        biasedDistance[threadId] = distance[threadId] + biasTerm[threadId]; // Compute biased distance
    }
}