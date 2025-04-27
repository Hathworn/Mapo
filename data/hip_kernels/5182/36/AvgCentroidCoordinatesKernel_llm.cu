#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AvgCentroidCoordinatesKernel(float *centroidCoordinates, float *pointsWeight, int inputSize, int centroids)
{
    // Calculate global thread index in a simplified way using blockIdx.z dimension
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (threadId < centroids * 2)  // Process only valid threads
    {
        float weight = pointsWeight[threadId / 2];
        // Use ternary for conditional check and assignment
        centroidCoordinates[threadId] = (weight == 0.00f) ? 0.00f : centroidCoordinates[threadId] / weight;
    }
}