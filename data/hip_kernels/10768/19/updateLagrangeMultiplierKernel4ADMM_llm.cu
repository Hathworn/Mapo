#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateLagrangeMultiplierKernel4ADMM(float* u, float* v, float* lam, float* temp, float mu, uint32_t w, uint32_t h, uint32_t nc) {
    // Calculate index to avoid redundant computation 
    uint32_t index = threadIdx.x + blockDim.x * blockIdx.x + (threadIdx.y + blockDim.y * blockIdx.y) * w + (threadIdx.z + blockDim.z * blockIdx.z) * w * h;

    // Check if index is within bounds
    if (index < w * h * nc) {
        // Update temp and lam directly using the precalculated index
        float diff = u[index] - v[index]; // Calculate difference only once
        temp[index] = diff;
        lam[index] += diff * mu; // Compound assignment for efficiency
    }
}