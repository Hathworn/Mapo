#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeCubes2Kernel(float *pointsCoordinates, float *vertexData, int quadOffset, float cubeSide, float *cubeOperation, float *cubeTexCoordinates, int *activityFlag, float textureWidth, int maxCells)
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x // rows preceding current row in grid
                 + blockDim.x * blockIdx.x             // blocks preceding current block
                 + threadIdx.x;

    if (threadId < maxCells * 6)
    {
        int cellId = threadId / 6;
        float fCellId = static_cast<float>(cellId);
        int sideId = threadId % 6;

        float x = pointsCoordinates[cellId * 3];
        float y = pointsCoordinates[cellId * 3 + 1];
        float z = pointsCoordinates[cellId * 3 + 2];

        // Use ternary operation directly without multiplication to save computation
        float halfSide = activityFlag[cellId] ? 0.50f * cubeSide : 0.0f;

        int textureOffset = quadOffset + maxCells * 4 * 6 * 3;
        float textureAbsLength = static_cast<float>(maxCells) * textureWidth;

        #pragma unroll  // Use loop unrolling for performance optimization
        for (int i = 0; i < 4; ++i)
        {
            int vertexIndex = quadOffset + cellId * 72 + 12 * sideId + 3 * i;
            vertexData[vertexIndex]     = x + operationMaskConstant[12 * sideId + 3 * i] * halfSide;
            vertexData[vertexIndex + 1] = y + operationMaskConstant[12 * sideId + 3 * i + 1] * halfSide;
            vertexData[vertexIndex + 2] = z + operationMaskConstant[12 * sideId + 3 * i + 2] * halfSide;

            int texIndex = textureOffset + cellId * 48 + 8 * sideId + 2 * i;
            vertexData[texIndex]     = ((fCellId + cubeTexCoordinatesConstant[sideId * 8 + 2 * i]) * textureWidth) / textureAbsLength;
            vertexData[texIndex + 1] = cubeTexCoordinatesConstant[sideId * 8 + 2 * i + 1];
        }
    }
}