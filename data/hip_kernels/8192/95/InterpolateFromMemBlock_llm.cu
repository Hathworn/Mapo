#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InterpolateFromMemBlock(float* __restrict__ input1, float* __restrict__ input2, float* __restrict__ output, float* __restrict__ weightMemBlock, int inputSize)
{
    // Calculate unique thread ID across grid
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x; 

    // Ensure threadId is within bounds
    if (threadId < inputSize)
    {
        float weight = weightMemBlock[0]; // Cache shared weight to register
        float in1 = input1[threadId];
        float in2 = input2[threadId];

        // Use ternary operator for conditional interpolation
        output[threadId] = (weight <= 0) ? in1 : (weight >= 1) ? in2 : (1 - weight) * in1 + weight * in2;
    }
}