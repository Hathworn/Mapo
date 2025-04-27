#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assignInitialClusters(int width, int height, int nPixels, int clusterCount, int* cluster, int filterCount, float* responses, int* intResponses) {
    // Calculate unique thread index
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;
    int pixel = y * width + x;
    
    // Ensure thread operates within image bounds
    if ((x < width) && (y < height)) {
        // Precompute block index values to reduce operations
        int xBlockFactor = ((width - 1) / 8 + 1);
        int yBlockFactor = ((height - 1) / 8 + 1);
        int xBlock = x / xBlockFactor;
        int yBlock = y / yBlockFactor;
        
        // Determine assigned cluster for the pixel
        int assignedCluster = yBlock * 8 + xBlock;
        cluster[pixel] = assignedCluster;

        // Process responses in batches using the pixel index
        int baseIndex = pixel;
        for(int i = 0; i < filterCount; i++, baseIndex += nPixels) {
            int response = (int)(INTCONFACTOR * responses[baseIndex]);
            intResponses[baseIndex] = response;
        }
    }
}