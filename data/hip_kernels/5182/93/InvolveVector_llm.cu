#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InvolveVector(float* input, float* output, int inputSize)
{
    // Calculate a global thread index
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread index is within the valid range
    if(threadId < inputSize)
    {
        output[threadId] = input[inputSize - threadId - 1];
    }
}