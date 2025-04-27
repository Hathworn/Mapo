#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void resetParticlesKernel(float3* pos, float3* vel, float* age, float* life, int nParts)
{
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds and update particle properties
    if (idx < nParts) {
        pos[idx] = {0.0f, 0.0f, 0.0f};  // Use direct float assignment
        vel[idx] = {0.0f, 0.0f, 0.0f};  // Use direct float assignment
        age[idx] = 1.0f;               // Explicit float literal
        life[idx] = 1.0f;              // Explicit float literal
    }
}