#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InitCentroidsKernel(float *centroidCoordinates, float *randomNumbers, float minX, float maxX, float minY, float maxY, int centroids)
{
    // Calculate the global thread ID more efficiently
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only if the threadId is within valid range
    if (threadId < centroids)
    {
        // Compute the x and y coordinates for the centroids
        int index = threadId * 2; // Reduce redundant calculations
        centroidCoordinates[index] = (maxX - minX) * randomNumbers[index] + minX;
        centroidCoordinates[index + 1] = (maxY - minY) * randomNumbers[index + 1] + minY;
    }
}