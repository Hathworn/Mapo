#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assignInitialClusters_64(int width, int height, int nPixels, int clusterCount, int* cluster, int filterCount, float* responses, int* intResponses) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;
    int pixel = y * width + x;
    
    if ((x < width) && (y < height)) {
        // Precompute divisions to minimize repeated calculations
        int widthBlockSize = (width - 1) / 8 + 1;
        int heightBlockSize = (height - 1) / 8 + 1;
        
        int xBlock = x / widthBlockSize;
        int yBlock = y / heightBlockSize;
        int assignedCluster = yBlock * 8 + xBlock;
        
        cluster[pixel] = assignedCluster;
        
        int factor = INTCONFACTOR;  // Store constant in a register
        for(int i = 0; i < filterCount; i++) {
            int index = pixel + i * nPixels;
            int response = __float2int_rn(factor * responses[index]);  // Use intrinsic for floating-point to integer conversion
            intResponses[index] = response;
        }
    }
}