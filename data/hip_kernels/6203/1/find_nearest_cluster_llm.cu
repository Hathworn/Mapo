#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline static float euclid_distance(int numCoords, int tid, int clusterId, float *objects, float *clusters)
{
    float ans = 0.0;
    for (int i = 0; i < numCoords; i++) {
        float diff = objects[tid * numCoords + i] - clusters[clusterId * numCoords + i];
        ans += diff * diff; // Combine subtraction and multiplication
    }
    return ans;
}

__global__ static void find_nearest_cluster(int numCoords, int numObjs, int numClusters, float *objects, float *deviceClusters, int *membership, int *changedmembership)
{
    extern __shared__ float sharedMem[];
    // Shared memory for clusters and objects
    float *sh_Clusters = sharedMem;
    
    // Copy clusters into shared memory
    int idx = threadIdx.x;
    int elemsPerCluster = numCoords;
    while (idx < numClusters * elemsPerCluster) {
        sh_Clusters[idx] = deviceClusters[idx];
        idx += blockDim.x;
    }
    __syncthreads();

    unsigned int tid = threadIdx.x;
    int objectId = blockDim.x * blockIdx.x + tid;

    while (objectId < numObjs) {
        int index = 0;
        float min_dist = euclid_distance(numCoords, tid, 0, &objects[objectId * numCoords], sh_Clusters);

        for (int i = 1; i < numClusters; i++) {
            float dist = euclid_distance(numCoords, tid, i, &objects[objectId * numCoords], sh_Clusters);
            if (dist < min_dist) {
                min_dist = dist;
                index = i;
            }
        }

        if (membership[objectId] != index) {
            changedmembership[objectId] = 1;
            membership[objectId] = index;
        }

        objectId += blockDim.x * gridDim.x;
    }
}