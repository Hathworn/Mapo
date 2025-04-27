#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel
__global__ void ComputeBiasedDistanceKernel(float *distance, float *biasedDistance, float *biasTerm, int maxCells)
{
    // Efficiently calculate the global thread index
    int threadId = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;

    // Avoid divergence with a more efficient check
    if (threadId < maxCells)
    {
        // Direct memory access within the given bounds
        biasedDistance[threadId] = distance[threadId] + biasTerm[threadId];
    }
}