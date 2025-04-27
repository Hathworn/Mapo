#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeQuadsKernel(float *pointsCoordinates, float *vertexData, int quadOffset, float textureSide, int *activityFlag, int textureWidth, int maxCells)
{
    // Compute threadId using simpler and clearer syntax
    int threadId = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;

    if (threadId < maxCells)
    {
        // Use temporary variables for repeated calculations and improve readability
        float x = pointsCoordinates[threadId * 3];
        float y = pointsCoordinates[threadId * 3 + 1];
        float z = pointsCoordinates[threadId * 3 + 2];

        float halfSide = activityFlag[threadId] == 0 ? 0.00f : 0.50f * textureSide;

        int offset36 = quadOffset + threadId * 36;
        int offset24 = quadOffset + maxCells * 4 * 3 * 3 + threadId * 24;
        float textureAbsLength = static_cast<float>(maxCells * textureWidth);
        float textureNormalizedId = static_cast<float>(threadId) * textureWidth / textureAbsLength;
        float textureNormalizedIdNext = static_cast<float>(threadId + 1) * textureWidth / textureAbsLength;

        // Precompute index offsets
        // Vertical x-alligned
        vertexData[offset36] = x - halfSide;
        vertexData[offset36 + 1] = y + halfSide;
        vertexData[offset36 + 2] = z;
        vertexData[offset24] = textureNormalizedId;
        vertexData[offset24 + 1] = 0.00f;

        vertexData[offset36 + 3] = x - halfSide;
        vertexData[offset36 + 4] = y - halfSide;
        vertexData[offset36 + 5] = z;
        vertexData[offset24 + 2] = textureNormalizedId;
        vertexData[offset24 + 3] = 1.00f;

        vertexData[offset36 + 6] = x + halfSide;
        vertexData[offset36 + 7] = y - halfSide;
        vertexData[offset36 + 8] = z;
        vertexData[offset24 + 4] = textureNormalizedIdNext;
        vertexData[offset24 + 5] = 1.00f;

        vertexData[offset36 + 9] = x + halfSide;
        vertexData[offset36 + 10] = y + halfSide;
        vertexData[offset36 + 11] = z;
        vertexData[offset24 + 6] = textureNormalizedIdNext;
        vertexData[offset24 + 7] = 0.00f;

        // Horizontal
        vertexData[offset36 + 12] = x - halfSide;
        vertexData[offset36 + 13] = y;
        vertexData[offset36 + 14] = z + halfSide;
        vertexData[offset24 + 8] = textureNormalizedId;
        vertexData[offset24 + 9] = 1.00f;

        vertexData[offset36 + 15] = x - halfSide;
        vertexData[offset36 + 16] = y;
        vertexData[offset36 + 17] = z - halfSide;
        vertexData[offset24 + 10] = textureNormalizedId;
        vertexData[offset24 + 11] = 0.00f;

        vertexData[offset36 + 18] = x + halfSide;
        vertexData[offset36 + 19] = y;
        vertexData[offset36 + 20] = z - halfSide;
        vertexData[offset24 + 12] = textureNormalizedIdNext;
        vertexData[offset24 + 13] = 0.00f;

        vertexData[offset36 + 21] = x + halfSide;
        vertexData[offset36 + 22] = y;
        vertexData[offset36 + 23] = z + halfSide;
        vertexData[offset24 + 14] = textureNormalizedIdNext;
        vertexData[offset24 + 15] = 1.00f;

        // Vertical z-alligned
        vertexData[offset36 + 24] = x;
        vertexData[offset36 + 25] = y - halfSide;
        vertexData[offset36 + 26] = z + halfSide;
        vertexData[offset24 + 16] = textureNormalizedIdNext;
        vertexData[offset24 + 17] = 1.00f;

        vertexData[offset36 + 27] = x;
        vertexData[offset36 + 28] = y - halfSide;
        vertexData[offset36 + 29] = z - halfSide;
        vertexData[offset24 + 18] = textureNormalizedId;
        vertexData[offset24 + 19] = 1.00f;

        vertexData[offset36 + 30] = x;
        vertexData[offset36 + 31] = y + halfSide;
        vertexData[offset36 + 32] = z - halfSide;
        vertexData[offset24 + 20] = textureNormalizedId;
        vertexData[offset24 + 21] = 0.00f;

        vertexData[offset36 + 33] = x;
        vertexData[offset36 + 34] = y + halfSide;
        vertexData[offset36 + 35] = z + halfSide;
        vertexData[offset24 + 22] = textureNormalizedIdNext;
        vertexData[offset24 + 23] = 0.00f;
    }
}