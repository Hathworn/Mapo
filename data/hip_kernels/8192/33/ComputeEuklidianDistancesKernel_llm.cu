#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeEuklidianDistancesKernel(float *inputImg, int imgWidth, int imgHeight, float *centroidCoordinates, float *distanceMatrix, int centroids, int inputSize)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Calculate global thread ID

    if (threadId < inputSize)
    {
        int pointX = threadId % imgWidth;
        int pointY = threadId / imgWidth;

        float X = static_cast<float>(pointX);
        float Y = static_cast<float>(pointY);

        for (int c = 0; c < centroids; c++)
        {
            float centroidX = centroidCoordinates[c * 2];
            float centroidY = centroidCoordinates[c * 2 + 1];

            float distX = centroidX - X;
            float distY = centroidY - Y;
            
            // Use a single sqrtf call after the loop
            distanceMatrix[c * inputSize + threadId] = sqrtf(distX * distX + distY * distY);
        }
    }
}