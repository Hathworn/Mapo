#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SumNewCentroidCoordinatesKernel(float *input, int imgWidth, int imgHeight, float *centroidCoordinates, int *nearestCentroid, float *pointsWeight, int inputSize)
{
    // Calculate unique thread ID
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread processes a valid point
    if (threadId < inputSize)
    {
        // Calculate x and y coordinates from thread ID
        int pointX = threadId % imgWidth;
        int pointY = threadId / imgWidth;

        float X = static_cast<float>(pointX);
        float Y = static_cast<float>(pointY);

        int centroidId = nearestCentroid[threadId];

        float weight = input[threadId];

        // Use atomic operations to update shared data
        atomicAdd(&centroidCoordinates[centroidId * 2], weight * X);
        atomicAdd(&centroidCoordinates[centroidId * 2 + 1], weight * Y);
        atomicAdd(&pointsWeight[centroidId], weight);
    }
}