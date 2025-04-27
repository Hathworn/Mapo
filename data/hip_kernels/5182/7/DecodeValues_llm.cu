#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DecodeValues(float* superposition, int symbolSize, float* output, float* reliability, int numOfValues, int squaredMode, float* dirX, float* dirY, float* negDirX, float* negDirY, float* originX, float* originY)
{
    int threadId = blockDim.x * blockIdx.x + threadIdx.x + blockDim.x * gridDim.x * blockIdx.y; // Calculate threadId

    if (threadId >= numOfValues)
        return;

    float* dir = threadId == 0 ? dirX : dirY;
    float* negDir = threadId == 0 ? negDirX : negDirY;
    float* origin = threadId == 0 ? originX : originY;

    float localOutput = 0.0f;
    float localReliability = 0.0f;

    #pragma unroll
    for (int i = 0; i < symbolSize; i++)
    {
        // Use fused multiply-add for better precision and performance
        localOutput = fmaf(superposition[i], dir[i], localOutput);
        localOutput = fmaf(-superposition[i], negDir[i], localOutput);

        localReliability = fmaf(superposition[i], origin[i], localReliability);
    }

    localReliability += fabs(localOutput);
    output[threadId] = localOutput / localReliability;
    reliability[threadId] = localReliability;
}