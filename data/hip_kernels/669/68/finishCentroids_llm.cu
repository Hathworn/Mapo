#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void finishCentroids(int* centroidMass, unsigned int* centroidCount, float* centroids) {
    // Flatten thread and block indices for 2D grid
    int centroidNumber = blockIdx.y * blockDim.y + threadIdx.y;
    int dimensionNumber = blockIdx.x * blockDim.x + threadIdx.x;
    int index = dimensionNumber * 64 + centroidNumber; // Calculate index once

    // Ensure within bounds
    if (centroidNumber < 64 && dimensionNumber < 34) {
        float totalCount = (float)centroidCount[centroidNumber];
        float mass = (float)centroidMass[index];
        centroids[index] = mass / ((float)INTCONFACTOR * totalCount);
    }
}