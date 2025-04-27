#include "hip/hip_runtime.h"
#include "includes.h"
__global__  void DecodeValues(float* superposition, int symbolSize, float* output, float* reliability, int numOfValues, int squaredMode, float* dirX, float* dirY, float* negDirX, float* negDirY, float* originX, float* originY)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    if (threadId >= numOfValues)
        return;

    float* dir = (threadId % 2 == 0) ? dirX : dirY;
    float* negDir = (threadId % 2 == 0) ? negDirX : negDirY;
    float* origin = (threadId % 2 == 0) ? originX : originY;

    float outVal = 0;
    float relVal = 0;

    // Using float local variables for accumulation to optimize memory access
    for (int i = 0; i < symbolSize; i++)
    {
        float sup_i = superposition[i];
        outVal += sup_i * (dir[i] - negDir[i]);  // Combined computation to reduce redundant operations
        relVal += sup_i * origin[i];
    }

    // Final calculations
    relVal += fabs(outVal);
    output[threadId] = outVal / relVal;
    reliability[threadId] = relVal;
}