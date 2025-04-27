#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetForcesToZeroKernel(float *force, int maxCells)
{
    // Calculate global thread index more efficiently
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (threadId < maxCells * 3)
    {
        force[threadId] = 0.00f;
    }
}