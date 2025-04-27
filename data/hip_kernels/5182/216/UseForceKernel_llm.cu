#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UseForceKernel(float *force, float forceFactor, float *pointsCoordinates, int maxCells)
{
    // Calculate a linear thread index across the grid
    int threadId = blockIdx.x * blockDim.x + blockIdx.y * gridDim.x * blockDim.x + threadIdx.x;

    // Ensure threadId does not exceed bounds
    if(threadId < maxCells * 3)
    {
        // Update point coordinates using computed force
        pointsCoordinates[threadId] += forceFactor * force[threadId];
    }
}
```
