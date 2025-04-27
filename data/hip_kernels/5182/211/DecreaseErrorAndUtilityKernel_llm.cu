#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DecreaseErrorAndUtilityKernel(float *localError, float *utility, int *activityFlag, int maxCells, float beta)
{
    // Calculate global threadId
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Ensure threadId is within valid range
    if(threadId < maxCells)
    {
        if(activityFlag[threadId] == 1)
        {
            // Update localError and utility using fused multiply-add for efficiency
            localError[threadId] = __fmaf_rn(-beta, localError[threadId], localError[threadId]);
            utility[threadId] = __fmaf_rn(-beta, utility[threadId], utility[threadId]);
        }
    }
}