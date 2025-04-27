#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyConnectionsCoordinatesKernel(int *connectionMatrix, float *pointsCoordinates, float *vertexData, int *connectionCount, int maxCells)
{
    // Calculate the unique thread ID
    int threadId = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;

    if (threadId < maxCells * maxCells)
    {
        // Optimize by loading once and using early exit if not connected
        int connection = connectionMatrix[threadId];
        if (connection == 0) return;

        int from = threadId / maxCells;
        int to = threadId % maxCells;

        if (to > from)
        {
            int connIdx = atomicAdd(&connectionCount[0], 1) * 6; // Optimize index calculation

            float *fromPoint = &pointsCoordinates[from * 3]; // Pointer aliasing for clarity
            float *toPoint = &pointsCoordinates[to * 3];

            vertexData[connIdx] = fromPoint[0];
            vertexData[connIdx + 1] = fromPoint[1];
            vertexData[connIdx + 2] = fromPoint[2];

            vertexData[connIdx + 3] = toPoint[0];
            vertexData[connIdx + 4] = toPoint[1];
            vertexData[connIdx + 5] = toPoint[2];
        }
    }
}