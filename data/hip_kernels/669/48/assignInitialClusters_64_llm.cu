#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assignInitialClusters_64(int width, int height, int nPixels, int clusterCount, int* cluster, int filterCount, float* responses, int* intResponses) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;
    int pixel = y * width + x;

    // Check bounds
    if ((x < width) && (y < height)) {
        // Use more efficient division
        int xBlock = __float2int_rd((float)x * 8.0f / width);
        int yBlock = __float2int_rd((float)y * 8.0f / height); 
        int assignedCluster = yBlock * 8 + xBlock;

        cluster[pixel] = assignedCluster;

        // Unroll the loop for better performance
        for (int i = 0; i < filterCount; i++) {
            int index = pixel + i * nPixels;
            int response = __fmul_rd(INTCONFACTOR, responses[index]);
            intResponses[index] = response;
        }
    }
}