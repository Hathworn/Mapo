#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void finishCentroids(int* centroidMass, unsigned int* centroidCount, float* centroids) {
    int centroidNumber = blockIdx.y * blockDim.y + threadIdx.y;
    int dimensionNumber = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to improve access efficiency
    __shared__ float sharedCentroidMass[32 * 34];
    __shared__ unsigned int sharedCentroidCount[32];

    if (centroidNumber < 32) {
        sharedCentroidCount[centroidNumber] = centroidCount[centroidNumber];
    }
    
    int index = dimensionNumber * 32 + centroidNumber;
    if (dimensionNumber < 34) {
        sharedCentroidMass[index] = (float)centroidMass[index];
    }

    __syncthreads(); // Ensure shared memory is fully populated before use

    if ((centroidNumber < 32) && (dimensionNumber < 34)) {
        float totalCount = (float)sharedCentroidCount[centroidNumber];
        float mass = sharedCentroidMass[index];
        centroids[index] = mass / ((float)INTCONFACTOR * totalCount);
    }
}