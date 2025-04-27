#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void finishCentroids_64(int* centroidMass, unsigned int* centroidCount, float* centroids) {
    int centroidNumber = blockIdx.y * blockDim.y + threadIdx.y;
    int dimensionNumber = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threads are within valid range
    if (centroidNumber < 64 && dimensionNumber < 34) {
        // Use variables to reduce redundant calculations
        int index = dimensionNumber * 64 + centroidNumber;
        float mass = (float)centroidMass[index];
        float totalCount = (float)centroidCount[centroidNumber];
        
        // Calculate the centroid value
        centroids[index] = mass / ((float)INTCONFACTOR * totalCount);
    }
}