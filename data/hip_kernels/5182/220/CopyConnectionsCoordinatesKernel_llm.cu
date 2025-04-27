#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyConnectionsCoordinatesKernel(int *connectionMatrix, float *pointsCoordinates, float *vertexData, int *connectionCount, int maxCells)
{
    // Calculate unique thread ID more efficiently
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x; 

    if (threadId < maxCells * maxCells)
    {
        if (connectionMatrix[threadId] == 1)
        {
            int from = threadId / maxCells;
            int to = threadId % maxCells;

            if (to > from)
            {
                // Use atomic operations to ensure correct counter increment
                int connIdx = atomicAdd(&connectionCount[0], 1);

                // Use loop to reduce redundancy in code
                for (int i = 0; i < 3; ++i) 
                {
                    vertexData[connIdx * 6 + i] = pointsCoordinates[from * 3 + i];
                    vertexData[connIdx * 6 + 3 + i] = pointsCoordinates[to * 3 + i];
                }
            }
        }
    }
}