#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeDistanceKernel(int inputSize, float *distance, float *dimensionWeight, int maxCells, float *difference)
{
    // Calculate threadId using combined y-dimension of blocks
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Check if threadId is within bounds
    if (threadId < maxCells)
    {
        float sum = 0.0f;
        // Cache difference location in shared memory for faster access
        extern __shared__ float sharedDiff[];
        for (int i = threadIdx.x; i < inputSize; i += blockDim.x)
        {
            sharedDiff[i] = difference[threadId * inputSize + i];
        }
        __syncthreads();

        // Compute weighted sum of squared values
        for (int i = 0; i < inputSize; i++)
        {
            float value = sharedDiff[i];
            sum += dimensionWeight[i] * value * value;
        }
        // Update distance array
        distance[threadId] = sqrtf(sum);
    }
}