#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyInputToVisFieldKernel(float *input, float *visField, int inputSize)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Simplified thread ID calculation

    if (threadId < inputSize) 
    {
        visField[threadId] = input[threadId]; // Directly copy input to visField
    }
}