#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddUtilityKernel(int s1, int s2, float *distance, float *utility)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation

    if(threadId == 0) // Only the first thread performs the operation
    {
        utility[s1] += distance[s2] - distance[s1];
    }
}