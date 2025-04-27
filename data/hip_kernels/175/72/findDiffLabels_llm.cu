#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findDiffLabels(float* devDiff, int diffPitchInFloats, int nPoints, int nClusters, int* devClusters, int* devChanges) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    __shared__ unsigned int localChanges;
    
    // Initialize shared memory counter to 0
    if (threadIdx.x == 0) {
        localChanges = 0;
    }
    __syncthreads();

    if (x < nPoints) {
        int index = x;
        float minDistance = 1e20f; // Use a more precise representation for large numbers
        int minCluster = -1;
        
        // Iterate over clusters to find the closest one
        for (int cluster = 0; cluster < nClusters; cluster++) {
            float clusterDistance = devDiff[index];
            if (clusterDistance < minDistance) {
                minDistance = clusterDistance;
                minCluster = cluster;
            }
            index += diffPitchInFloats;
        }

        // Update the cluster assignment
        int previousCluster = devClusters[x];
        devClusters[x] = minCluster;
        
        // Atomically increment if there was a change in cluster assignment
        if (minCluster != previousCluster) {
            atomicAdd(&localChanges, 1);
        }
    }
    
    __syncthreads();
    
    // Accumulate changes from all threads in the block
    if (threadIdx.x == 0) {
        atomicAdd(devChanges, localChanges);
    }
}