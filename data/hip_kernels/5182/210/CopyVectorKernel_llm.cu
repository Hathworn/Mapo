#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyVectorKernel(float *from, int fromOffset, float *to, int toOffset, int vectorSize)
{
    // Calculate the overall thread index directly in the flattened grid
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    if (threadId < vectorSize)
    {
        // Perform the copy operation
        to[threadId + toOffset] = from[threadId + fromOffset];
    }
}