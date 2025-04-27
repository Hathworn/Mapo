#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void WinnersKernel( float *winner, float *vertexData, int vertexOffset, float *pointsCoordinates, float cubeSize, int maxCells )
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Use registers for frequently used calculations
    float side = 1.2f * cubeSize;
    float halfSize = 0.5f * side;

    if(threadId < maxCells && winner[threadId] == 1.00f)
    {
        // Use temporary variables to store repeated expressions
        float *point = &pointsCoordinates[threadId * 3];
        float x = point[0];
        float y = point[1];
        float z = point[2];

        // Reduce repeated calculations and improve memory access pattern
        float *vData = &vertexData[vertexOffset];
        vData[0] = x - halfSize; vData[1] = y - halfSize; vData[2] = z - halfSize;
        vData[3] = x - halfSize; vData[4] = y - halfSize; vData[5] = z + halfSize;
        vData[6] = x + halfSize; vData[7] = y - halfSize; vData[8] = z + halfSize;
        vData[9] = x + halfSize; vData[10] = y - halfSize; vData[11] = z - halfSize;
    }
}