#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void finishCentroids(int* centroidMass, unsigned int* centroidCount, float* centroids) {
    int centroidNumber = blockIdx.y * blockDim.y + threadIdx.y;
    int dimensionNumber = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize checks by using consistent thread/block calculations
    if (centroidNumber < 64 && dimensionNumber < 34) {
        int idx = dimensionNumber * 64 + centroidNumber; // Precompute index
        float totalCount = static_cast<float>(centroidCount[centroidNumber]); // Use static_cast for clarity
        float mass = static_cast<float>(centroidMass[idx]); // Reuse precomputed index
        centroids[idx] = mass / (static_cast<float>(INTCONFACTOR) * totalCount);
    }
}