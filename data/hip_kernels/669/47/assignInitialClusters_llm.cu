#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assignInitialClusters(int width, int height, int nPixels, int clusterCount, int* cluster, int filterCount, float* responses, int* intResponses) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;
    if (x >= width || y >= height) return;  // Exit early if out of bounds

    int pixel = y * width + x;

    // Precompute block sizes and limit assigned cluster
    int xBlock = x / ((width - 1) / 6 + 1);
    int yBlock = y / ((height - 1) / 6 + 1);
    int assignedCluster = min(yBlock * 6 + xBlock, 31);

    // Assign cluster
    cluster[pixel] = assignedCluster;

    // Optimize loop with SIMD-like pattern
    for (int i = 0; i < filterCount; i++) {
        int index = pixel + i * nPixels;
        intResponses[index] = __float2int_rz(INTCONFACTOR * responses[index]);
    }
}