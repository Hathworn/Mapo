#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findDiffLabels(float* devDiff, int diffPitchInFloats, int nPoints, int nClusters, int* devClusters, int* devChanges) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    __shared__ unsigned int localChanges;
    
    // Initialize shared variable only once per block
    if (threadIdx.x == 0) {
        localChanges = 0;
    }
    __syncthreads();

    if (x < nPoints) {
        int index = x;
        float minDistance = FLT_MAX; // Use FLT_MAX for clearer intent
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
        devClusters[x] = minCluster;

        // Use atomicAdd for changes, more efficient in context
        if (minCluster != previousCluster) {
            atomicAdd(&localChanges, 1);
        }
    }
    __syncthreads();

    // Reduce local changes from all threads to a single global change
    if (threadIdx.x == 0) {
        atomicAdd(devChanges, localChanges);
    }
}