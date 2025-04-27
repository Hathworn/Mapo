#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RemoveNodeByUtilityKernel(int *connectionMatrix, int *connectionAge, int *activityFlag, float *utility, float utilityConstant, float *localError, int *neuronAge, float *winningFraction, int *winningCount, float maxError, int maxCells)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Flattened 1D thread index

    if (threadId < maxCells && activityFlag[threadId] == 1 && utility[threadId] > 0.00f)
    {
        if (maxError / utility[threadId] > utilityConstant)
        {
            activityFlag[threadId] = 0;
            localError[threadId] = 0.00f;
            neuronAge[threadId] = 0;
            winningFraction[threadId] = 0.00f;
            winningCount[threadId] = 0;
            utility[threadId] = 0.00f;

            int baseIndex = threadId * maxCells; // Pre-calculate base index for efficiency
            for (int n = 0; n < maxCells; n++)
            {
                connectionMatrix[baseIndex + n] = 0;
                connectionAge[baseIndex + n] = 0;
                connectionMatrix[n * maxCells + threadId] = 0;
                connectionAge[n * maxCells + threadId] = 0;
            }
        }
    }
}