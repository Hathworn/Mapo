#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findDiffLabelsAtomicFree(float* devDiff, int diffPitchInFloats, int nPoints, int nClusters, int* devClusters, int* devChanges) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;

    if (x < nPoints) {
        int index = x;
        float minDistance = 1e10f;  // Initialize with a large float value
        int minCluster = -1;

        // Unrolling the loop, assuming nClusters is a small constant
        for (int cluster = 0; cluster < nClusters; ++cluster) {
            float clusterDistance = devDiff[index];
            if (clusterDistance < minDistance) {
                minDistance = clusterDistance;
                minCluster = cluster;
            }
            index += diffPitchInFloats;
        }

        int previousCluster = devClusters[x];
        devClusters[x] = minCluster;

        // Using atomic operation to update devChanges safely
        if (minCluster != previousCluster) {
            atomicAdd(devChanges, 1);
        }
    }
}