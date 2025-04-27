#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DecreaseErrorAndUtilityKernel(float *localError, float *utility, int *activityFlag, int maxCells, float beta)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Calculate thread ID

    // Ensure threadId is within bounds and active
    if(threadId < maxCells && activityFlag[threadId] == 1)
    {
        float error = localError[threadId];
        float util = utility[threadId];
        
        // Update values with reduced memory accesses
        localError[threadId] = error - beta * error;
        utility[threadId] = util - beta * util;
    }
}