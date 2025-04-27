#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized InvolveVector kernel function
__global__ void InvolveVector(float* input, float* output, int inputSize)
{
    // Calculate global thread ID using a more efficient method
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    if (threadId < inputSize) // Ensure the thread is within bounds
    {
        if (threadId == 0)
        {
            output[0] = input[0]; // Directly set the first element
        }
        else if (threadId < inputSize) // Reverse the rest
        {
            output[threadId] = input[inputSize - threadId];
        }
    }
}