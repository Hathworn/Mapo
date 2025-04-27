#include "hip/hip_runtime.h"
#include "includes.h"

// Block and thread indexing optimization
__global__ void InitCentroidsKernel(float *centroidCoordinates, float *randomNumbers, float minX, float maxX, float minY, float maxY, int centroids) {
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threadId is within bounds
    if (threadId < centroids) {
        centroidCoordinates[threadId * 2] = (maxX - minX) * randomNumbers[threadId * 2] + minX;
        centroidCoordinates[threadId * 2 + 1] = (maxY - minY) * randomNumbers[threadId * 2 + 1] + minY;
    }
}