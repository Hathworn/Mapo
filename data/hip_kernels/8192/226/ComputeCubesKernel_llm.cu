#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeCubesKernel(float *pointsCoordinates, float *vertexData, int quadOffset, float cubeSide, int *activityFlag, int textureWidth, int maxCells) {
    int threadId = blockDim.x * blockIdx.y * gridDim.x
                 + blockDim.x * blockIdx.x
                 + threadIdx.x;

    if (threadId < maxCells) {
        float x = pointsCoordinates[threadId * 3];
        float y = pointsCoordinates[threadId * 3 + 1];
        float z = pointsCoordinates[threadId * 3 + 2];

        float halfSide = (activityFlag[threadId] == 0) ? 0.00f : 0.50f * cubeSide;

        const int vertexStride = 72;
        const int textureStride = 48;
        int vertexBase = quadOffset + threadId * vertexStride;
        int textureBase = quadOffset + maxCells * 4 * 6 * 3 + threadId * textureStride;

        float textureAbsLength = (float)(maxCells * textureWidth);
        float t1 = (float)((threadId) * textureWidth) / textureAbsLength;
        float t2 = (float)((threadId + 1) * textureWidth) / textureAbsLength;

        // Pre-compute vertex offsets for reusability - DRY principle
        int vBase[6] = {0, 12, 24, 36, 48, 60};
        float verts[8][3] = {
            {x - halfSide, y - halfSide, z - halfSide}, {x + halfSide, y - halfSide, z - halfSide}, 
            {x - halfSide, y + halfSide, z - halfSide}, {x + halfSide, y + halfSide, z - halfSide},
            {x - halfSide, y - halfSide, z + halfSide}, {x + halfSide, y - halfSide, z + halfSide},
            {x - halfSide, y + halfSide, z + halfSide}, {x + halfSide, y + halfSide, z + halfSide}
        };

        // BOTTOM SIDE
        vertexData[vertexBase + vBase[0] + 0] = verts[4][0];
        vertexData[vertexBase + vBase[0] + 1] = verts[4][1];
        vertexData[vertexBase + vBase[0] + 2] = verts[4][2];
        vertexData[vertexBase + vBase[0] + 3] = verts[0][0];
        vertexData[vertexBase + vBase[0] + 4] = verts[0][1];
        vertexData[vertexBase + vBase[0] + 5] = verts[0][2];
        vertexData[vertexBase + vBase[0] + 6] = verts[1][0];
        vertexData[vertexBase + vBase[0] + 7] = verts[1][1];
        vertexData[vertexBase + vBase[0] + 8] = verts[1][2];
        vertexData[vertexBase + vBase[0] + 9] = verts[5][0];
        vertexData[vertexBase + vBase[0] + 10] = verts[5][1];
        vertexData[vertexBase + vBase[0] + 11] = verts[5][2];

        // FRONT SIDE
        vertexData[vertexBase + vBase[1] + 0] = verts[6][0];
        vertexData[vertexBase + vBase[1] + 1] = verts[6][1];
        vertexData[vertexBase + vBase[1] + 2] = verts[6][2];
        vertexData[vertexBase + vBase[1] + 3] = verts[4][0];
        vertexData[vertexBase + vBase[1] + 4] = verts[4][1];
        vertexData[vertexBase + vBase[1] + 5] = verts[4][2];
        vertexData[vertexBase + vBase[1] + 6] = verts[5][0];
        vertexData[vertexBase + vBase[1] + 7] = verts[5][1];
        vertexData[vertexBase + vBase[1] + 8] = verts[5][2];
        vertexData[vertexBase + vBase[1] + 9] = verts[7][0];
        vertexData[vertexBase + vBase[1] + 10] = verts[7][1];
        vertexData[vertexBase + vBase[1] + 11] = verts[7][2];

        // LEFT SIDE
        vertexData[vertexBase + vBase[2] + 0] = verts[6][0];
        vertexData[vertexBase + vBase[2] + 1] = verts[6][1];
        vertexData[vertexBase + vBase[2] + 2] = verts[6][2];
        vertexData[vertexBase + vBase[2] + 3] = verts[2][0];
        vertexData[vertexBase + vBase[2] + 4] = verts[2][1];
        vertexData[vertexBase + vBase[2] + 5] = verts[2][2];
        vertexData[vertexBase + vBase[2] + 6] = verts[4][0];
        vertexData[vertexBase + vBase[2] + 7] = verts[4][1];
        vertexData[vertexBase + vBase[2] + 8] = verts[4][2];
        vertexData[vertexBase + vBase[2] + 9] = verts[0][0];
        vertexData[vertexBase + vBase[2] + 10] = verts[0][1];
        vertexData[vertexBase + vBase[2] + 11] = verts[0][2];

        // BACK SIDE
        vertexData[vertexBase + vBase[3] + 0] = verts[3][0];
        vertexData[vertexBase + vBase[3] + 1] = verts[3][1];
        vertexData[vertexBase + vBase[3] + 2] = verts[3][2];
        vertexData[vertexBase + vBase[3] + 3] = verts[2][0];
        vertexData[vertexBase + vBase[3] + 4] = verts[2][1];
        vertexData[vertexBase + vBase[3] + 5] = verts[2][2];
        vertexData[vertexBase + vBase[3] + 6] = verts[1][0];
        vertexData[vertexBase + vBase[3] + 7] = verts[1][1];
        vertexData[vertexBase + vBase[3] + 8] = verts[1][2];
        vertexData[vertexBase + vBase[3] + 9] = verts[0][0];
        vertexData[vertexBase + vBase[3] + 10] = verts[0][1];
        vertexData[vertexBase + vBase[3] + 11] = verts[0][2];

        // RIGHT SIDE
        vertexData[vertexBase + vBase[4] + 0] = verts[7][0];
        vertexData[vertexBase + vBase[4] + 1] = verts[7][1];
        vertexData[vertexBase + vBase[4] + 2] = verts[7][2];
        vertexData[vertexBase + vBase[4] + 3] = verts[5][0];
        vertexData[vertexBase + vBase[4] + 4] = verts[5][1];
        vertexData[vertexBase + vBase[4] + 5] = verts[5][2];
        vertexData[vertexBase + vBase[4] + 6] = verts[3][0];
        vertexData[vertexBase + vBase[4] + 7] = verts[3][1];
        vertexData[vertexBase + vBase[4] + 8] = verts[3][2];
        vertexData[vertexBase + vBase[4] + 9] = verts[1][0];
        vertexData[vertexBase + vBase[4] + 10] = verts[1][1];
        vertexData[vertexBase + vBase[4] + 11] = verts[1][2];

        // UPPER SIDE
        vertexData[vertexBase + vBase[5] + 0] = verts[6][0];
        vertexData[vertexBase + vBase[5] + 1] = verts[6][1];
        vertexData[vertexBase + vBase[5] + 2] = verts[6][2];
        vertexData[vertexBase + vBase[5] + 3] = verts[2][0];
        vertexData[vertexBase + vBase[5] + 4] = verts[2][1];
        vertexData[vertexBase + vBase[5] + 5] = verts[2][2];
        vertexData[vertexBase + vBase[5] + 6] = verts[7][0];
        vertexData[vertexBase + vBase[5] + 7] = verts[7][1];
        vertexData[vertexBase + vBase[5] + 8] = verts[7][2];
        vertexData[vertexBase + vBase[5] + 9] = verts[3][0];
        vertexData[vertexBase + vBase[5] + 10] = verts[3][1];
        vertexData[vertexBase + vBase[5] + 11] = verts[3][2];

        // Update texture coordinates
        float texCoords[2][4] = {{t1, 0.00f, t1, 1.00f}, {t2, 1.00f, t2, 0.00f}};
        for (int i = 0; i < 6; i++) {
            vertexData[textureBase + i * 8 + 0] = texCoords[0][0];
            vertexData[textureBase + i * 8 + 1] = texCoords[0][1];
            vertexData[textureBase + i * 8 + 2] = texCoords[0][2];
            vertexData[textureBase + i * 8 + 3] = texCoords[0][3];
            vertexData[textureBase + i * 8 + 4] = texCoords[1][0];
            vertexData[textureBase + i * 8 + 5] = texCoords[1][1];
            vertexData[textureBase + i * 8 + 6] = texCoords[1][2];
            vertexData[textureBase + i * 8 + 7] = texCoords[1][3];
        }
    }
}