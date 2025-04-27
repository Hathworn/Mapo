#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copyKernel(float* from, float* to, int size)
{
    // Calculate threadId more efficiently using combined block indexing
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.x * gridDim.x);

    if(threadId < size)
    {
        // Utilize coalesced memory access for better performance
        to[threadId] = from[threadId];
    }
}