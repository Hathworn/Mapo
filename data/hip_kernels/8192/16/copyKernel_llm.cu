#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copyKernel(float* from, float* to, int size)
{
    // Optimize thread id calculation using 1D grid
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    if (threadId < size)
    {
        to[threadId] = from[threadId];
    }
}