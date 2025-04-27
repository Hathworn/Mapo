#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SumNewCentroidCoordinatesKernel(float *input, int imgWidth, int imgHeight, float *centroidCoordinates, int *nearestCentroid, float *pointsWeight, int inputSize)
{
    int threadId = blockDim.x * blockIdx.x + threadIdx.x; // Calculate thread ID within the grid

    if(threadId < inputSize)
    {
        int pointX = threadId % imgWidth;
        int pointY = threadId / imgWidth;

        float X = static_cast<float>(pointX);
        float Y = static_cast<float>(pointY);

        int centroidId = nearestCentroid[threadId];

        float weight = input[threadId];

        // Use shared memory to reduce atomic operations
        __shared__ float sharedCentroidCoords[2];
        __shared__ float sharedPointsWeight;

        if (threadIdx.x == 0) {
            sharedCentroidCoords[0] = 0.0f;
            sharedCentroidCoords[1] = 0.0f;
            sharedPointsWeight = 0.0f;
        }
        __syncthreads();

        // Accumulate the values in shared memory
        atomicAdd(&sharedCentroidCoords[0], weight * X);
        atomicAdd(&sharedCentroidCoords[1], weight * Y);
        atomicAdd(&sharedPointsWeight, weight);
        __syncthreads();

        // Only one thread writes back the accumulated results to global memory
        if (threadIdx.x == 0) {
            atomicAdd(&centroidCoordinates[centroidId * 2], sharedCentroidCoords[0]);
            atomicAdd(&centroidCoordinates[centroidId * 2 + 1], sharedCentroidCoords[1]);
            atomicAdd(&pointsWeight[centroidId], sharedPointsWeight);
        }
    }
}