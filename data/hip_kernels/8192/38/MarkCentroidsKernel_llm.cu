#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MarkCentroidsKernel( float *centroidCoordinates, float *visField, int imgWidth, int imgHeight, int centroids )
{
    // Calculate unique thread ID with optimized formula
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockDim.x * blockIdx.y * gridDim.x;
    
    if (threadId < centroids)
    {
        // Load coordinates to local variables for better memory access
        int x = lrintf(centroidCoordinates[threadId * 2]);
        int y = lrintf(centroidCoordinates[threadId * 2 + 1]);

        // Mark centroid in visibility field
        visField[y * imgWidth + x] = -1.00f;
    }
}