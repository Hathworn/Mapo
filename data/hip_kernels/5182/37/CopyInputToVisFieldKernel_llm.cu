#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CopyInputToVisFieldKernel(float *input, float *visField, int inputSize)
{
    // Compute global thread ID
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds
    if(threadId < inputSize)
    {
        // Directly copy input to visField
        visField[threadId] = input[threadId];
    }
}