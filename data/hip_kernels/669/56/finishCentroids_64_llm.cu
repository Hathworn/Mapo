#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void finishCentroids_64(int* centroidMass, unsigned int* centroidCount, float* centroids) {
    // Calculate linear index for threads in grid
    int centroidNumber = blockIdx.y * blockDim.y + threadIdx.y;
    int dimensionNumber = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to minimize global memory access
    __shared__ unsigned int sharedCentroidCount[64];
    if (threadIdx.x == 0 && centroidNumber < 64) {
        sharedCentroidCount[centroidNumber] = centroidCount[centroidNumber];
    }
    __syncthreads();

    // Process only if within bounds
    if (centroidNumber < 64 && dimensionNumber < 34) {
        float totalCount = (float)sharedCentroidCount[centroidNumber];
        float mass = (float)centroidMass[dimensionNumber * 64 + centroidNumber];

        // Calculate and store result
        centroids[dimensionNumber * 64 + centroidNumber] = mass / ((float)INTCONFACTOR * totalCount);
    }
}