#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CopyPointsCoordinatesKernel(float *pointsCoordinates, int *activityFlag, float xNonValid, float yNonValid, float zNonValid, float *dataVertex, int dataVertexOffset, int maxCells)
{
    // Calculate threadId more concisely
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    if(threadId < maxCells)
    {
        // Load points coordinates
        float xToCopy = pointsCoordinates[threadId * 3];
        float yToCopy = pointsCoordinates[threadId * 3 + 1];
        float zToCopy = pointsCoordinates[threadId * 3 + 2];

        // Check activityFlag and update coordinates if needed
        if(activityFlag[threadId] == 0)
        {
            xToCopy = xNonValid;
            yToCopy = yNonValid;
            zToCopy = zNonValid;
        }

        // Store results into dataVertex
        int index = dataVertexOffset + threadId * 3;
        dataVertex[index] = xToCopy;
        dataVertex[index + 1] = yToCopy;
        dataVertex[index + 2] = zToCopy;
    }
}