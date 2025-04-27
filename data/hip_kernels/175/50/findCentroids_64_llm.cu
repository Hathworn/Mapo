#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroids_64(int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount) {
    __shared__ int localMasses[64 * 17];
    __shared__ unsigned int localCounts[64];
    int pixel = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use block-wide synchronization
    for (int i = threadIdx.x; i < 64 * 17; i += blockDim.x) {
        localMasses[i] = 0;
    }
    if (threadIdx.x < 64) {
        localCounts[threadIdx.x] = 0;
    }
    __syncthreads();
    
    // Process pixels and accumulate local masses
    if (pixel < nPixels) {
        int myCluster = cluster[pixel];
        int myIndex = pixel;
        for (int filter = 0; filter < 17; filter++) {
            int myElement = responses[myIndex];
            atomicAdd(localMasses + filter * 64 + myCluster, myElement);
            myIndex += nPixels;
        }
    }
    __syncthreads();
    
    // Aggregate to global centroid masses
    for (int i = threadIdx.x; i < 64 * 17; i += blockDim.x) {
        atomicAdd(centroidMass + i, localMasses[i]);
    }

    // Process for second set of filters
    __syncthreads();
    if (pixel < nPixels) {
        int myCluster = cluster[pixel];
        int myIndex = pixel + nPixels * 17;
        for (int filter = 0; filter < 17; filter++) {
            int myElement = responses[myIndex];
            atomicAdd(localMasses + filter * 64 + myCluster, myElement);
            myIndex += nPixels;
        }
        atomicInc(localCounts + myCluster, 0xFFFFFFFF);
    }
    __syncthreads();
    
    // Aggregate results for second set of filters
    for (int filter = threadIdx.x; filter < 34 * 64; filter += blockDim.x) {
        if (filter < 17 * 64) {
            atomicAdd(centroidMass + 64 * 17 + filter, localMasses[filter]);
        }
        if (filter < 64) {
            atomicAdd(centroidCount + filter, localCounts[filter]);
        }
    }
}