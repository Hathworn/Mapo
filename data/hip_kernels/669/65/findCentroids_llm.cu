#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroids(int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount) {
    __shared__ int localMasses[64 * 17];
    __shared__ unsigned int localCounts[64];
    int pixel = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize shared memory in parallel
    for (int i = threadIdx.x; i < 64 * 17; i += blockDim.x) {
        localMasses[i] = 0;
    }
    for (int i = threadIdx.x; i < 64; i += blockDim.x) {
        localCounts[i] = 0;
    }
    __syncthreads();

    if (pixel < nPixels) {
        int myCluster = cluster[pixel];
        int myIndex = pixel;
        
        // Process first set of filters
        for (int filter = 0; filter < 17; filter++) {
            int myElement = responses[myIndex];
            atomicAdd(localMasses + filter * 64 + myCluster, myElement);
            myIndex += nPixels;
        }
    }
    __syncthreads();

    // Reduce localMasses and reset them
    for (int i = threadIdx.x; i < 64 * 17; i += blockDim.x) {
        atomicAdd(centroidMass + i, localMasses[i]);
        localMasses[i] = 0;
    }
    __syncthreads();

    if (pixel < nPixels) {
        int myCluster = cluster[pixel];
        int myIndex = pixel + nPixels * 17;

        // Process second set of filters
        for (int filter = 17; filter < 34; filter++) {
            int myElement = responses[myIndex];
            atomicAdd(localMasses + filter * 64 + myCluster, myElement);
            myIndex += nPixels;
        }
        atomicInc(localCounts + myCluster, 100000000);
    }
    __syncthreads();

    // Reduce localMasses and localCounts
    for (int i = threadIdx.x; i < 64 * 17; i += blockDim.x) {
        if (i < 64 * (34 - 17)) {
            atomicAdd(centroidMass + i + 64 * 17, localMasses[i + 64 * 17]);
        }
    }

    for (int i = threadIdx.x; i < 64; i += blockDim.x) {
        atomicAdd(centroidCount + i, localCounts[i]);
    }
}