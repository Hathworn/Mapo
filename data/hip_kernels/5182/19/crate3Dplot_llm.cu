#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void crate3Dplot(float* plotValues, float patchSize, int itemsX, int itemsY, float maxValue, float* vertexData)
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x  // rows preceding current row in grid
                 + blockDim.x * blockIdx.x              // blocks preceding current block
                 + threadIdx.x;

    int size = itemsX * itemsY;
    float texSizeX = 1.0f / itemsX;
    float texSizeY = 1.0f / itemsY;

    int patchX = threadId / itemsY;
    int patchY = itemsY - (threadId % itemsY) - 1;

    if (threadId < size)
    {
        float height = plotValues[threadId] / maxValue;
        float gap = 0.000;

        float3* vertTop = (float3*)vertexData;
        float2* texCoords = (float2*)(vertexData + (60 * size));

        // Pre-calculate indices for efficiency
        int baseIdx = threadId * 4;
        
        // top side
        float x1 = patchX * patchSize + gap;
        float x2 = (patchX + 1) * patchSize - gap;
        float y1 = patchY * patchSize + gap;
        float y2 = (patchY + 1) * patchSize - gap;
        
        vertTop[baseIdx]     = {x1, height, y1};
        vertTop[baseIdx + 1] = {x2, height, y1};
        vertTop[baseIdx + 2] = {x2, height, y2};
        vertTop[baseIdx + 3] = {x1, height, y2};

        texCoords[baseIdx]     = {patchX * texSizeX, patchY * texSizeY};
        texCoords[baseIdx + 1] = {(patchX + 1) * texSizeX, patchY * texSizeY};
        texCoords[baseIdx + 2] = {(patchX + 1) * texSizeX, (patchY + 1) * texSizeY};
        texCoords[baseIdx + 3] = {patchX * texSizeX, (patchY + 1) * texSizeY};

        float3* vertLeft = (float3*)(vertexData + 12 * size);
        float3* vertFar = (float3*)(vertexData + 24 * size);
        float3* vertNear = (float3*)(vertexData + 36 * size);
        float3* vertRight = (float3*)(vertexData + 48 * size);

        // Simplify vertice generation
        #define SET_VERTICES(vertArray, v0, v1, v2, v3) \
            vertArray[baseIdx]     = v0; vertArray[baseIdx].y = 0; \
            vertArray[baseIdx + 1] = v1; vertArray[baseIdx + 1].y = 0; \
            vertArray[baseIdx + 2] = v2; \
            vertArray[baseIdx + 3] = v3; vertArray[baseIdx + 3].y = 0;

        SET_VERTICES(vertLeft, vertTop[baseIdx], vertTop[baseIdx], vertTop[baseIdx + 3], vertTop[baseIdx + 3])
        SET_VERTICES(vertFar,  vertTop[baseIdx + 2], vertTop[baseIdx + 3], vertTop[baseIdx + 3], vertTop[baseIdx + 2])
        SET_VERTICES(vertNear, vertTop[baseIdx + 1], vertTop[baseIdx], vertTop[baseIdx], vertTop[baseIdx + 1])
        SET_VERTICES(vertRight, vertTop[baseIdx + 2], vertTop[baseIdx + 2], vertTop[baseIdx + 1], vertTop[baseIdx + 1])
    }
}