#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InvolveVector(float* input, float* output, int inputSize)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Use a single thread to copy the first element outside of the loop
    if (threadId == 0) 
    {
        output[0] = input[0];
    }

    // Reverse input into output using multiple threads efficiently
    if (threadId < inputSize - 1) 
    {
        output[threadId + 1] = input[inputSize - threadId - 1];
    }
}