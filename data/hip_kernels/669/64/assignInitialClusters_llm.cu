#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assignInitialClusters(int width, int height, int nPixels, int clusterCount, int* cluster, int filterCount, float* responses, int* intResponses) {
    // Calculate global thread coordinates
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Calculate pixel index
    int pixel = y * width + x;

    // Check if within image bounds
    if ((x < width) && (y < height)) {
        // Precompute division factors
        int widthFactor = (width - 1) / 8 + 1;
        int heightFactor = (height - 1) / 8 + 1;
        
        // Optimization: Precompute division results
        int xBlock = x / widthFactor;
        int yBlock = y / heightFactor;
        
        // Assign cluster based on block coordinates
        int assignedCluster = yBlock * 8 + xBlock;
        cluster[pixel] = assignedCluster;
        
        // Conversion of responses in parallel manner
        for(int i = 0; i < filterCount; i++) {
            int index = pixel + i * nPixels;
            intResponses[index] = static_cast<int>(INTCONFACTOR * responses[index]);
        }
    }
}