#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelUpdateParticle(float *positions, float *velocities, float *pBests, float *gBest, float r1, float r2)
{
    // Use shared memory for gBest to reduce global memory access
    __shared__ float sharedGBest[NUM_OF_DIMENSIONS];
    int dim = threadIdx.x % NUM_OF_DIMENSIONS;

    // Load global memory to shared memory
    if (threadIdx.x < NUM_OF_DIMENSIONS) {
        sharedGBest[threadIdx.x] = gBest[threadIdx.x];
    }
    __syncthreads(); // Ensure all threads have updated shared memory

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= NUM_OF_PARTICLES * NUM_OF_DIMENSIONS)
        return;

    float rp = r1;
    float rg = r2;

    // Use shared memory for gBest access
    velocities[i] = OMEGA * velocities[i] + c1 * rp * (pBests[i] - positions[i]) + c2 * rg * (sharedGBest[dim] - positions[i]);
    positions[i] += velocities[i];
}