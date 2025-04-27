#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RemoveNodeByUtilityKernel(int *connectionMatrix, int *connectionAge, int *activityFlag, float *utility, float utilityConstant, float *localError, int *neuronAge, float *winningFraction, int *winningCount, float maxError, int maxCells)
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x  // calculate global thread id
                + blockDim.x * blockIdx.x
                + threadIdx.x;

    // Check if threadId is within valid range
    if (threadId < maxCells)
    {
        // Check if current node is active
        if (activityFlag[threadId] == 1 && utility[threadId] > 0.00f)
        {
            // Check condition to remove node by utility
            if (maxError / utility[threadId] > utilityConstant)
            {
                activityFlag[threadId] = 0;
                localError[threadId] = 0.00f;
                neuronAge[threadId] = 0;
                winningFraction[threadId] = 0.00f;
                winningCount[threadId] = 0;
                utility[threadId] = 0.00f;

                // Unroll loop for performance
                #pragma unroll
                for (int n = 0; n < maxCells; n++)
                {
                    connectionMatrix[threadId * maxCells + n] = 0;
                    connectionAge[threadId * maxCells + n] = 0;
                    connectionMatrix[n * maxCells + threadId] = 0;
                    connectionAge[n * maxCells + threadId] = 0;
                }
            }
        }
    }
}