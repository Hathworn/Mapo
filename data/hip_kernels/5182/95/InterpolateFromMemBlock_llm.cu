#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InterpolateFromMemBlock(float* input1, float* input2, float* output, float* weightMemBlock, int inputSize)
{
    // Calculate the unique thread index
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Load weightMemBlock value once into a register
    float weight = weightMemBlock[0];
    
    if(threadId < inputSize)
    {
        if (weight <= 0) 
        {
            output[threadId] = input1[threadId];
        }
        else if (weight >= 1) 
        {
            output[threadId] = input2[threadId];
        }
        else 
        {
            output[threadId] = (1 - weight) * input1[threadId] + weight * input2[threadId];
        }
    }
}