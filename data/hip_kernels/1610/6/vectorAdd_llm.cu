#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(int numElements, float *x, float *y)
{
    // Compute global index once
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure memory coalescing and avoid branching
    if (i < numElements)
    {
        y[i] += x[i];
    }
}