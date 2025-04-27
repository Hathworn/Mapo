#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized Interpolate kernel function
__global__ void Interpolate(float* input1, float* input2, float* output, float weight, int inputSize)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Calculate thread ID

    // Ensure thread is within bounds
    if (threadId < inputSize)
    {
        // Precompute weight coefficients
        float weight1 = 1.0f - weight;
        float weight2 = weight;

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
            // Perform interpolation with precomputed weights
            output[threadId] = weight1 * input1[threadId] + weight2 * input2[threadId];
        }
    }
}