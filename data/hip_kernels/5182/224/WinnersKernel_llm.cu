#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void WinnersKernel(float *winner, float *vertexData, int vertexOffset, float *pointsCoordinates, float cubeSize, int maxCells)
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x // Calculate unique thread ID
                   + blockDim.x * blockIdx.x
                   + threadIdx.x;

    if (threadId < maxCells && winner[threadId] == 1.00f)
    {
        // Pre-calculate indices
        int coordIdx = threadId * 3;
        int vertexBaseIdx = vertexOffset;

        // Load point coordinates into registers (faster access)
        float x = pointsCoordinates[coordIdx];
        float y = pointsCoordinates[coordIdx + 1];
        float z = pointsCoordinates[coordIdx + 2];

        // Pre-calculate constants
        float side = 1.2f * cubeSize;
        float halfSize = 0.50f * side;

        // Calculate and store vertex data
        vertexData[vertexBaseIdx] = x - halfSize;
        vertexData[vertexBaseIdx + 1] = y - halfSize;
        vertexData[vertexBaseIdx + 2] = z - halfSize;
        vertexData[vertexBaseIdx + 3] = x - halfSize;
        vertexData[vertexBaseIdx + 4] = y - halfSize;
        vertexData[vertexBaseIdx + 5] = z + halfSize;
        vertexData[vertexBaseIdx + 6] = x + halfSize;
        vertexData[vertexBaseIdx + 7] = y - halfSize;
        vertexData[vertexBaseIdx + 8] = z + halfSize;
        vertexData[vertexBaseIdx + 9] = x + halfSize;
        vertexData[vertexBaseIdx + 10] = y - halfSize;
        vertexData[vertexBaseIdx + 11] = z - halfSize;
    }
}