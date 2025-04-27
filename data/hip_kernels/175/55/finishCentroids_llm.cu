#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void finishCentroids(int* centroidMass, unsigned int* centroidCount, float* centroids) {
    // Calculate 1D index instead of using two separate dimensions
    int idx = blockIdx.y * blockDim.y + threadIdx.y;
    int idy = blockIdx.x * blockDim.x + threadIdx.x;
    int flatIndex = idy * 32 + idx;
    
    // Improved boundary check
    if (idx < 32 && idy < 34) {
        float totalCount = static_cast<float>(centroidCount[idx]);
        float mass = static_cast<float>(centroidMass[flatIndex]);
        centroids[flatIndex] = mass / (static_cast<float>(INTCONFACTOR) * totalCount);
    }
}