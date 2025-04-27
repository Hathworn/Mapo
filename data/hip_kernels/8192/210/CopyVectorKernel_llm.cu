#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyVectorKernel(float *from, int fromOffset, float *to, int toOffset, int vectorSize)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;  // Flattening 2D grid into 1D index

    if (threadId < vectorSize)
    {
        to[threadId + toOffset] = from[threadId + fromOffset];
    }
}