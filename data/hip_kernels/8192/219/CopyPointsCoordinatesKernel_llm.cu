```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyPointsCoordinatesKernel(float *pointsCoordinates, int *activityFlag, float xNonValid, float yNonValid, float zNonValid, float *dataVertex, int dataVertexOffset, int maxCells)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Simplified thread ID calculation

    if(threadId < maxCells)
    {
        int baseIdx = threadId * 3; // Precompute index to avoid repetition
        float xToCopy = pointsCoordinates[baseIdx];
        float yToCopy = pointsCoordinates[baseIdx + 1];
        float zToCopy = pointsCoordinates[baseIdx + 2];
        
        if(activityFlag[threadId] == 0) // Check activity flag
        {
            xToCopy = xNonValid;
            yToCopy = yNonValid;
            zToCopy = zNonValid;
        }
        
        int dataIdx = dataVertexOffset + baseIdx; // Use precomputed index for dataVertex
        dataVertex[dataIdx] = xToCopy;
        dataVertex[dataIdx + 1] = yToCopy;
        dataVertex[dataIdx + 2] = zToCopy;
    }
}