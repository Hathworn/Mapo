#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MarkCentroidsKernel(float *centroidCoordinates, float *visField, int imgWidth, int imgHeight, int centroids)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread ID
    if (threadId < centroids) {
        int x = lrintf(centroidCoordinates[threadId * 2]);
        int y = lrintf(centroidCoordinates[threadId * 2 + 1]);

        if (x >= 0 && x < imgWidth && y >= 0 && y < imgHeight) { // Ensure coordinates are within bounds
            visField[y * imgWidth + x] = -1.00f;
        }
    }
}