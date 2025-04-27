#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeDistanceKernel(int inputSize, float *distance, float *dimensionWeight, int maxCells, float *difference)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread ID calculation

    if (threadId < maxCells)
    {
        float sum = 0.0f;
        for (int i = 0; i < inputSize; ++i)
        {
            float value = difference[threadId * inputSize + i];
            sum += dimensionWeight[i] * value * value;
        }
        distance[threadId] = sqrtf(sum);
    }
}