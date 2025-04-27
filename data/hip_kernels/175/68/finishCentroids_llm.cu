```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void finishCentroids(int* centroidMass, unsigned int* centroidCount, float* centroids) {
    int centroidNumber = blockIdx.y * blockDim.y + threadIdx.y;
    int dimensionNumber = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundaries once and store commonly used indices
    if (centroidNumber < 64 && dimensionNumber < 34) {
        int idx = dimensionNumber * 64 + centroidNumber;
        float totalCount = static_cast<float>(centroidCount[centroidNumber]);
        float mass = static_cast<float>(centroidMass[idx]);
        centroids[idx] = mass / (static_cast<float>(INTCONFACTOR) * totalCount);
    }
}