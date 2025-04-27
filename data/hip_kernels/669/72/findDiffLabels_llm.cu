#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void findDiffLabels(float* devDiff, int diffPitchInFloats, int nPoints, int nClusters, int* devClusters, int* devChanges) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    __shared__ unsigned int localChanges;

    // Initialize shared memory once per block for safety
    if (threadIdx.x == 0) localChanges = 0;
    __syncthreads();

    if (x < nPoints) {
        int index = x;
        float minDistance = 1.0e20f; // Use a large constant for initialization
        int minCluster = -1;

        // Use registers for minDistance and minCluster for faster access
        for (int cluster = 0; cluster < nClusters; cluster++) {
            float clusterDistance = devDiff[index];
            if (clusterDistance < minDistance) {
                minDistance = clusterDistance;
                minCluster = cluster;
            }
            index += diffPitchInFloats;
        }

        int previousCluster = devClusters[x];
        devClusters[x] = minCluster;

        // Use atomicAdd for consistent updates and limit atomic operations
        if (minCluster != previousCluster) {
            atomicAdd(&localChanges, 1);
        }
    }
    __syncthreads();

    // Combine localChanges to devChanges in a single atomicAdd
    if (threadIdx.x == 0) {
        atomicAdd(devChanges, localChanges);
    }
}