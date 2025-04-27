#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assignInitialClusters(int width, int height, int nPixels, int clusterCount, int* cluster, int filterCount, float* responses, int* intResponses) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Check if thread is within bounds
    if ((x < width) && (y < height)) {
        int pixel = y * width + x;
        int xBlock = x / ((width - 1) / 8 + 1);
        int yBlock = y / ((height - 1) / 8 + 1);
        int assignedCluster = yBlock * 8 + xBlock;

        cluster[pixel] = assignedCluster;  // Use pixel index directly

        // Unroll the loop for better performance
        #pragma unroll
        for(int i = 0; i < filterCount; i++) {
            int index = pixel + i * nPixels;
            intResponses[index] = static_cast<int>(INTCONFACTOR * responses[index]);
        }
    }
}