#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeCubesKernel( float *pointsCoordinates, float *vertexData, int quadOffset, float cubeSide, int *activityFlag, int textureWidth, int maxCells )
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;
    
    if (threadId < maxCells)
    {
        // Precompute common indices and multiplier
        int vertexBaseIdx = quadOffset + threadId * 72;
        int textureBaseIdx = quadOffset + maxCells * 4 * 6 * 3 + threadId * 48;
        float texCoordMultiplier = (float)textureWidth / (float)(maxCells * textureWidth);

        float x = pointsCoordinates[threadId * 3];
        float y = pointsCoordinates[threadId * 3 + 1];
        float z = pointsCoordinates[threadId * 3 + 2];
        float halfSide = (activityFlag[threadId] == 0) ? 0.00f : 0.50f * cubeSide;

        // Helper lambda to set vertex data
        auto setVertexData = [&](int idx, float vx, float vy, float vz) {
            vertexData[vertexBaseIdx + idx] = vx;
            vertexData[vertexBaseIdx + idx + 1] = vy;
            vertexData[vertexBaseIdx + idx + 2] = vz;
        };

        // Helper lambda to set texture data
        auto setTextureData = [&](int idx, float tx, float ty) {
            vertexData[textureBaseIdx + idx] = tx;
            vertexData[textureBaseIdx + idx + 1] = ty;
        };

        // BOTTOM SIDE
        setVertexData(0, x - halfSide, y - halfSide, z + halfSide);
        setVertexData(3, x - halfSide, y - halfSide, z - halfSide);
        setVertexData(6, x + halfSide, y - halfSide, z - halfSide);
        setVertexData(9, x + halfSide, y - halfSide, z + halfSide);

        setTextureData(0, texCoordMultiplier * threadId, 0.00f);
        setTextureData(2, texCoordMultiplier * threadId, 1.00f);
        setTextureData(4, texCoordMultiplier * (threadId + 1), 1.00f);
        setTextureData(6, texCoordMultiplier * (threadId + 1), 0.00f);

        // FRONT SIDE
        setVertexData(12, x - halfSide, y + halfSide, z + halfSide);
        setVertexData(15, x - halfSide, y - halfSide, z + halfSide);
        setVertexData(18, x + halfSide, y - halfSide, z + halfSide);
        setVertexData(21, x + halfSide, y + halfSide, z + halfSide);

        setTextureData(8, texCoordMultiplier * threadId, 0.00f);
        setTextureData(10, texCoordMultiplier * threadId, 1.00f);
        setTextureData(12, texCoordMultiplier * (threadId + 1), 1.00f);
        setTextureData(14, texCoordMultiplier * (threadId + 1), 0.00f);

        // LEFT SIDE
        setVertexData(24, x - halfSide, y + halfSide, z - halfSide);
        setVertexData(27, x - halfSide, y - halfSide, z - halfSide);
        setVertexData(30, x - halfSide, y - halfSide, z + halfSide);
        setVertexData(33, x - halfSide, y + halfSide, z + halfSide);

        setTextureData(16, texCoordMultiplier * threadId, 0.00f);
        setTextureData(18, texCoordMultiplier * threadId, 1.00f);
        setTextureData(20, texCoordMultiplier * (threadId + 1), 1.00f);
        setTextureData(22, texCoordMultiplier * (threadId + 1), 0.00f);

        // BACK SIDE
        setVertexData(36, x - halfSide, y + halfSide, z - halfSide);
        setVertexData(39, x - halfSide, y - halfSide, z - halfSide);
        setVertexData(42, x + halfSide, y - halfSide, z - halfSide);
        setVertexData(45, x + halfSide, y + halfSide, z - halfSide);

        setTextureData(24, texCoordMultiplier * (threadId + 1), 0.00f);
        setTextureData(26, texCoordMultiplier * (threadId + 1), 1.00f);
        setTextureData(28, texCoordMultiplier * threadId, 1.00f);
        setTextureData(30, texCoordMultiplier * threadId, 0.00f);

        // RIGHT SIDE
        setVertexData(48, x + halfSide, y + halfSide, z - halfSide);
        setVertexData(51, x + halfSide, y - halfSide, z - halfSide);
        setVertexData(54, x + halfSide, y - halfSide, z + halfSide);
        setVertexData(57, x + halfSide, y + halfSide, z + halfSide);

        setTextureData(32, texCoordMultiplier * (threadId + 1), 0.00f);
        setTextureData(34, texCoordMultiplier * (threadId + 1), 1.00f);
        setTextureData(36, texCoordMultiplier * threadId, 1.00f);
        setTextureData(38, texCoordMultiplier * threadId, 0.00f);

        // UPPER SIDE
        setVertexData(60, x - halfSide, y + halfSide, z + halfSide);
        setVertexData(63, x - halfSide, y + halfSide, z - halfSide);
        setVertexData(66, x + halfSide, y + halfSide, z - halfSide);
        setVertexData(69, x + halfSide, y + halfSide, z + halfSide);

        setTextureData(40, texCoordMultiplier * threadId, 1.00f);
        setTextureData(42, texCoordMultiplier * threadId, 0.00f);
        setTextureData(44, texCoordMultiplier * (threadId + 1), 0.00f);
        setTextureData(46, texCoordMultiplier * (threadId + 1), 1.00f);
    }
}