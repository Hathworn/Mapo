#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Interpolate(float* input1, float* input2, float* output, float weight, int inputSize)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread ID calculation

    if(threadId < inputSize)
    {
        float value1 = input1[threadId];
        float value2 = input2[threadId];

        // Use ternary operators to streamline conditional logic
        output[threadId] = (weight <= 0) ? value1 : ((weight >= 1) ? value2 : ((1 - weight) * value1 + weight * value2));
    }
}