#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeQuadsKernel(float *pointsCoordinates, float *vertexData, int quadOffset, float textureSide, int *activityFlag, int textureWidth, int maxCells) {
    int threadId = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;
    
    if (threadId < maxCells) {
        float x = pointsCoordinates[threadId * 3];
        float y = pointsCoordinates[threadId * 3 + 1];
        float z = pointsCoordinates[threadId * 3 + 2];
        
        // Precompute reused values to reduce operations within the loop
        float halfSide = (activityFlag[threadId] == 0) ? 0.00f : 0.50f * textureSide;
        int baseQuadOffset = quadOffset + threadId * 36;
        int baseTextureOffset = quadOffset + maxCells * 4 * 3 * 3 + threadId * 24;
        float textureAbsLength = (float)(maxCells * textureWidth);
        float textureCoord = (float)(threadId * textureWidth) / textureAbsLength;
        float textureCoordNext = (float)((threadId + 1) * textureWidth) / textureAbsLength;

        // Vertical x-aligned
        vertexData[baseQuadOffset] = x - halfSide;
        vertexData[baseQuadOffset + 1] = y + halfSide;
        vertexData[baseQuadOffset + 2] = z;
        vertexData[baseTextureOffset] = textureCoord;
        vertexData[baseTextureOffset + 1] = 0.00f;

        vertexData[baseQuadOffset + 3] = x - halfSide;
        vertexData[baseQuadOffset + 4] = y - halfSide;
        vertexData[baseQuadOffset + 5] = z;
        vertexData[baseTextureOffset + 2] = textureCoord;
        vertexData[baseTextureOffset + 3] = 1.00f;

        vertexData[baseQuadOffset + 6] = x + halfSide;
        vertexData[baseQuadOffset + 7] = y - halfSide;
        vertexData[baseQuadOffset + 8] = z;
        vertexData[baseTextureOffset + 4] = textureCoordNext;
        vertexData[baseTextureOffset + 5] = 1.00f;

        vertexData[baseQuadOffset + 9] = x + halfSide;
        vertexData[baseQuadOffset + 10] = y + halfSide;
        vertexData[baseQuadOffset + 11] = z;
        vertexData[baseTextureOffset + 6] = textureCoordNext;
        vertexData[baseTextureOffset + 7] = 0.00f;

        // Horizontal
        vertexData[baseQuadOffset + 12] = x - halfSide;
        vertexData[baseQuadOffset + 13] = y;
        vertexData[baseQuadOffset + 14] = z + halfSide;
        vertexData[baseTextureOffset + 8] = textureCoord;
        vertexData[baseTextureOffset + 9] = 1.00f;

        vertexData[baseQuadOffset + 15] = x - halfSide;
        vertexData[baseQuadOffset + 16] = y;
        vertexData[baseQuadOffset + 17] = z - halfSide;
        vertexData[baseTextureOffset + 10] = textureCoord;
        vertexData[baseTextureOffset + 11] = 0.00f;

        vertexData[baseQuadOffset + 18] = x + halfSide;
        vertexData[baseQuadOffset + 19] = y;
        vertexData[baseQuadOffset + 20] = z - halfSide;
        vertexData[baseTextureOffset + 12] = textureCoordNext;
        vertexData[baseTextureOffset + 13] = 0.00f;

        vertexData[baseQuadOffset + 21] = x + halfSide;
        vertexData[baseQuadOffset + 22] = y;
        vertexData[baseQuadOffset + 23] = z + halfSide;
        vertexData[baseTextureOffset + 14] = textureCoordNext;
        vertexData[baseTextureOffset + 15] = 1.00f;

        // Vertical z-aligned
        vertexData[baseQuadOffset + 24] = x;
        vertexData[baseQuadOffset + 25] = y - halfSide;
        vertexData[baseQuadOffset + 26] = z + halfSide;
        vertexData[baseTextureOffset + 16] = textureCoordNext;
        vertexData[baseTextureOffset + 17] = 1.00f;

        vertexData[baseQuadOffset + 27] = x;
        vertexData[baseQuadOffset + 28] = y - halfSide;
        vertexData[baseQuadOffset + 29] = z - halfSide;
        vertexData[baseTextureOffset + 18] = textureCoord;
        vertexData[baseTextureOffset + 19] = 1.00f;

        vertexData[baseQuadOffset + 30] = x;
        vertexData[baseQuadOffset + 31] = y + halfSide;
        vertexData[baseQuadOffset + 32] = z - halfSide;
        vertexData[baseTextureOffset + 20] = textureCoord;
        vertexData[baseTextureOffset + 21] = 0.00f;

        vertexData[baseQuadOffset + 33] = x;
        vertexData[baseQuadOffset + 34] = y + halfSide;
        vertexData[baseQuadOffset + 35] = z + halfSide;
        vertexData[baseTextureOffset + 22] = textureCoordNext;
        vertexData[baseTextureOffset + 23] = 0.00f;
    }
}