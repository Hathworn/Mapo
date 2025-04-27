#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void updateCenters(float *centers, float *images, int *updates, int noClusters)
{
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    int imageSize = 784;
    int imagesOffset = gid * imageSize;

    float minValue = FLT_MAX; // Use FLT_MAX for better clarity
    int minCenterIndex = -1;
    
    // Load image data into shared memory to optimize access speed
    __shared__ float pImage[784]; 
    if (threadIdx.x < imageSize) {
        pImage[threadIdx.x] = images[imagesOffset + threadIdx.x];
    }
    __syncthreads();

    for (int centersIndex = 0; centersIndex < noClusters; centersIndex++)
    {
        float sum = 0.0f;
        for (int index = 0; index < imageSize; index++)
        {
            // Calculate squared distance
            float diff = centers[centersIndex * imageSize + index] - pImage[index];
            sum += diff * diff;
        }
        // Find the minimum squared distance
        if (sum < minValue)
        {
            minValue = sum;
            minCenterIndex = centersIndex;
        }
    }
    updates[gid] = minCenterIndex;
}