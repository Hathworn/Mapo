#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void findDiffLabelsAtomicFree(float* devDiff, int diffPitchInFloats, int nPoints, int nClusters, int* devClusters, int* devChanges) {

    int x = blockDim.x * blockIdx.x + threadIdx.x;
    if (x < nPoints) {
        int index = x;
        float minDistance = 10000000;
        int minCluster = -1;

        // Optimize loop by using float* to traverse devDiff
        float* clusterDistancePtr = &devDiff[x];
        for(int cluster = 0; cluster < nClusters; cluster++) {
            float clusterDistance = *clusterDistancePtr;  // Directly access via pointer
            if (clusterDistance < minDistance) {
                minDistance = clusterDistance;
                minCluster = cluster;
            }
            clusterDistancePtr += diffPitchInFloats;  // Use pointer arithmetic for next cluster
        }

        int previousCluster = devClusters[x];
        devClusters[x] = minCluster;
        
        // Use atomicAdd to safely update devChanges without race conditions
        if (minCluster != previousCluster) {
            atomicAdd(devChanges, 1);
        }
    }
}