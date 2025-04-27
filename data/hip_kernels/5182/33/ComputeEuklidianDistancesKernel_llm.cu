#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeEuklidianDistancesKernel(float *inputImg, int imgWidth, int imgHeight, float *centroidCoordinates, float *distanceMatrix, int centroids, int inputSize)
{
    int threadId = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Ensure threadId is within bounds
    if (threadId < inputSize)
    {
        int pointX = threadId % imgWidth;
        int pointY = threadId / imgWidth;

        float X = static_cast<float>(pointX);
        float Y = static_cast<float>(pointY);

        for (int c = 0; c < centroids; c++)
        {
            // Improved memory access pattern for centroid coordinates
            float centroidX = __ldg(&centroidCoordinates[c * 2]);
            float centroidY = __ldg(&centroidCoordinates[c * 2 + 1]);

            float dist = sqrtf((centroidX - X) * (centroidX - X) + (centroidY - Y) * (centroidY - Y));
            // Coalesced memory write to the distance matrix
            distanceMatrix[c * inputSize + threadId] = dist;
        }
    }
}