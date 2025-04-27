#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeCubes2Kernel(float *pointsCoordinates, float *vertexData, int quadOffset, float cubeSide, float *cubeOperation, float *cubeTexCoordinates, int *activityFlag, float textureWidth, int maxCells)
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x     // Calculate global thread ID
                 + blockDim.x * blockIdx.x
                 + threadIdx.x;

    if (threadId < maxCells * 6)
    {
        int cellId = threadId / 6;
        float fCellId = (float)cellId;
        int sideId = threadId % 6;

        // Cache coordinates and halfSide to reduce memory accesses
        float x = pointsCoordinates[cellId * 3];
        float y = pointsCoordinates[cellId * 3 + 1];
        float z = pointsCoordinates[cellId * 3 + 2];
        float halfSide = (activityFlag[cellId] == 1) * 0.50f * cubeSide;

        int vertexBase = quadOffset + cellId * 72 + 12 * sideId;
        int textureOffset = quadOffset + maxCells * 4 * 6 * 3;
        float textureAbsLength = (float)maxCells * textureWidth;

        // Loop unrolling for vertex computation
        #pragma unroll
        for(int i = 0; i < 12; i += 3)
        {
            vertexData[vertexBase + i]     = x + operationMaskConstant[12 * sideId + i] * halfSide;
            vertexData[vertexBase + i + 1] = y + operationMaskConstant[12 * sideId + i + 1] * halfSide;
            vertexData[vertexBase + i + 2] = z + operationMaskConstant[12 * sideId + i + 2] * halfSide;
        }

        int texBase = textureOffset + cellId * 48 + 8 * sideId;

        // Loop unrolling for texture coordinate computation
        #pragma unroll
        for(int j = 0; j < 8; j += 2)
        {
            vertexData[texBase + j]     = ((fCellId + cubeTexCoordinatesConstant[sideId * 8 + j]) * textureWidth) / textureAbsLength;
            vertexData[texBase + j + 1] = cubeTexCoordinatesConstant[sideId * 8 + j + 1];
        }
    }
}