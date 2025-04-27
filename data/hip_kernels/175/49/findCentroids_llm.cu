#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroids(int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount) {
    __shared__ int localMasses[32*17];
    __shared__ unsigned int localCounts[32];

    int pixel = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize shared memory
    for (int i = threadIdx.x; i < 32; i += blockDim.x) {
        for (int j = 0; j < 17; j++) {
            localMasses[32 * j + i] = 0;
        }
        localCounts[i] = 0;
    }
    __syncthreads();

    if (pixel < nPixels) {
        int myCluster = cluster[pixel];
        int myIndex = pixel;

        // Accumulate mass for the first half
        for (int filter = 0; filter < 17; filter++) {
            int myElement = responses[myIndex];
            atomicAdd(localMasses + filter * 32 + myCluster, myElement);
            myIndex += nPixels;
        }
    }
    __syncthreads();

    // Update global centroid values for the first half
    for (int i = threadIdx.x; i < 32; i += blockDim.x) {
        for (int filter = 0; filter < 17; filter++) {
            atomicAdd(centroidMass + filter * 32 + i, localMasses[i + filter * 32]);
        }
    }
    __syncthreads();

    if (pixel < nPixels) {
        int myCluster = cluster[pixel];
        int myIndex = pixel + nPixels*17;

        // Accumulate mass for the second half
        for (int filter = 0; filter < 17; filter++) {
            int myElement = responses[myIndex];
            atomicAdd(localMasses + filter * 32 + myCluster, myElement);
            myIndex += nPixels;
        }
        atomicInc(localCounts + myCluster, 100000000);
    }
    __syncthreads();

    // Update global centroid values and counts for the second half
    for (int i = threadIdx.x; i < 32; i += blockDim.x) {
        for (int filter = 17; filter < 34; filter++) {
            atomicAdd(centroidMass + filter * 32 + i, localMasses[i + (filter - 17) * 32]);
        }
        atomicAdd(centroidCount + i, localCounts[i]);
    }
}