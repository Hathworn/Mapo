#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findDiffLabelsAtomicFree(float* devDiff, int diffPitchInFloats, int nPoints, int nClusters, int* devClusters, int* devChanges) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    if (x < nPoints) {
        int index = x;
        float minDistance = 10000000;
        int minCluster = -1;
        for(int cluster = 0; cluster < nClusters; cluster++) {
            float clusterDistance = devDiff[index];
            if (clusterDistance < minDistance) {
                minDistance = clusterDistance;
                minCluster = cluster;
            }
            index += diffPitchInFloats;
        }
        int previousCluster = devClusters[x];
        if (minCluster != previousCluster) {
            devClusters[x] = minCluster;
            
            // Atomic operation to avoid race condition
            atomicAdd(devChanges, 1);
        }
    }
}