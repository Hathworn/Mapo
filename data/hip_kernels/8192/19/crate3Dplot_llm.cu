#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void crate3Dplot(float* plotValues, float patchSize, int itemsX, int itemsY, float maxValue, float* vertexData)
{
    // Calculate threadId and total size
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int size = itemsX * itemsY;

    // Early exit if threadId is out of bounds
    if (threadId >= size) return;

    // Precompute some constants and indices
    float texSizeX = 1.0f / itemsX;
    float texSizeY = 1.0f / itemsY;
    int patchX = threadId / itemsY;
    int patchY = itemsY - (threadId % itemsY) - 1;
    float height = plotValues[threadId] / maxValue;
    float3* vertTop = (float3*)vertexData;
    float2* texCoords = (float2*)(vertexData + (60 * size));

    // Shared gap variable
    const float gap = 0.000;

    // Calculate positions for top side vertices
    float3 topVertices[4] = {
        {patchX * patchSize + gap, height, patchY * patchSize + gap},
        {(patchX + 1) * patchSize - gap, height, patchY * patchSize + gap},
        {(patchX + 1) * patchSize - gap, height, (patchY + 1) * patchSize - gap},
        {patchX * patchSize + gap, height, (patchY + 1) * patchSize - gap}
    };

    // Assign top side vertices and texture coordinates
    for (int i = 0; i < 4; ++i) {
        vertTop[threadId * 4 + i] = topVertices[i];
    }

    texCoords[threadId * 4] = {patchX * texSizeX, patchY * texSizeY};
    texCoords[threadId * 4 + 1] = {(patchX + 1) * texSizeX, patchY * texSizeY};
    texCoords[threadId * 4 + 2] = {(patchX + 1) * texSizeX, (patchY + 1) * texSizeY};
    texCoords[threadId * 4 + 3] = {patchX * texSizeX, (patchY + 1) * texSizeY};

    // Define other side vertices offsets
    float3* vertLeft = (float3*)(vertexData + 12 * size);
    float3* vertFar = (float3*)(vertexData + 24 * size);
    float3* vertNear = (float3*)(vertexData + 36 * size);
    float3* vertRight = (float3*)(vertexData + 48 * size);

    float3 bottomVertex, sideVertices[2];

    // Initialize the sides
    for (int i = 0; i < 5; ++i) {
        switch (i) {
            // Left side
            case 0:
                sideVertices[0] = topVertices[0];
                sideVertices[1] = topVertices[3];
                bottomVertex = topVertices[0];
            break;
            // Far side
            case 1:
                sideVertices[0] = topVertices[2];
                sideVertices[1] = topVertices[3];
                bottomVertex = topVertices[2];
            break;
            // Near side
            case 2:
                sideVertices[0] = topVertices[1];
                sideVertices[1] = topVertices[0];
                bottomVertex = topVertices[1];
            break;
            // Right side
            case 3:
                sideVertices[0] = topVertices[2];
                sideVertices[1] = topVertices[1];
                bottomVertex = topVertices[2];
            break;
        }
        
        sideVertices[0].y = sideVertices[1].y = bottomVertex.y = 0;

        // Assign vertices for each side
        switch (i) {
            case 0: {
                float3* vertices = vertLeft + threadId * 4;
                vertices[0] = bottomVertex;
                vertices[1] = topVertices[0];
                vertices[2] = sideVertices[1];
                vertices[3] = topVertices[3];
            } break;
            case 1: {
                float3* vertices = vertFar + threadId * 4;
                vertices[0] = bottomVertex;
                vertices[1] = sideVertices[1];
                vertices[2] = topVertices[3];
                vertices[3] = topVertices[2];
            } break;
            case 2: {
                float3* vertices = vertNear + threadId * 4;
                vertices[0] = bottomVertex;
                vertices[1] = sideVertices[1];
                vertices[2] = topVertices[0];
                vertices[3] = topVertices[1];
            } break;
            case 3: {
                float3* vertices = vertRight + threadId * 4;
                vertices[0] = bottomVertex;
                vertices[1] = topVertices[2];
                vertices[2] = sideVertices[1];
                vertices[3] = topVertices[1];
            } break;
        }
    }
}