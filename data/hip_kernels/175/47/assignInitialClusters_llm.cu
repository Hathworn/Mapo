#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assignInitialClusters(int width, int height, int nPixels, int clusterCount, int* cluster, int filterCount, float* responses, int* intResponses) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;
    int pixel = y * width + x;

    // Ensure threads operate only on valid image coordinates
    if (x < width && y < height) {
        // Precompute block size values to simplify expressions
        int xBlock = x / ((width - 1) / 6 + 1);
        int yBlock = y / ((height - 1) / 6 + 1);
        
        int assignedCluster = yBlock * 6 + xBlock;

        // Clamp the assigned cluster to a maximum of 31
        assignedCluster = min(assignedCluster, 31);

        cluster[y * width + x] = assignedCluster;

        // Loop unrolling might improve performance, enable compile-time unrolling 
        #pragma unroll
        for (int i = 0; i < filterCount; i++) {
            int index = pixel + i * nPixels;
            int response = static_cast<int>(INTCONFACTOR * responses[index]);
            intResponses[index] = response;
        }
    }
}