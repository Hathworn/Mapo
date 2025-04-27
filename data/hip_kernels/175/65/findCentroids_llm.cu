#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroids(int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount) {
    __shared__ int localMasses[64*34]; // Allocate enough shared memory for all filters in one array
    __shared__ unsigned int localCounts[64];

    int pixel = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize localMasses and localCounts using a single loop
    for (int i = threadIdx.x; i < 64*34; i += blockDim.x) {
        localMasses[i] = 0;
    }
    if (threadIdx.x < 64) {
        localCounts[threadIdx.x] = 0;
    }
    __syncthreads();

    // Combine two separate loops over responses into one
    if (pixel < nPixels) {
        int myCluster = cluster[pixel];
        int myIndex = pixel;
        for (int filter = 0; filter < 34; filter++) {
            int myElement = responses[myIndex];
            atomicAdd(localMasses + filter * 64 + myCluster, myElement);
            myIndex += nPixels;
        }
        atomicInc(localCounts + myCluster, 100000000);
    }
    __syncthreads();

    // Combine two separate loops for updating centroidMass into one
    if (threadIdx.x < 64) {
        for (int filter = 0; filter < 34; filter++) {
            atomicAdd(centroidMass + filter * 64 + threadIdx.x, localMasses[threadIdx.x + filter * 64]);
        }
        atomicAdd(centroidCount + threadIdx.x, localCounts[threadIdx.x]);
    }
}