#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findDiffLabelsAtomicFree(float* devDiff, int diffPitchInFloats, int nPoints, int nClusters, int* devClusters, int* devChanges) {
    // Calculate global thread index
    int x = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if thread index is within range of points
    if (x < nPoints) {
        int index = x;
        float minDistance = FLT_MAX; // Use constant for clarity
        int minCluster = -1;

        // Unroll loop to improve performance if nClusters is small and known
        for (int cluster = 0; cluster < nClusters; ++cluster) {
            float clusterDistance = devDiff[index];
            if (clusterDistance < minDistance) {
                minDistance = clusterDistance;
                minCluster = cluster;
            }
            index += diffPitchInFloats;
        }

        // Update clusters and calculate changes
        int previousCluster = devClusters[x];
        devClusters[x] = minCluster;
        if (minCluster != previousCluster) {
            atomicAdd(devChanges, 1); // Use atomicAdd for thread safety
        }
    }
}