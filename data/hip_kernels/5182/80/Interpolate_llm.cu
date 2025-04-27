#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Interpolate(float* input1, float* input2, float* output, float weight, int inputSize)
{
    // Optimize thread index calculation using flattening approach
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread executes only if within bounds
    if(threadId < inputSize)
    {
        // Use conditional operator for more concise logic
        output[threadId] = (weight <= 0) ? input1[threadId] :
                           (weight >= 1) ? input2[threadId] :
                           (1 - weight) * input1[threadId] + weight * input2[threadId];
    }
}