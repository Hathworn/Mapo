#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AddLocalErrorKernel( int s1, float *distance, float *localError )
{
    // Calculate the global thread index
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Only one thread contributes to updating localError[s1]
    if (threadId == 0)
    {
        atomicAdd(&localError[s1], distance[s1] * distance[s1]);  // Use atomicAdd for safe concurrent updates
    }
}