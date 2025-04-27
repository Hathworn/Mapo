#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for better performance
__global__ void findDiffLabelsAtomicFree(float* devDiff, int diffPitchInFloats, int nPoints, int nClusters, int* devClusters, int* devChanges) {

    // Calculate global index
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    if (x < nPoints) {
        int index = x;
        float minDistance = FLT_MAX;  // Use proper maximum for float
        int minCluster = -1;

        // Iterate through clusters to find the closest
        for(int cluster = 0; cluster < nClusters; cluster++) {
            float clusterDistance = devDiff[index];
            if (clusterDistance < minDistance) {
                minDistance = clusterDistance;
                minCluster = cluster;
            }
            index += diffPitchInFloats;
        }

        int previousCluster = devClusters[x];
        if (minCluster != previousCluster) {  // Update only if there's a change
            devClusters[x] = minCluster;
            atomicAdd(devChanges, 1);  // Safely increment changes using atomic
        }
    }
}