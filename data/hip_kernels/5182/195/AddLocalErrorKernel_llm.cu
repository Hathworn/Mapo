#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddLocalErrorKernel(int s1, float *distance, float *localError)
{
    // Calculate the unique thread index
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Reduce unnecessary computations by removing gridDim.x and blockIdx.y
    if (threadId == 0)
    {
        // Use atomicAdd to ensure correct concurrent writes
        atomicAdd(&localError[s1], distance[s1] * distance[s1]);
    }
}