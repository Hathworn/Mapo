#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void finishCentroids(int* centroidMass, unsigned int* centroidCount, float* centroids) {
    // Use variables to reduce redundant calculations
    int ty = blockIdx.y * blockDim.y + threadIdx.y;
    int tx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ty < 64 && tx < 34) {
        int idx = tx * 64 + ty;  // Pre-calculate index for memory access
        float mass = static_cast<float>(centroidMass[idx]);
        float totalCount = static_cast<float>(centroidCount[ty]);
        centroids[idx] = mass / (static_cast<float>(INTCONFACTOR) * totalCount);
    }
}