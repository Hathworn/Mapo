#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void findCentroids(int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount) {
    __shared__ int localMasses[32*17];
    __shared__ unsigned int localCounts[32];
    int pixel = blockDim.x * blockIdx.x + threadIdx.x;

    if (threadIdx.x < 32) {
        // Initialize shared memory
        for (int i = 0; i < 17; i++) {
            localMasses[32 * i + threadIdx.x] = 0;
        }
        localCounts[threadIdx.x] = 0;
    }
    __syncthreads();

    if (pixel < nPixels) {
        int myCluster = cluster[pixel];
        int myIndex = pixel;
        // Accumulate local masses
        for(int filter = 0; filter < 17; filter++) {
            int myElement = responses[myIndex];
            atomicAdd(localMasses + filter * 32 + myCluster, myElement);
            myIndex += nPixels;
        }
        // Increment local counts
        atomicAdd(&localCounts[myCluster], 1);
    }
    __syncthreads();

    if (threadIdx.x < 32) {
        // Update global centroid masses
        for (int filter = 0; filter < 17; filter++) {
            atomicAdd(centroidMass + filter * 32 + threadIdx.x, localMasses[threadIdx.x + filter * 32]);
        }
        // Reset shared memory for second phase
        for (int i = 0; i < 17; i++) {
            localMasses[32 * i + threadIdx.x] = 0;
        }
    }
    __syncthreads();

    if (pixel < nPixels) {
        int myCluster = cluster[pixel];
        int myIndex = pixel + nPixels * 17;
        // Accumulate additional responses
        for(int filter = 0; filter < 17; filter++) {
            int myElement = responses[myIndex];
            atomicAdd(localMasses + filter * 32 + myCluster, myElement);
            myIndex += nPixels;
        }
    }
    __syncthreads();

    if (threadIdx.x < 32) {
        // Update global centroid masses with second set
        for (int filter = 17; filter < 34; filter++) {
            atomicAdd(centroidMass + filter * 32 + threadIdx.x, localMasses[threadIdx.x + (filter - 17) * 32]);
        }
        // Update global centroid counts
        atomicAdd(centroidCount + threadIdx.x, localCounts[threadIdx.x]);
    }
}