#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RemoveEdgesKernel(int *connection, int *age, int maxAge, int *activityFlag, float *winningFraction, int *winningCount, float *utility, float *localError, int *neuronAge, int maxCells)
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x // rows preceding the current row in grid
                 + blockDim.x * blockIdx.x              // blocks preceding current block
                 + threadIdx.x;

    if (threadId < maxCells)
    {
        if (activityFlag[threadId] == 1)
        {
            neuronAge[threadId] += 1;

            int activeConnections = 0;
            for (int c = 0; c < maxCells; c++)
            {
                int connId = threadId * maxCells + c;
                if (connection[connId] == 1)
                {
                    // Simplified conditional check
                    if (age[connId] > maxAge)
                    {
                        connection[connId] = 0;
                        age[connId] = 0;
                    }
                    else
                    {
                        activeConnections++;
                    }
                }
            }

            if (activeConnections == 0)
            {
                activityFlag[threadId] = 0;
                localError[threadId] = 0.00f;
                neuronAge[threadId] = 0;
                winningFraction[threadId] = 0.00f;
                winningCount[threadId] = 0;
                utility[threadId] = 0.00f;
            }
        }
    }
}