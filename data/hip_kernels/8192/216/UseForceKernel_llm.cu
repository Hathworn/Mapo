#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UseForceKernel(float *force, float forceFactor, float *pointsCoordinates, int maxCells)
{
    // Calculate global thread ID efficiently
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    if (threadId < maxCells * 3)
    {
        // Perform operation by accessing memory efficiently
        pointsCoordinates[threadId] += forceFactor * force[threadId];
    }
}