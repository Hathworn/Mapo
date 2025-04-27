#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InvolveVector(float* input, float* output, int inputSize)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Calculate thread id in a 1D grid

    if(threadId < inputSize - 1)
    {
        output[threadId + 1] = input[inputSize - threadId - 1]; // Reverse the input directly to position
    }

    if(threadId == 0)
    {
        output[0] = input[0];  // Handle first element separately when threadId is 0
    }
}