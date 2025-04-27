#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddUtilityKernel(int s1, int s2, float *distance, float *utility)
{
    // Calculate unique thread index using optimized constants
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    if (threadId < 1)
    {
        // Perform atomic addition to prevent race conditions
        atomicAdd(&utility[s1], distance[s2] - distance[s1]);
    }
}